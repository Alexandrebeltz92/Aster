//
//  XCTestCaseExtension.swift
//  AsterCoreTests
//
//  Created by Alexandre Graverol on 12/09/2022.
//

import XCTest

extension XCTestCase {

    func json(with name: String) -> String? {
        let testBundle = Bundle(for: type(of: self))

        guard
            let mockUrl = testBundle.url(forResource: "Mock", withExtension: "bundle"),
            let mockBundle = Bundle(url: mockUrl),
            let mockFile = mockBundle.url(forResource: name, withExtension: ".json"),
            let mockData = try? String(contentsOf: mockFile)
        else {
            return nil
        }

        return mockData
    }
}
