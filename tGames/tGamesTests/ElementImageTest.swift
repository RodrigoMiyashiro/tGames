//
//  ElementImageTest.swift
//  tGamesTests
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import tGames

class ElementImageTest: QuickSpec
{
    override func spec()
    {
        describe("Images")
        {
            context("after being properly initialized")
            {
                let images = ElementImage()
                
                it("should not be nil")
                {
                    expect(images).toNot(beNil())
                }
            }
            
            
            context("after being properly initialized to request images")
            {
                let images = ElementImage(large: "https://static-cdn.jtvnw.net/ttv-logoart/Monster%20Hunter%20World-240x144.jpg", medium: "https://static-cdn.jtvnw.net/ttv-logoart/Monster%20Hunter%20World-120x72.jpg", small: "https://static-cdn.jtvnw.net/ttv-logoart/Monster%20Hunter%20World-60x36.jpg", template: "https://static-cdn.jtvnw.net/ttv-logoart/Monster%20Hunter%20World-{width}x{height}.jpg")
                
                it("should not have nil")
                {
                    expect(images).notTo(beNil())
                }
                
                it("should have a url image for each image size: large")
                {
                        expect(images.large).to(equal("https://static-cdn.jtvnw.net/ttv-logoart/Monster%20Hunter%20World-240x144.jpg"))
                }
                
                it("should have a url image for each image size: medium")
                {
                    expect(images.medium).to(equal("https://static-cdn.jtvnw.net/ttv-logoart/Monster%20Hunter%20World-120x72.jpg"))
                }
                
                it("should have a url image for each image size: small")
                {
                    expect(images.small).to(equal("https://static-cdn.jtvnw.net/ttv-logoart/Monster%20Hunter%20World-60x36.jpg"))
                }
                
                it("should have a url image for each image size: template")
                {
                    expect(images.template).to(equal("https://static-cdn.jtvnw.net/ttv-logoart/Monster%20Hunter%20World-{width}x{height}.jpg"))
                }
            }
        }
    }
    
}
