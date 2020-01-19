//
//  GalleryViewTests.swift
//  GalleryViewTests
//
//  Created by Jaiswal, Akash on 19/01/20.
//  Copyright © 2020 Jaiswal, Akash. All rights reserved.
//

import XCTest
@testable import GalleryView

class GalleryViewTests: XCTestCase {
    var response: GalleryModel.Response?
    var errorResponse: [APIErrorInfo]?
    var responseExpectation: XCTestExpectation?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        response = nil
        errorResponse = nil
        responseExpectation = nil
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
    //MARK : - Test Case to check API Response and also Validating the Image URL
    func testAPISuccessAndValidateImageURL() {
        responseExpectation = expectation(description: "response")
        let provider = GalleryUseCaseProvider()
        let obj = provider.provideGalleryUseCase(handler: self)
        let requestAPI =  APIRequest<GalleryModel.Request>(method: APIRequest.HTTPMethod.get, url: String(format: APIConstants.getGalleryUrl, 1), params: nil, paramsEncoding: .json)
        obj.getPhotos(request: requestAPI)
        waitForExpectations(timeout: 10) { (_) in
            XCTAssertNotNil(self.response)
            guard let photosCount = self.response?.photos?.photo?.count else {
                XCTFail("No photos returned")
                return
            }
            
            if photosCount > 0 {
                XCTAssert(true, "Returned photos")
                
                // Pick first photo to test image url
                let photo = self.response?.photos?.photo?.first
                
                if photo?.farm == nil {
                    XCTFail("No farm id returned")
                }
                
                if photo?.server == nil {
                    XCTFail("No server id returned")
                }
                
                if photo?.id == nil {
                    XCTFail("No photo id returned")
                }
                
                if photo?.secret == nil {
                    XCTFail("No secret id returned")
                }
                
                XCTAssert(true, "Success")
            }
        }
    }
}
extension GalleryViewTests: IResponseHandler {
    func didReceiveError(err: [APIErrorInfo]) {
        XCTFail("Error: \(err.description)")
        responseExpectation?.fulfill()
    }
    
    func didReceiveResponse<T>(response: T) {
        if T.self == GalleryModel.Response.self {
            self.response = response as? GalleryModel.Response
            responseExpectation?.fulfill()
        }
    }
}
