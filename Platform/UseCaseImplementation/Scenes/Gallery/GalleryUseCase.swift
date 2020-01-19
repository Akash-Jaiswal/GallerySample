//
//  GalleryUseCase.swift
//  GalleryView
//
//  Created by Jaiswal, Akash on 19/01/20.
//  Copyright © 2020 Jaiswal, Akash. All rights reserved.
//

import Foundation
internal class GalleryUseCase: IGalleryUseCase {
    var responseHandler: IResponseHandler
    init(handler: IResponseHandler) {
        self.responseHandler = handler
    }
    func getPhotos(request: APIRequest<GalleryModel.Request>) {
        APIManager.shared.requestAPI(request: request, decodingType: GalleryModel.Response.self, completion: { response in
            switch response {
            case .onSuccess(let jsonData):
                self.responseHandler.didReceiveResponse(response: jsonData)
            case .onFailureResponse(let error):
                self.responseHandler.didReceiveError(err: error)
            case .onFailure(let error):
                self.responseHandler.onDomainReachableError(error: error)
            }
        })
    }
}
