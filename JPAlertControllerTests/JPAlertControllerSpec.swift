//
//  JPAlertControllerSpec.swift
//  JPAlertController
//
//  Created by Joao Souza on 24/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import Quick
import Nimble
@testable import JPAlertController

class JPAlertControllerSpec: QuickSpec {
  override func spec() {
    describe("JPAlertController") {
      var jpAlertController: JPAlertController!
      
      context("When the constructor is called") {
        
        beforeEach {
           jpAlertController = JPAlertController(title: "Error", message: "Error Message", titleOptions: ["": "" as AnyObject], messageOptions: ["": "" as AnyObject])
        }
        
        it("Should fill all propeties correctly") {
          expect(jpAlertController.title).to(equal("Error"))
          expect(jpAlertController.message).to(equal("Error Message"))
          expect(jpAlertController.titleOptions).toNot(beNil())
          expect(jpAlertController.messageOptions).toNot(beNil())
          expect(jpAlertController.actions).toNot(beNil())
        }
        
        it("Should change view's background color to gray") {
          let color = UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 70.0/255.0, alpha: 0.3)
          let colorEquals = color.cgColor == jpAlertController.view.backgroundColor!.cgColor
          expect(colorEquals).to(beTrue())
        }
        
        it("Should change modal presentation style") {
          expect(jpAlertController.modalPresentationStyle).to(equal(UIModalPresentationStyle.overFullScreen))
        }
        
        it("Should change modal transition style") {
          expect(jpAlertController.modalTransitionStyle).to(equal(UIModalTransitionStyle.crossDissolve))
        }
        
        it("Should add all default components") {
          expect(jpAlertController.view.subviews.count).to(equal(1))
          expect(jpAlertController.view.subviews.first!.subviews.count).to(equal(2))
        }
      }
      
      context("When an action is added") {
        beforeEach {
          jpAlertController = JPAlertController(title: "Error", message: "Error Message", titleOptions: ["": "" as AnyObject], messageOptions: ["": "" as AnyObject])
          
          let action = JPAlertAction(title: "OK", titleOptions: ["": "" as AnyObject], handler: nil)
          
          jpAlertController.addAction(action: action)
        }
        
        it("Should add an action to the array") {
          expect(jpAlertController.actions.count).to(equal(1))
        }
      }
      
      context("When a button is pressed") {
        
        var jpAlertControllerMock: JPAlertControllerMock!
        var jpButton: JPButton!
        var handlerWasCalled = false
        var action: JPAlertAction!
        
        beforeEach {
          jpAlertControllerMock = JPAlertControllerMock(title: "Error", message: "Error Message", titleOptions: ["": "" as AnyObject], messageOptions: ["": "" as AnyObject])
          
          action = JPAlertAction(title: "OK", titleOptions: ["": "" as AnyObject], handler: { (action) in
            print("asldalskdjla asl action")
            handlerWasCalled = true
          })
          
          jpButton = JPButton(action: action)
          jpAlertControllerMock.buttonPressed(sender: jpButton)
          
        }
        
        it("Should call dismiss") {
          expect(jpAlertControllerMock.dismissWasCalled).to(beTrue())
        }
        
        it("Should call handler") {
          expect(handlerWasCalled).toEventually(beTrue(), timeout: 10)
        }
      }
      
    }
  }
}
