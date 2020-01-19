//
//  GalleryInteractor.swift
//  GalleryView
//
//  Created by Jaiswal, Akash on 19/01/20.
//  Copyright © 2020 Jaiswal, Akash. All rights reserved.
//

import Foundation
protocol IGalleryInteractable {
    func getPhotos(pageNo: Int)
}
class GalleryInteractor {
    var presenter: IResponseHandler?
    var galleryUseCaseProvider: IGalleryUseCaseProvider?
    init() {
        galleryUseCaseProvider = GalleryUseCaseProvider()
    }
}
extension GalleryInteractor: IGalleryInteractable {
    func getPhotos(pageNo: Int) {
        let requestAPI =  APIRequest<GalleryModel.Request>(method: APIRequest.HTTPMethod.get, url: String(format: APIConstants.getGalleryUrl, pageNo), params: nil, paramsEncoding: .json)
        if let responseHandler = presenter {
            let interfaceObj = galleryUseCaseProvider?.provideGalleryUseCase(handler: responseHandler)
            interfaceObj?.getPhotos(request: requestAPI)
        }
    }
}
