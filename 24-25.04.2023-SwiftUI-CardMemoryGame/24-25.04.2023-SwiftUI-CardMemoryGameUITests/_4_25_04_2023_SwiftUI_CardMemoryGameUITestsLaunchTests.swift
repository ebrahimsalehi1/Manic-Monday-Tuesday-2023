//
//  _4_25_04_2023_SwiftUI_CardMemoryGameUITestsLaunchTests.swift
//  24-25.04.2023-SwiftUI-CardMemoryGameUITests
//
//  Created by Oshtorjani, Ebrahim Salehi (EXTERN: VW AG) on 28.04.23.
//

import XCTest

final class _4_25_04_2023_SwiftUI_CardMemoryGameUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
