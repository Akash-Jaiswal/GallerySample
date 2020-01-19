//
//  GalleryPresenter.swift
//  GalleryView
//
//  Created by Jaiswal, Akash on 19/01/20.
//  Copyright © 2020 Jaiswal, Akash. All rights reserved.
//

import Foundation
class GalleryPresenter {
    var viewController: IGalleryViewable?
}
extension GalleryPresenter : IResponseHandler {
    func didReceiveResponse<T>(response: T) {
        if T.self ==  GalleryModel.Response.self {
            var model =  GalleryPresnetationModel()
            if let galleryResponse = (response as? GalleryModel.Response) {
               model.page = galleryResponse.photos?.page
                model.total = galleryResponse.photos?.total
                model.pages = galleryResponse.photos?.pages
                model.perpage = galleryResponse.photos?.perpage
                model.photos = galleryResponse.photos?.photo
            }
            viewController?.getPhotosSuccess(viewModel: model)
        }
    }
    
    func didReceiveError(err: [APIErrorInfo]) {
    }
    
}
