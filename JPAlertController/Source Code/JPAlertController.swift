//
//  JPAlertController.swift
//  JPAlertController
//
//  Created by Joao Souza on 24/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit

class JPAlertController: UIViewController {
  
  // MARK: Constant
  
  let kButtonHeight: CGFloat = 35.0
  
  // MARK: Members
  
  var message: String!
  var titleOptions:  [String : Any]?
  var messageOptions:  [String : Any]?
  var actions: [JPAlertAction]!
  
  private var buttons: [JPButton]!
  
  private lazy var viewBackground: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    view.layer.cornerRadius = 7
    view.layer.masksToBounds = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var labelTitle: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.font = UIFont.boldSystemFont(ofSize: 15.0)
    label.textAlignment = .center
    label.textColor = UIColor.black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var labelMessage: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 14.0)
    label.textAlignment = .center
    label.textColor = UIColor.black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  // MARK: Constructors
  
  init(title: String, message: String, titleOptions: [String : Any]?, messageOptions: [String: Any]?) {
    super.init(nibName: nil, bundle: nil)
    self.title = title
    self.message = message
    self.titleOptions = titleOptions
    self.messageOptions = messageOptions
    self.actions = []
    self.buttons = [JPButton]()
    
    self.view.addSubview(self.viewBackground)
    self.addViewBackgroundContraints()
    
    configureLabelTitle(titleOptions: titleOptions)
    configureLabelMessage(messageOptions: messageOptions)
       
    configureViewController()
    configureBackground()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Private
  
  private func addViewBackgroundContraints() {
    let widthConstraint = NSLayoutConstraint(item: self.viewBackground, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 270)
    
    let xConstraint = NSLayoutConstraint(item:  self.viewBackground, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
    
    let yConstraint = NSLayoutConstraint(item:  self.viewBackground, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
    
    
    self.view.addConstraints([xConstraint, yConstraint])
    self.viewBackground.addConstraints([widthConstraint])
  }
  
  private func addLabelTitleConstraints() {
    let topConstraint = NSLayoutConstraint(item:  self.labelTitle, attribute: .top, relatedBy: .equal, toItem: self.viewBackground, attribute: .top, multiplier: 1, constant: 10)
    
    let leftConstraint = NSLayoutConstraint(item:  self.labelTitle, attribute: .left, relatedBy: .equal, toItem: self.viewBackground, attribute: .left, multiplier: 1, constant: 10)
    
    let rightConstraint = NSLayoutConstraint(item:  self.labelTitle, attribute: .right, relatedBy: .equal, toItem: self.viewBackground, attribute: .right, multiplier: 1, constant: -10)
    
    self.viewBackground.addConstraints([topConstraint, leftConstraint, rightConstraint])
  }
  
  private func addLabelMessageConstraints() {
    let topConstraint = NSLayoutConstraint(item:  self.labelMessage, attribute: .top, relatedBy: .equal, toItem: self.labelTitle, attribute: .bottom, multiplier: 1, constant: 5)
    
    let leftConstraint = NSLayoutConstraint(item:  self.labelMessage, attribute: .left, relatedBy: .equal, toItem: self.viewBackground, attribute: .left, multiplier: 1, constant: 10)
    
    let rightConstraint = NSLayoutConstraint(item:  self.labelMessage, attribute: .right, relatedBy: .equal, toItem: self.viewBackground, attribute: .right, multiplier: 1, constant: -10)
    
     let bottomConstraint = NSLayoutConstraint(item:  self.labelMessage, attribute: .bottom, relatedBy: .equal, toItem: self.viewBackground, attribute: .bottom, multiplier: 1, constant: -10)
    
    self.viewBackground.addConstraints([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
  }
  
  private func configureLabelTitle(titleOptions: [String:Any]? ) {
    if let titleOptions = titleOptions {
      let attributedTitle = NSAttributedString(string: self.title!, attributes: titleOptions)
      self.labelTitle.attributedText = attributedTitle
    } else {
      self.labelTitle.text = title
    }
    
    self.labelTitle.sizeToFit()
    self.viewBackground.addSubview(self.labelTitle)
    self.addLabelTitleConstraints()
  }
  
  private func configureLabelMessage(messageOptions: [String:Any]?) {
    if let messageOptions = messageOptions {
      let attributedMessage = NSAttributedString(string: self.message, attributes: messageOptions)
      self.labelMessage.attributedText = attributedMessage
    } else {
      self.labelMessage.text = message
    }
    
    self.labelMessage.sizeToFit()
    self.viewBackground.addSubview(self.labelMessage)
    self.addLabelMessageConstraints()
  }
  
  private func configureViewController() {
    self.modalTransitionStyle = .crossDissolve
    self.modalPresentationStyle = .overFullScreen
  }
  
  private func configureBackground() {
    self.view.backgroundColor = UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 70.0/255.0, alpha: 0.3)
  }
  
  private func removeConstraintForView(view : UIView, atrributed: NSLayoutAttribute) {
    for constraint in view.constraints {
      if constraint.firstAttribute == atrributed {
        view.removeConstraint(constraint)
        break
      }
    }
  }
  
  private func removeConstraintForView(view : UIView, secondView: UIView) {
    for constraint in view.constraints {
      if let firstItem = constraint.firstItem as? UIView {
        if firstItem == secondView {
          view.removeConstraint(constraint)          
        }
      }
    }
  }
  
  private func updateUI() {
    removeConstraintForView(view: self.viewBackground, atrributed: .bottom)
    
    if self.actions.count == 1 {
      self.configureButtonActionForOneAction()
    } else if self.actions.count == 2 {
      self.configureButtonActionsForTwoActions()
    } else if self.actions.count > 2 {
      self.configureButtonActionsForThreeOrMoreActions()
    }
  }
  
  private func configureButtonActionForOneAction() {
    if let firstAction = self.actions.first {
      let buttonAction = JPButton(action: firstAction)
      buttonAction.addTarget(self, action: #selector(JPAlertController.buttonPressed(sender:)), for: .touchUpInside)
      
      self.viewBackground.addSubview(buttonAction)
      
      let heightConstraint = NSLayoutConstraint(item: buttonAction, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: kButtonHeight)
      
      let topConstraint = NSLayoutConstraint(item:  buttonAction, attribute: .top, relatedBy: .equal, toItem: self.labelMessage, attribute: .bottom, multiplier: 1, constant: 10)
      
      let leftConstraint = NSLayoutConstraint(item:  buttonAction, attribute: .left, relatedBy: .equal, toItem: self.viewBackground, attribute: .left, multiplier: 1, constant: 0)
      
      let rightConstraint = NSLayoutConstraint(item:  buttonAction, attribute: .right, relatedBy: .equal, toItem: self.viewBackground, attribute: .right, multiplier: 1, constant: 0)
      
      let bottomConstraint = NSLayoutConstraint(item:  buttonAction, attribute: .bottom, relatedBy: .equal, toItem: self.viewBackground, attribute: .bottom, multiplier: 1, constant: 0)
      
      self.viewBackground.addConstraints([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
      buttonAction.addConstraint(heightConstraint)
      
      self.buttons.append(buttonAction)
    }
  }
  
  private func configureButtonActionsForTwoActions() {
    if let firstAction = self.actions.first, let secondAction = self.actions.last {
      self.removeButtons()
      
      let buttonActionFirst = JPButton(action: firstAction)
      buttonActionFirst.addTarget(self, action: #selector(JPAlertController.buttonPressed(sender:)), for: .touchUpInside)
      
      let buttonActionSecond = JPButton(action: secondAction)
      buttonActionSecond.addTarget(self, action: #selector(JPAlertController.buttonPressed(sender:)), for: .touchUpInside)
      
      self.viewBackground.addSubview(buttonActionFirst)
      self.viewBackground.addSubview(buttonActionSecond)
      
      
      let heightConstraintFirstButton = NSLayoutConstraint(item: buttonActionFirst, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: kButtonHeight)
      
      let topConstraintFirstButton = NSLayoutConstraint(item:  buttonActionFirst, attribute: .top, relatedBy: .equal, toItem: self.labelMessage, attribute: .bottom, multiplier: 1, constant: 10)
      
      let leftConstraintFirstButton = NSLayoutConstraint(item:  buttonActionFirst, attribute: .left, relatedBy: .equal, toItem: self.viewBackground, attribute: .left, multiplier: 1, constant: 0)
      
      let rightConstraintFirstButton = NSLayoutConstraint(item:  buttonActionFirst, attribute: .right, relatedBy: .equal, toItem: buttonActionSecond, attribute: .left, multiplier: 1, constant: 0)
      
      let bottomConstraintFirstButton = NSLayoutConstraint(item:  buttonActionFirst, attribute: .bottom, relatedBy: .equal, toItem: self.viewBackground, attribute: .bottom, multiplier: 1, constant: 0)
      
      self.viewBackground.addConstraints([topConstraintFirstButton, leftConstraintFirstButton, rightConstraintFirstButton, bottomConstraintFirstButton])
      buttonActionFirst.addConstraint(heightConstraintFirstButton)
      
      // SECOND BUTTON
      
      let heightConstraintSecondButton = NSLayoutConstraint(item: buttonActionSecond, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: kButtonHeight)
      
      let topConstraintSecondButton = NSLayoutConstraint(item:  buttonActionSecond, attribute: .top, relatedBy: .equal, toItem: self.labelMessage, attribute: .bottom, multiplier: 1, constant: 10)
      
      let leftConstraintSecondButton = NSLayoutConstraint(item:  buttonActionSecond, attribute: .left, relatedBy: .equal, toItem: buttonActionFirst, attribute: .right, multiplier: 1, constant: 0)
      
      let rightConstraintSecondButton = NSLayoutConstraint(item:  buttonActionSecond, attribute: .right, relatedBy: .equal, toItem: self.viewBackground, attribute: .right, multiplier: 1, constant: 0)
      
      let bottomConstraintSecondButton = NSLayoutConstraint(item:  buttonActionSecond, attribute: .bottom, relatedBy: .equal, toItem: self.viewBackground, attribute: .bottom, multiplier: 1, constant: 0)
      
      self.viewBackground.addConstraints([topConstraintSecondButton, leftConstraintSecondButton, rightConstraintSecondButton, bottomConstraintSecondButton])
      buttonActionSecond.addConstraint(heightConstraintSecondButton)
      
      let equalConstraintButtons = NSLayoutConstraint(item:  buttonActionSecond, attribute: .width, relatedBy: .equal, toItem: buttonActionFirst, attribute: .width, multiplier: 1, constant: 0)
      
      self.viewBackground.addConstraint(equalConstraintButtons)
      
      self.buttons.append(buttonActionFirst)
      self.buttons.append(buttonActionSecond)
    }
  }
  
  private func removeButtons() {
    for button in self.buttons {
      self.removeConstraintForView(view: self.viewBackground, secondView: button)
      button.removeConstraints(button.constraints)
      button.removeFromSuperview()
    }
    
    self.buttons.removeAll()
  }
  
  private func configureButtonActionsForThreeOrMoreActions() {
    var viewLast: UIView!
    self.removeButtons()
    
    for i in 0 ..< self.actions.count {
      let buttonAction = JPButton(action: self.actions[i])
      
      buttonAction.addTarget(self, action: #selector(JPAlertController.buttonPressed(sender:)), for: .touchUpInside)
      
      self.viewBackground.addSubview(buttonAction)
      
      let topConstraint: NSLayoutConstraint!
      
      let heightConstraint = NSLayoutConstraint(item: buttonAction, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: kButtonHeight)
      
      if viewLast == nil {
        topConstraint = NSLayoutConstraint(item:  buttonAction, attribute: .top, relatedBy: .equal, toItem: self.labelMessage, attribute: .bottom, multiplier: 1, constant: 10)
      } else {
        topConstraint = NSLayoutConstraint(item:  buttonAction, attribute: .top, relatedBy: .equal, toItem: viewLast, attribute: .bottom, multiplier: 1, constant: 10)
      }
      
      let leftConstraint = NSLayoutConstraint(item:  buttonAction, attribute: .left, relatedBy: .equal, toItem: self.viewBackground, attribute: .left, multiplier: 1, constant: 0)
      
      let rightConstraint = NSLayoutConstraint(item:  buttonAction, attribute: .right, relatedBy: .equal, toItem: self.viewBackground, attribute: .right, multiplier: 1, constant: 0)
      
      
      if i == self.actions.count - 1 {
        let bottomConstraint = NSLayoutConstraint(item:  buttonAction, attribute: .bottom, relatedBy: .equal, toItem: self.viewBackground, attribute: .bottom, multiplier: 1, constant: 0)
        self.viewBackground.addConstraints([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
      } else {
        self.viewBackground.addConstraints([topConstraint, leftConstraint, rightConstraint])
      }
      
      buttonAction.addConstraint(heightConstraint)
      
      self.buttons.append(buttonAction)
      viewLast = buttonAction
    }
  }
  
  // MARK: Public
  
  func addAction(action: JPAlertAction) {
    actions.append(action)
    updateUI()
  }
  
  // MARK: Actions
  
  func buttonPressed(sender: JPButton) {
    if let handler = sender.action.handler {
      self.dismiss(animated: true, completion: { 
        handler(sender.action)
      })
    } else {
      self.dismiss(animated: true, completion: nil)
    }
  }
  
}
