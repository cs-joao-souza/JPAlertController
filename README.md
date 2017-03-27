# JPAlertController

JPAlertController is Swift alert all customizable. It's usage look like UIAlertController usage.</br>
Using JPAlertController you can customize every text in your alert just sending some options in the constructor.</br>

# Screenshots

![ScreenShot](https://raw.github.com/cs-joao-souza/JPAlertController/master/ScreenShot1.png)
![ScreenShot](https://raw.github.com/cs-joao-souza/JPAlertController/master/ScreenShot2.png)

# Usage

It's usage is very similar to UIAlertController. The difference is that is possible to pass options to configure your text as you want. These options need to be NSAttributedString attributes. So is possible to use:</br>
* NSFontAttributeName</br>
* NSParagraphStyleAttributeName</br>
* NSForegroundColorAttributeName</br>
* NSBackgroundColorAttributeName</br>
* NSLigatureAttributeName</br>
* NSKernAttributeName</br>
* NSStrikethroughStyleAttributeName</br>
* NSUnderlineStyleAttributeName</br>
* NSStrokeColorAttributeName</br>
* NSStrokeWidthAttributeName</br>
* NSShadowAttributeName</br>
* NSTextEffectAttributeName</br>
* NSAttachmentAttributeName</br>
* NSLinkAttributeName</br>
* NSBaselineOffsetAttributeName</br>
* NSBaselineOffsetAttributeName</br>
* ...</br>
* and so on.</br>


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

# Installation

## Cocoapods

JPAlertController is available through CocoaPods. To install it, simply add the following line to your Podfile:

```
pod 'JPAlertController'
```

## Manual

Just copy and paste the files inside source code files into your project.

# Todo

* Add separators</br>
* Let it be able to customize the background<br>

# License

JPAlertController is available under the MIT license. See the LICENSE file for more info.
