//
//  RocketInfo.swift
//  spaceXapp
//
//  Created by boockich mac on 28.09.2022.
//

import Foundation
import UIKit

struct RocketData: Codable {
    let name: String
    let cost_per_launch: Int
    let first_flight: String
    
    var image: UIImage? {
        let randIndex = (Int.random(in: 0..<flickr_images.count))
        var image: UIImage?
        guard let url = URL(string: flickr_images[randIndex]) else { return nil }
        if let data = try? Data(contentsOf: url) {
            if let parsed = UIImage(data: data) {
                image = parsed
            }
        }
        return image
    }

    let country: String
    let height: Height
    let diameter: Diameter
    let mass: Mass
    let payload_weights: [Payload_weights]
    var flickr_images: [String]
    let first_stage: Stage
    let second_stage: Stage
}

struct Height: Codable {
    let meters: Float
    let feet: Float
}

struct Diameter: Codable {
    let meters: Float
    let feet: Float
}

struct Mass: Codable {
    let kg: Float
    let lb: Float
}

struct Payload_weights: Codable {
    let kg: Float
    let lb: Float
}

struct Stage: Codable {
    let engines: Int
    let fuel_amount_tons: Float
    let burn_time_sec: Int?
}
