/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
import Photos
import Firebase
import JSQMessagesViewController

final class ChatViewController: JSQMessagesViewController {
  
  // MARK: Properties
  private let imageURLNotSetKey = "uploads/docta.jpg"
  
  var channelRef: DatabaseReference?

  private lazy var messageRef: DatabaseReference = self.channelRef!.child("messages")
  fileprivate lazy var storageRef: StorageReference = Storage.storage().reference(forURL: "gs://doctaconsumer.appspot.com/")
  private lazy var userIsTypingRef: DatabaseReference = self.channelRef!.child("typingIndicator").child(self.senderId)
  private lazy var usersTypingQuery: DatabaseQuery = self.channelRef!.child("typingIndicator").queryOrderedByValue().queryEqual(toValue: true)

  private var newMessageRefHandle: DatabaseHandle?
  private var updatedMessageRefHandle: DatabaseHandle?
  
  private var messages: [JSQMessage] = []
  private var photoMessageMap = [String: JSQPhotoMediaItem]()
  
  private var localTyping = false
  var channel: Channel? {
    didSet {
    //  title = channel?.name
    }
  }

  var isTyping: Bool {
    get {
      return localTyping
    }
    set {
      localTyping = newValue
      userIsTypingRef.setValue(newValue)
    }
  }
  
  lazy var outgoingBubbleImageView: JSQMessagesBubbleImage = self.setupOutgoingBubble()
  lazy var incomingBubbleImageView: JSQMessagesBubbleImage = self.setupIncomingBubble()
  
  // MARK: View Lifecycle
  
    @IBAction func backAction(_ sender: UIButton) {
    
    self.navigationController?.popToRootViewController(animated: true)
    
    }
    
  override func viewDidLoad() {
    
    
    super.viewDidLoad()
   // let backButton1 = UIBarButtonItem.init(image: UIImage.init(named: "BackButton"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(backAction(_:)))
    let backButton = UIBarButtonItem.init(title: "Close Chat", style: UIBarButtonItemStyle.plain, target: self, action: #selector(backAction(_:)))
    
    
    self.navigationItem.hidesBackButton = true
    self.navigationItem.rightBarButtonItem = backButton
    self.collectionView!.register(CustomChatCollectionViewCell.self, forCellWithReuseIdentifier: "ButtonCell")
    
    
    
    self.senderId = Auth.auth().currentUser?.uid
    observeMessages()
    
    // No avatars
    collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSize.init(width: 30, height: 30)
    collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    observeTyping()
  }
  
  deinit {
    if let refHandle = newMessageRefHandle {
      messageRef.removeObserver(withHandle: refHandle)
    }
    if let refHandle = updatedMessageRefHandle {
      messageRef.removeObserver(withHandle: refHandle)
    }
  }
  
  // MARK: Collection view data source (and related) methods
  
  override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
    return messages[indexPath.item]
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return messages.count
  }
  
  override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
    let message = messages[indexPath.item] // 1
    if message.senderId == senderId { // 2
     // return nil
      return outgoingBubbleImageView
    } else { // 3
      
    return incomingBubbleImageView
    }
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! JSQMessagesCollectionViewCell
    let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as! CustomChatCollectionViewCell
    cell2.delegate = collectionView as! JSQMessagesCollectionViewCellDelegate
    let message = messages[indexPath.item]
    
