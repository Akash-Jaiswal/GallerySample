//
//  APIResponseModel.swift
//  GalleryView
//
//  Created by Jaiswal, Akash on 19/01/20.
//  Copyright © 2020 Jaiswal, Akash. All rights reserved.
//

import Foundation
public enum APIResponseHandler<T: Codable> {
    case onSuccess(value: T)
    case onFailureResponse(error: [APIErrorInfo])
    case onFailure(error: Error)
}
