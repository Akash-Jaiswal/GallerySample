//
//  IGalleryUseCaseProvider.swift
//  GalleryView
//
//  Created by Jaiswal, Akash on 19/01/20.
//  Copyright © 2020 Jaiswal, Akash. All rights reserved.
//

import Foundation
public protocol IGalleryUseCaseProvider {
    func provideGalleryUseCase(handler: IResponseHandler) -> IGalleryUseCase
}