    if message.senderId == senderId { // 1
        
      cell.textView?.textColor = UIColor.white // 2
    return cell
    } else {
    
     // cell.textView?.textColor = UIColor.white // 3
    return cell2
    }
    
    
  }
  
  override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
    let message = messages[indexPath.item] // 1
    if message.senderId != senderId { // 2
    return JSQMessagesAvatarImageFactory.avatarImage(with: UIImage.init(named: "DoctaChatAvatar"), diameter: 30)
    }
    else {
        return nil
    }
  }
  
  override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat {
    return 15
  }
  
  override func collectionView(_ collectionView: JSQMessagesCollectionView?, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString? {
    let message = messages[indexPath.item]
    switch message.senderId {
    case senderId:
      return nil
    default:
      guard let senderDisplayName = message.senderDisplayName else {
        assertionFailure()
        return nil
      }
      return NSAttributedString(string: senderDisplayName)
    }
  }

  // MARK: Firebase related methods
  
  private func observeMessages() {
    messageRef = channelRef!.child("messages")
    let messageQuery = messageRef.queryLimited(toLast:25)
    if self.messages.count == 0 {
        self.addMessage(withId: "foo", name: "Dr Docta", text: "Hello, I am Dr. Docta, How may I assist you? ")
        
    }
    
    // We can use the observe method to listen for new
    // messages being written to the Firebase DB
    newMessageRefHandle = messageQuery.observe(.childAdded, with: { (snapshot) -> Void in
      let messageData = snapshot.value as! Dictionary<String, String>
        
        
        

      if let id = messageData["senderId"] as String!, let name = messageData["senderName"] as String!, let text = messageData["text"] as String!, text.characters.count > 0 {
        self.addMessage(withId: id, name: name, text: text)
        print("Total Number of messages are \(self.messages.count)")
        switch (self.messages.count) {
            
            
        case 2:
            self.addMessage(withId: "foo", name: "Dr Docta", text: "Ok, Tell me patient first name")
            
            
            
            break
        case 4:
            self.addMessage(withId: "foo", name: "Dr Docta", text: "What is your problem? Please Explain ")
            break
        case 6:
            self.addMessage(withId: "foo", name: "Dr Docta", text: "Thanks for reporting, Your case file 219943 is generated and Doctors will respond back to you ")
            break
            
        case 8:
            self.addMessage(withId: "foo", name: "Dr Docta", text: "Please upload pictures related to case")
            break
        default:
          //  self.addMessage(withId: "foo", name: "Dr Docta", text: "Hi \(name), Please pay the 99$ fee soon to continue treatment")
            let alert = UIAlertController(title: "Payment Pending", message: "Please pay the 10$ fee soon to continue treatment", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Proceed to Payment", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            
            
            
            break
            
            
        }
        
        
        print("Total Number of messages at end are \(self.messages.count)")
        
        self.finishReceivingMessage()
      } else if let id = messageData["senderId"] as String!, let photoURL = messageData["photoURL"] as String! {
        if let mediaItem = JSQPhotoMediaItem(maskAsOutgoing: id == self.senderId) {
          self.addPhotoMessage(withId: id, key: snapshot.key, mediaItem: mediaItem)
          
          if photoURL.hasPrefix("gs://doctaconsumer.appspot.com") {
            self.fetchImageDataAtURL(photoURL, forMediaItem: mediaItem, clearsPhotoMessageMapOnSuccessForKey: nil)
          }
        }
      } else {
        print("Error! Could not decode message data")
      }
    })
    
    // We can also use the observer method to listen for
    // changes to existing messages.
    // We use this to be notified when a photo has been stored
    // to the Firebase Storage, so we can update the message data
    updatedMessageRefHandle = messageRef.observe(.childChanged, with: { (snapshot) in
      let key = snapshot.key
      let messageData = snapshot.value as! Dictionary<String, String>
      
      if let photoURL = messageData["photoURL"] as String! {
        // The photo has been updated.
        if let mediaItem = self.photoMessageMap[key] {
          self.fetchImageDataAtURL(photoURL, forMediaItem: mediaItem, clearsPhotoMessageMapOnSuccessForKey: key)
        }
      }
    })
  }
  
  private func fetchImageDataAtURL(_ photoURL: String, forMediaItem mediaItem: JSQPhotoMediaItem, clearsPhotoMessageMapOnSuccessForKey key: String?) {
    let storageRef = Storage.storage().reference(forURL: photoURL)
    
    
    storageRef.getData(maxSize: INT64_MAX){ (data, error) in
      if let error = error {
        print("Error downloading image data: \(error)")
        return
      }
      
      
      storageRef.getMetadata(completion: { (metadata, metadataErr) in
        if let error = metadataErr {
          print("Error downloading metadata: \(error)")
          return
        }
        
        if (metadata?.contentType == "image/gif") {
          mediaItem.image = UIImage.gifWithData(data!)
        } else {
          mediaItem.image = UIImage.init(data: data!)
        }
        self.collectionView.reloadData()
        
        guard key != nil else {
          return
        }
        self.photoMessageMap.removeValue(forKey: key!)
      })
    }
  }
  
  private func observeTyping() {
    let typingIndicatorRef = channelRef!.child("typingIndicator")
    userIsTypingRef = typingIndicatorRef.child(senderId)
    userIsTypingRef.onDisconnectRemoveValue()
    usersTypingQuery = typingIndicatorRef.queryOrderedByValue().queryEqual(toValue: true)
    
    usersTypingQuery.observe(.value) { (data: DataSnapshot) in
      
      // You're the only typing, don't show the indicator
      if data.childrenCount == 1 && self.isTyping {
        return
      }
      
      // Are there others typing?
      self.showTypingIndicator = data.childrenCount > 0
      self.scrollToBottom(animated: true)
    }
  }
  
  override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
    // 1
    let itemRef = messageRef.childByAutoId()
    
    // 2
    let messageItem = [
      "senderId": senderId!,
      "senderName": senderDisplayName!,
      "text": text!,
    ]
    
    // 3
    itemRef.setValue(messageItem)
    
    // 4
    JSQSystemSoundPlayer.jsq_playMessageSentSound()
    
    // 5
    finishSendingMessage()
    isTyping = false
  }
  
  func sendPhotoMessage() -> String? {
    let itemRef = messageRef.childByAutoId()
    
    let messageItem = [
      "photoURL": imageURLNotSetKey,
      "senderId": senderId!,
      ]
    
    itemRef.setValue(messageItem)
    
    JSQSystemSoundPlayer.jsq_playMessageSentSound()
    
    finishSendingMessage()
    return itemRef.key
  }
  
  func setImageURL(_ url: String, forPhotoMessageWithKey key: String) {
    let itemRef = messageRef.child(key)
    itemRef.updateChildValues(["photoURL": url])
  }
  
  // MARK: UI and User Interaction
  
  private func setupOutgoingBubble() -> JSQMessagesBubbleImage {
    let bubbleImageFactory = JSQMessagesBubbleImageFactory()
    return bubbleImageFactory!.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleGreen())
  }

  private func setupIncomingBubble() -> JSQMessagesBubbleImage {
    let bubbleImageFactory = JSQMessagesBubbleImageFactory()
    return bubbleImageFactory!.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
  }
    
    
    

  override func didPressAccessoryButton(_ sender: UIButton) {
    let picker = UIImagePickerController()
    picker.delegate = self
    if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)) {
      picker.sourceType = UIImagePickerControllerSourceType.camera
        
        
    } else {
      picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
    }
    
    present(picker, animated: true, completion:nil)
    
  }
    
    
    
  
  private func addMessage(withId id: String, name: String, text: String) {
    if let message = JSQMessage(senderId: id, displayName: name, text: text) {
      messages.append(message)      
    }
  }
  
  private func addPhotoMessage(withId id: String, key: String, mediaItem: JSQPhotoMediaItem) {
    if let message = JSQMessage(senderId: id, displayName: "", media: mediaItem) {
      messages.append(message)
      
      if (mediaItem.image == nil) {
        photoMessageMap[key] = mediaItem
      }
      
      collectionView.reloadData()
    }
  }
  
  // MARK: UITextViewDelegate methods
  
  override func textViewDidChange(_ textView: UITextView) {
    super.textViewDidChange(textView)
    // If the text is not empty, the user is typing
    isTyping = textView.text != ""
  }
  
}

