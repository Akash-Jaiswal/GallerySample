//
//  ImageCollectionViewCell.swift
//  GalleryView
//
//  Created by Jaiswal, Akash on 19/01/20.
//  Copyright © 2020 Jaiswal, Akash. All rights reserved.
//

import UIKit
class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    static let nibName = "ImageCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
    var model: Photo? {
        didSet {
            if let model = model, let farm = model.farm, let server = model.server , let id = model.id, let secret = model.secret {
                imageView.image = UIImage(named: "placeholder")
                imageView.downloadImage(String(format: APIConstants.imageURL, farm, server, id, secret))
            }
        }
    }
}
