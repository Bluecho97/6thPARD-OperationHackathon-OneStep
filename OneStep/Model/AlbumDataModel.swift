//
//  AlbumDataModel.swift
//  OneStep
//
//  Created by Lucid on 8/20/25.
//

import SwiftUI


struct AlbumDataModel: Codable, Identifiable {
    var id = UUID()
    var Image: String
}


extension AlbumDataModel {
    static let AlbumData: [AlbumDataModel] =
    [
        AlbumDataModel(Image: "AlbumImage1"),
        AlbumDataModel(Image: "AlbumImage2"),
        AlbumDataModel(Image: "AlbumImage3"),
        AlbumDataModel(Image: "AlbumImage4")
    ]
}

