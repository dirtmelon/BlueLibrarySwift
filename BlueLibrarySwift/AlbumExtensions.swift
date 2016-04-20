//
//  AlbumExtensions.swift
//  BlueLibrarySwift
//
//  Created by dirtmelon on 16/4/18.
//  Copyright © 2016年 Raywenderlich. All rights reserved.
//

import Foundation

extension Album {
    func ae_tableRepresentation() -> (titles: [String], values: [String]) {
        return (["Artist", "Album", "Genre", "Year"], [artist, title, genre, year])
    }
}
