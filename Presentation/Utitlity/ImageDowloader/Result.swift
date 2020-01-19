//
//  Result.swift
//  GalleryView
//
//  Created by Jaiswal, Akash on 19/01/20.
//  Copyright © 2020 Jaiswal, Akash. All rights reserved.
//

import Foundation

enum Result <T>{
    case Success(T)
    case Failure(String)
    case Error(String)
}
