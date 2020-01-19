//
//  IGalleryUseCase.swift
//  GalleryView
//
//  Created by Jaiswal, Akash on 19/01/20.
//  Copyright © 2020 Jaiswal, Akash. All rights reserved.
//

import Foundation
public protocol IGalleryUseCase {
    func getPhotos(request: APIRequest<GalleryModel.Request>)
}
