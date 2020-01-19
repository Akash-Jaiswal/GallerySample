//
//  IResponseHandler.swift
//  GalleryView
//
//  Created by Jaiswal, Akash on 19/01/20.
//  Copyright © 2020 Jaiswal, Akash. All rights reserved.
//

import Foundation
public protocol IResponseHandler: IDomainReachable {
    func didReceiveResponse<T>(response: T)
    func didReceiveError(err: [APIErrorInfo])
}
