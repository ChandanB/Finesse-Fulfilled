//
//  SongTableViewCell.swift
//  Finesse Fulfilled
//
//  Created by Chandan Brown on 12/14/16.
//  Copyright © 2016 Chandan B. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textLabel?.frame = CGRect(x: 64, y: textLabel!.frame.origin.y - 2, width: textLabel!.frame.width, height: textLabel!.frame.height)
        
        detailTextLabel?.frame = CGRect(x: 64, y: detailTextLabel!.frame.origin.y + 2, width: detailTextLabel!.frame.width, height: detailTextLabel!.frame.height)
    }
    
    let playlistArtImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 2
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        //label.text = "HH:MM:SS"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let songNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        addSubview(playlistArtImageView)
        addSubview(timeLabel)
        addSubview(songNameLabel)
        
        //need x,y,width,height anchors
        
        playlistArtImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        playlistArtImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        playlistArtImageView.widthAnchor.constraint(equalToConstant: 96).isActive = true
        playlistArtImageView.heightAnchor.constraint(equalToConstant: 96).isActive = true
       // playlistArtImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        songNameLabel.leftAnchor.constraint(equalTo: playlistArtImageView.rightAnchor, constant: 8).isActive = true
        songNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        songNameLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        songNameLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        //need x,y,width,height anchors
        timeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 45).isActive = true
        timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 18).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        timeLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
