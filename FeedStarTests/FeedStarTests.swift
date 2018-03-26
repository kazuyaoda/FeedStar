//
//  FeedStarTests.swift
//  FeedStarTests
//
//  Created by 小田和哉 on 2018/03/24.
//  Copyright © 2018年 K.oda. All rights reserved.
//

import XCTest
@testable import FeedStar

class FeedStarTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testViewLifeCycle() {
        
        let viewController = SecondViewController()
        
        print("call loadView")
        viewController.loadViewIfNeeded()
        
        print("set rootViewController")
        UIApplication.shared.keyWindow!.rootViewController = viewController
        
        
        let button = viewController.view.subviews
            .flatMap{ $0 as? UIButton}
            .first( where: { button in
                return button.titleLabel?.text == "Start"
            })
        
        // viewDidAppearまでには時間がかかるので、少し待つ🐣
        
        let exp = expectation(description: "test")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            XCTAssertTrue(UIViewController.topViewController(from: viewController) is SecondViewController)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 3.0)
        
    }
 
}
