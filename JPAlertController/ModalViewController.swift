//
//  ModalViewController.swift
//  JPAlertController
//
//  Created by Joao Souza on 27/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func close(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }

  
  @IBAction func showAlert(_ sender: Any) {
    let titleOptions = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 18.0)!, NSForegroundColorAttributeName: UIColor.blue ]
    
    let messageOptions = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 14.0)!, NSForegroundColorAttributeName: UIColor.red ]
    
    let alert = JPAlertController(title: "Modal", message: "Showing Alert From Modal", titleOptions: titleOptions, messageOptions: messageOptions)
    
    
    let okAction = JPAlertAction(title: "OK", titleOptions: titleOptions, handler: nil)
    alert.addAction(action: okAction)
    
    
    self.present(alert, animated: true, completion: nil)
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
