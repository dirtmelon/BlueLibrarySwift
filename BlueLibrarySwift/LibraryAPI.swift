//
//  LibraryAPI.swift
//  BlueLibrarySwift
//
//  Created by dirtmelon on 16/4/9.
//  Copyright © 2016年 Raywenderlich. All rights reserved.
//

import Foundation

class LibraryAPI: NSObject {

    private let persistencyManager: PersistencyManager
    private let httpClient: HTTPClient
    private let isOnline: Bool

    override init() {
        persistencyManager = PersistencyManager()
        httpClient = HTTPClient()
        isOnline = false

        super.init()
    }

    class var sharedInstance: LibraryAPI {

        struct Singleton {
            static let instance = LibraryAPI()
        }

        return Singleton.instance
    }

    func getAlbums() -> [Album] {
        return persistencyManager.getAlbums()
    }

    func addAlbum(album: Album, index: Int) {
        persistencyManager.addAlbum(album, index: index)
        if isOnline {
            httpClient.postRequest("/api/addAlbum", body: album.description)
        }
    }
}


