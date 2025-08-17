//
//  TodayOneStepDataModel.swift
//  OneStep
//
//  Created by Lucid on 8/17/25.
//

import SwiftUI


struct MissionDataModel: Codable, Identifiable {
    var id = UUID()
    var missionImage: String
    var missionTitle: String
    var missionCoin: Int
}


extension MissionDataModel {
    static let MissionData: [[MissionDataModel]] =
    [
        [
            MissionDataModel(missionImage: "Bed", missionTitle: "침구류 정리하고 사진찍기", missionCoin: 100),
            MissionDataModel(missionImage: "Sky", missionTitle: "창문 열고 하늘 사진찍기", missionCoin: 100),
            MissionDataModel(missionImage: "Lunch", missionTitle: "맛있는 점심먹는 사진찍기", missionCoin: 100)
        ],
        [
            MissionDataModel(missionImage: "Flower", missionTitle: "공원에서 예쁜 꽃 사진찍기", missionCoin: 500)
        ]
    ]
}