// MARK: Image Picker Delegate
extension ChatViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [String : Any]) {

    picker.dismiss(animated: true, completion:nil)

    // 1
    if let photoReferenceUrl = info[UIImagePickerControllerReferenceURL] as? URL {
      // Handle picking a Photo from the Photo Library
      // 2
      let assets = PHAsset.fetchAssets(withALAssetURLs: [photoReferenceUrl], options: nil)
      let asset = assets.firstObject

      // 3
      if let key = sendPhotoMessage() {
        // 4
        asset?.requestContentEditingInput(with: nil, completionHandler: { (contentEditingInput, info) in
          let imageFileURL = contentEditingInput?.fullSizeImageURL

          // 5
            let path : String = "\(String(describing: Auth.auth().currentUser?.uid))/\(Int(Date.timeIntervalSinceReferenceDate * 1000))/\(photoReferenceUrl.lastPathComponent)" 

          // 6
          self.storageRef.child(path).putFile(from: imageFileURL!, metadata: nil) { (metadata, error) in
            if let error = error {
              print("Error uploading photo: \(error.localizedDescription)")
              return
            }
            
            // 7
            self.setImageURL(self.storageRef.child((metadata?.path)!).description, forPhotoMessageWithKey: key)
          }
        })
      }
    } else {
        print("Camera Button pressed")
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        
        dismiss(animated:true, completion: nil)
        
        if let photoReference: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage{
            // Handle picking a Photo from the Photo Library
            // 2
            let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
            let asset = assets.firstObject
            
            // 3
            if let key = sendPhotoMessage() {
                // 4
                asset?.requestContentEditingInput(with: nil, completionHandler: { (contentEditingInput, info) in
                    let imageFileURL = contentEditingInput?.fullSizeImageURL
                    
                    // 5
                    let path : String = "\(String(describing: Auth.auth().currentUser?.uid))/\(Int(Date.timeIntervalSinceReferenceDate * 1000))/\(photoReference)"
                    
                    // 6
                    
                    let imageData = UIImageJPEGRepresentation(photoReference, 0.1)
                    let uploadTask = self.storageRef.child(path).putData(imageData!, metadata: nil, completion: { (metadata, error) in
                        // Your code here
                        if let error = error {
                            print("Error uploading photo: \(error.localizedDescription)")
                            return
                        }
                        
                        // 7
                        self.setImageURL(self.storageRef.child((metadata?.path)!).description, forPhotoMessageWithKey: key)
                    })
                   // }

                 //   }
                    
//                    self.storageRef.child(path).putFile(from: imageFileURL!, metadata: nil) { (metadata, error) in
//                        if let error = error {
//                            print("Error uploading photo: \(error.localizedDescription)")
//                            return
//                        }
//                        
//                        // 7
//                        self.setImageURL(self.storageRef.child((metadata?.path)!).description, forPhotoMessageWithKey: key)
//                    }
                })
            }

        
        
        
        
      // Handle picking a Photo from the Camera - TODO
 }
  }

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion:nil)
  }
}
}
