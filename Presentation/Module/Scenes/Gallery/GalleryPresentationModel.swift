//
//  GalleryPresentationModel.swift
//  GalleryView
//
//  Created by Jaiswal, Akash on 19/01/20.
//  Copyright © 2020 Jaiswal, Akash. All rights reserved.
//

import Foundation

struct GalleryPresnetationModel {
    public var page: String?
    public var pages: Int?
    public var perpage: String?
    public var total: Int?
    public var photos: [Photo]?
    public init() {
    }
}

