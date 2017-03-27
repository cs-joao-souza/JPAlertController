//
//  JPAlertControllerMock.swift
//  JPAlertController
//
//  Created by Joao Souza on 27/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit
@testable import JPAlertController

class JPAlertControllerMock: JPAlertController {

  var dismissWasCalled = false
  
  override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
    dismissWasCalled = true
    completion?()
  }

}
