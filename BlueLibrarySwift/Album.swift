//
//  Album.swift
//  BlueLibrarySwift
//
//  Created by dirtmelon on 16/4/9.
//  Copyright © 2016年 Raywenderlich. All rights reserved.
//
import Foundation

class Album: NSObject {
    var title: String!
    var artist: String!
    var genre: String!
    var coverUrl: String!
    var year: String!

    init(title: String, artist: String, genre: String, coverUrl: String, year: String)
    {
        super.init()
        self.title = title
        self.artist = artist
        self.genre = genre
        self.coverUrl = coverUrl
        self.year = year
    }

    override var description: String {
        get {
            return "title: \(title)" + "artist: \(artist)" + "genre: \(genre)" + "coverUrl: \(coverUrl)" + "year: \(year)"
        }
    }
}
