//
//  musicSelectionViewCell.swift
//  Finesse Fulfilled
//
//  Created by Chandan Brown on 12/5/16.
//  Copyright © 2016 Chandan B. All rights reserved.
//

import UIKit

class musicSelectionViewCell: UICollectionViewCell {
    
    var song: Song?
    
    let musicButtonCounterpart: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 13
        return button
    }()
    
    let musicImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
    
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(musicImageView)
        addSubview(musicButtonCounterpart)
        //x,y,w,h
        musicImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -2).isActive = true
        musicButtonCounterpart.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -2).isActive = true
        musicImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2).isActive = true
        musicButtonCounterpart.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2).isActive = true
        musicImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 70).isActive = true
        musicButtonCounterpart.topAnchor.constraint(equalTo: self.topAnchor, constant: 70).isActive = true
        musicImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        musicButtonCounterpart.widthAnchor.constraint(equalToConstant: 200).isActive = true
        musicImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        musicButtonCounterpart.heightAnchor.constraint(equalToConstant: 130).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}


