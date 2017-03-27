//
//  JPAlertAction.swift
//  JPAlertController
//
//  Created by Joao Souza on 24/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit

class JPAlertAction: NSObject {

  var title: String!
  var titleOptions: [String : Any]?
  
  public private(set) var handler:  ((JPAlertAction) -> ())?
  
  init(title: String, titleOptions: [String : Any]?, handler: ((JPAlertAction) -> ())? ) {
    self.title = title
    self.titleOptions = titleOptions
    self.handler = handler
  }
}
