//
//  FlickrPhotoTableViewCell.swift
//  Flickr
//
//  Created by Fady Derias on 3/26/20.
//  Copyright © 2020 Andela. All rights reserved.
//

import UIKit

class FlickrPhotoTableViewCell: UITableViewCell {
    
    lazy var photoImageView: FLImageView = {
        let imageView = FLImageView(frame: CGRect.zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        self.contentView.addSubview(photoImageView)
        self.contentView.addSubview(titleLabel)
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
        tintColor = UIColor(red:1.00, green:0.40, blue:0.00, alpha:1.00)
        selectionStyle = .none
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            self.photoImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.contentView.leadingAnchor, multiplier: 2),
            self.photoImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.photoImageView.widthAnchor.constraint(equalToConstant: 80),
            self.photoImageView.heightAnchor.constraint(equalToConstant: 80),
            
            self.titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: self.photoImageView.trailingAnchor, multiplier: 2),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8)
        ])
    }
}
