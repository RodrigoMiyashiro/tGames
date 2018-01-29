//
//  GeneratorURLTest.swift
//  tGamesTests
//
//  Created by Rodrigo Miyashiro on 27/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import tGames

class GeneratorURLTest: QuickSpec
{
    override func spec()
    {
        describe("Generate of URL")
        {
            let url = GenerateURL.get(type: TypeURL.games)
            context("after being property initialized with a url")
            {
                it("should have a string")
                {
                    expect(url).notTo(beNil())
                }
                
                it("should have a url to start initial request")
                {
                    expect(url).to(equal("https://api.twitch.tv/kraken/games/top"))
                }
            }
        }
    }
}
