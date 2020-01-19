//
//  IDomainReachable.swift
//  GalleryView
//
//  Created by Jaiswal, Akash on 19/01/20.
//  Copyright © 2020 Jaiswal, Akash. All rights reserved.
//

import Foundation
import UIKit
public protocol IDomainReachable {
    func onDomainReachableError(error: Error)
}

extension IDomainReachable {
    func onDomainReachableError(error: Error) {
        if let topController = UIApplication.topViewController() {
            topController.view.activityStopAnimating()
            topController.alert(message: error.localizedDescription)
        }
    }
}
