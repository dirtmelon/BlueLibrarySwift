
//
//  AlbumView.swift
//  BlueLibrarySwift
//
//  Created by dirtmelon on 16/4/9.
//  Copyright © 2016年 Raywenderlich. All rights reserved.
//

import UIKit

class AlbumView: UIView {
    private var coverImage: UIImageView!
    private var indicator: UIActivityIndicatorView!
    init(frame: CGRect, albumCover: String) {
        super.init(frame: frame)
        backgroundColor = UIColor.blueColor()
        coverImage = UIImageView(frame: CGRectMake(5, 5, frame.size.width - 10, frame.size.height - 10))
        addSubview(coverImage)
        indicator = UIActivityIndicatorView()
        indicator.center = center
        indicator.activityIndicatorViewStyle = .WhiteLarge
        indicator.startAnimating()
        addSubview(indicator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func highlightAlbum(didHighlightView: Bool) {
        if didHighlightView == true {
            backgroundColor = UIColor.whiteColor()
        } else {
            backgroundColor = UIColor.blueColor()
        }
    }
}
