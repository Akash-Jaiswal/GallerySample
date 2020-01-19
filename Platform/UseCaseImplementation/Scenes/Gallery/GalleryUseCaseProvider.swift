//
//  GalleryUseCaseProvider.swift
//  GalleryView
//
//  Created by Jaiswal, Akash on 19/01/20.
//  Copyright © 2020 Jaiswal, Akash. All rights reserved.
//

import Foundation

open class GalleryUseCaseProvider: IGalleryUseCaseProvider {
    public init() {
    }
    public func provideGalleryUseCase(handler: IResponseHandler) -> IGalleryUseCase {
         return GalleryUseCase(handler: handler)
    }
    
   
}
