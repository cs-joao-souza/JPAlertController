//
//  JPButton.swift
//  JPAlertController
//
//  Created by Joao Souza on 27/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit

class JPButton: UIButton {

  var action: JPAlertAction!
  
  // MARK: Constructors
  
  init(action: JPAlertAction) {
    super.init(frame: CGRect.zero)
    self.action = action
    self.translatesAutoresizingMaskIntoConstraints = false
    
    if let titleOptions = action.titleOptions {
      let attributedTitle = NSAttributedString(string: action.title, attributes: titleOptions)
      self.setAttributedTitle(attributedTitle, for: .normal)
      
      var options: [String : Any] = [NSForegroundColorAttributeName: UIColor.gray]
      
      if let font = titleOptions[NSFontAttributeName] {
        options[NSFontAttributeName] = font
      }
      
      let attributedTitleHighlighted = NSAttributedString(string: action.title, attributes: options)
      self.setAttributedTitle(attributedTitleHighlighted, for: .highlighted)
      
    } else {
      self.setTitleColor(UIColor.black, for: .normal)
      self.setTitle(action.title, for: .normal)
      self.setTitleColor(UIColor.gray, for: .highlighted)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
