//
//  ImageDownloadOperation.swift
//  GalleryView
//
//  Created by Jaiswal, Akash on 19/01/20.
//  Copyright © 2020 Jaiswal, Akash. All rights reserved.
//

import UIKit
typealias ImageCompletion = (_ image : UIImage?, _ url : String) -> Void

class ImageDownloadOperation: Operation {
    
    let url: String?
    var customCompletionBlock: ImageCompletion?    
    init(url: String, completionBlock: @escaping ImageCompletion) {
        self.url = url
        self.customCompletionBlock = completionBlock
    }
    
    override func main() {
        
        if self.isCancelled { return }
        
        if let url = self.url {
            
            if self.isCancelled { return }
            APIManager.shared.getImage(url) { (response) in
                GCDHelper.runOnMainThread {
                     if self.isCancelled { return }
                    if let imageData = response, let completion = self.customCompletionBlock {
                            completion(UIImage(data: imageData), url)
                    }
                }
            }
        }
    }
}
extension ImageDownloadOperation: IResponseHandler {
    func didReceiveError(err: [APIErrorInfo]) {
    }
    
    func didReceiveResponse<T>(response: T) {
       
    }
}
