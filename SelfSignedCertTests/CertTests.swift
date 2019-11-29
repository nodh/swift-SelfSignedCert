//
//  CertTests.swift
//  SelfSignedCertTests
//
//  Created by Adis on 28/11/2019.
//  Copyright © 2019 Stefan van den Oord. All rights reserved.
//

import XCTest

class CertTests: XCTestCase {

    func test_certificateNotNil() {
        let identity = SecIdentity.create(subjectCommonName: "Signify", subjectEmailAddress: "asdfg@signify.com")
        let certificate = identity?.certificate
        let data = certificate?.data

        XCTAssertNotNil(data)
    }

}
