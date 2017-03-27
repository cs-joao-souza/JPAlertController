//
//  JPButtonSpec.swift
//  JPAlertController
//
//  Created by Joao Souza on 27/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import Quick
import Nimble
@testable import JPAlertController

class JPButtonSpec: QuickSpec {
  override func spec() {
    describe("JPButtonSpec") {
      var jpAlertAction: JPAlertAction!
      var jpButton: JPButton!
      
      context("When the constructor is called with options") {
        beforeEach {
          jpAlertAction = JPAlertAction(title: "OK", titleOptions: [ NSForegroundColorAttributeName : UIColor.red, NSFontAttributeName : UIFont(name: "Chalkduster", size: 14.0)!] ) { action in
          }
          jpButton = JPButton(action: jpAlertAction)
        }
        
        
        it("Should configure all properties right") {
          expect(jpButton.action).toNot(beNil())
          expect(jpButton.translatesAutoresizingMaskIntoConstraints).to(beFalse())
        }
        
        it("Should configure button correctly") {
          expect(jpButton.attributedTitle(for: .normal)).toNot(beNil())
          expect(jpButton.attributedTitle(for: .normal)!.string).to(equal("OK"))
          var attributes = jpButton.attributedTitle(for: .normal)!.attributes(at: 0, longestEffectiveRange: nil, in: NSRange(location: 0, length: jpButton.attributedTitle(for: .normal)!.length))
          expect(attributes[NSForegroundColorAttributeName]).toNot(beNil())
          expect(attributes[NSFontAttributeName]).toNot(beNil())
          
          expect(jpButton.attributedTitle(for: .highlighted)!.string).to(equal("OK"))
          var highlightedAttributes = jpButton.attributedTitle(for: .highlighted)!.attributes(at: 0, longestEffectiveRange: nil, in: NSRange(location: 0, length: jpButton.attributedTitle(for: .normal)!.length))
          expect(highlightedAttributes[NSForegroundColorAttributeName]).toNot(beNil())
          expect(highlightedAttributes[NSFontAttributeName]).toNot(beNil())
          
          let highlightedColor = highlightedAttributes[NSForegroundColorAttributeName] as! UIColor
          let colorEquals = highlightedColor.cgColor == UIColor.gray.cgColor
          expect(colorEquals).to(beTrue())
          
          let font = attributes[NSFontAttributeName] as! UIFont
          let highlightedFont = highlightedAttributes[NSFontAttributeName] as! UIFont
          expect(font.fontName).to(equal(highlightedFont.fontName))
          expect(font.pointSize).to(equal(highlightedFont.pointSize))

        }
      }
      
      context("When the constructor is called without options") {
        beforeEach {
          jpAlertAction = JPAlertAction(title: "OK", titleOptions: nil, handler: nil)
          jpButton = JPButton(action: jpAlertAction)
        }
        
        it("Should configure all properties right") {
          expect(jpButton.action).toNot(beNil())
          expect(jpButton.translatesAutoresizingMaskIntoConstraints).to(beFalse())
        }
        
        it("Should configure button correctly") {
          expect(jpButton.title(for: .normal)).toNot(beNil())
          expect(jpButton.title(for: .normal)).to(equal("OK"))
          
          expect(jpButton.titleColor(for: .normal)!.cgColor == UIColor.black.cgColor).to(beTrue())
          expect(jpButton.titleColor(for: .highlighted)!.cgColor == UIColor.gray.cgColor).to(beTrue())
        }
      }
      
    }
  }
}
