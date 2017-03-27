# JPAlertController

JPAlertController is Swift alert all customizable. It's usage look like UIAlertController usage.</br>
Using JPAlertController you can customize every text in your alert just sending some options in the constructor.</br>

# Screenshots

![ScreenShot](https://raw.github.com/cs-joao-souza/JPAlertController/master/ScreenShot1.png)
![ScreenShot](https://raw.github.com/cs-joao-souza/JPAlertController/master/ScreenShot2.png)

# Usage

It's usage is very similar to UIAlertController. The difference is that is possible to pass options to configure your text as you want.</br>
These options need to be NSAttributedString attributes. So is possible do use for example</br>
*NSFontAttributeName
*NSParagraphStyleAttributeName
*NSForegroundColorAttributeName
*NSBackgroundColorAttributeName
*NSLigatureAttributeName
*NSKernAttributeName
*NSStrikethroughStyleAttributeName
*NSUnderlineStyleAttributeName
*NSStrokeColorAttributeName
*NSStrokeWidthAttributeName
*NSShadowAttributeName
*NSTextEffectAttributeName
*NSAttachmentAttributeName
*NSLinkAttributeName
*NSBaselineOffsetAttributeName
*NSBaselineOffsetAttributeName
*...
*and so on.


```swift
let titleOptions = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 18.0)!, NSForegroundColorAttributeName: UIColor.blue ]
    
let messageOptions = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 14.0)!, NSForegroundColorAttributeName: UIColor.red ]
    
let alert = JPAlertController(title: "Alert", message: "This is a customizable Alert", titleOptions: titleOptions, messageOptions: messageOptions)
    
    
let okAction = JPAlertAction(title: "OK", titleOptions: titleOptions) { action in
    print("OK action")
}
    
alert.addAction(action: okAction)
    
    
let cancelOptions = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 14.0)!, NSForegroundColorAttributeName: UIColor.red ]
    
let cancelAction = JPAlertAction(title: "Cancel", titleOptions: cancelOptions) { action in
  print("Cancel action")
}
    
alert.addAction(action: cancelAction)
    
self.present(alert, animated: true, completion: nil)
```
