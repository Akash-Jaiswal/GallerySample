//
//  GalleryModel.swift
//  GalleryView
//
//  Created by Jaiswal, Akash on 19/01/20.
//  Copyright © 2020 Jaiswal, Akash. All rights reserved.
//

import Foundation

public enum GalleryModel {
    public struct Request: Codable {
        public init() {
        }
    }
    // MARK: - Response
    struct Response: Codable {
        public var photos: Photos?
        public var stat: String?
        init() {
        }
        init(photos: Photos?, stat: String?) {
            self.photos = photos
            self.stat = stat
        }
    }
    
    // MARK: - Photos
    struct Photos: Codable {
        public var page: String?
        public var pages: Int?
        public var perpage: String?
        public var total: Int?
        public var photo: [Photo]?
        init() {
        }
        init(page: String?, pages: Int?, perpage: String?, total: Int?, photo: [Photo]?) {
            self.pages = pages
            self.page = page
            self.perpage = perpage
            self.total = total
            self.photo = photo
        }
    }
    
}
// MARK: - Photo
public struct Photo: Codable {
    public var id, owner, secret, server: String?
    public var farm: Int?
    public var title: String?
    public var ispublic, isfriend, isfamily, isPrimary: Int?
    public var hasComment: Int?
    init() {
    }
    init (id: String?, owner: String?, secret: String?, server: String?, farm: Int?, title: String?, ispublic: Int?, isfriend: Int?, isfamily: Int?, isPrimary: Int?, hasComment: Int?) {
        self.id = id
        self.owner = owner
        self.secret = secret
        self.server = server
        self.farm = farm
        self.title = title
        self.ispublic = ispublic
        self.isfriend = isfriend
        self.isfamily = isfamily
        self.isPrimary = isPrimary
        self.hasComment = hasComment
    }
}
