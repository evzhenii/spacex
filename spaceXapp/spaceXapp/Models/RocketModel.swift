//
//  RocketModel.swift
//  spaceXapp
//
//  Created by boockich mac on 28.09.2022.
//
//
//import Foundation
//import UIKit
//
//struct RocketModel {
//    let name: String
//    let launchCost: String
//    let date: String
//    let country: String
//    let heightMeters: String
//    let heightFeet: String
//    let diameterMeters: String
//    let diameterFeet: String
//    let massKg: String
//    let massLb: String
//    let payloadKg: String
//    let payloadLb: String
//    let firstStage: Stage
//    let secondStage: Stage
//    var image: UIImage? {
//        let randIndex = (Int.random(in: 0..<flickr_images.count))
//        var image: UIImage?
//        guard let url = URL(string: flickr_images[randIndex]) else { return nil }
//        if let data = try? Data(contentsOf: url) {
//            if let parsed = UIImage(data: data) {
//                image = parsed
//            }
//        }
//        return image
//    }
//    let flickr_images: [String]
//}
//
//struct Stage {
//    let engines: String
//    let fuel_amount_tons: String
//    let burn_time_sec: String?
//}
