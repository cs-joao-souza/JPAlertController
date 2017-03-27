//
//  JPAlertActionSpec.swift
//  JPAlertController
//
//  Created by Joao Souza on 24/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import Quick
import Nimble
@testable import JPAlertController

class JPAlertActionSpec: QuickSpec {
  override func spec() {
    describe("JPAlertActionSpec") {
      var jpAlertAction: JPAlertAction!
      
      context("When the constructor is called") {
        jpAlertAction = JPAlertAction(title: "OK", titleOptions: ["": "" as AnyObject]) { action in 
          
        }
        
        it("Should fill all propeties correctly") {
          expect(jpAlertAction.title).to(equal("OK"))
          expect(jpAlertAction.titleOptions).toNot(beNil())
          expect(jpAlertAction.handler).toNot(beNil())
        }
      }

    }
  }
}
