//
//  ViewController.swift
//  JPAlertController
//
//  Created by Joao Souza on 24/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func showAlert(_ sender: Any) {
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
  }

  
  @IBAction func showAlertWithThreeButtons(_ sender: Any) {
    
    let titleOptions = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 18.0)!, NSForegroundColorAttributeName: UIColor.blue ]
    
    let messageOptions = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 14.0)!, NSForegroundColorAttributeName: UIColor.red ]
    
    let alert = JPAlertController(title: "Alert", message: "This is a JPAlertController. You can customize font, color and everything that an AttributedString accept. Just send the attributed string options in the constructor.", titleOptions: titleOptions, messageOptions: messageOptions)
    
    
    let firstAction = JPAlertAction(title: "One", titleOptions: titleOptions, handler: nil)
    alert.addAction(action: firstAction)
    
    
    let secondOptions = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 14.0)!, NSForegroundColorAttributeName: UIColor.red ]
    
    let secondAction = JPAlertAction(title: "Two", titleOptions: secondOptions, handler: nil)
    alert.addAction(action: secondAction)
    
    let thirdAction = JPAlertAction(title: "Third", titleOptions: nil, handler: nil)
    alert.addAction(action: thirdAction)
    
    self.present(alert, animated: true, completion: nil)
  }
  
  
}

