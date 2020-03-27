//
//  FlickrPhotoTableViewCell+Configuration.swift
//  Flickr
//
//  Created by Fady Derias on 3/27/20.
//  Copyright © 2020 Andela. All rights reserved.
//

import SDWebImage

extension FlickrPhotoTableViewCell {
    
    func configure(forPhoto photo: FLPhoto) {
        self.titleLabel.text = photo.title
        self.photoImageView.sd_setImage(with: photo.imageURL(), completed: nil)
    }
}
