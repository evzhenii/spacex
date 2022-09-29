//
//  RocketModel.swift
//  spaceXapp
//
//  Created by boockich mac on 28.09.2022.
//

import Foundation
import UIKit

struct RocketModel {
    let name: String
    let flickr_images: [String]
    var image: UIImage? {
        let randIndex = (Int.random(in: 0..<flickr_images.count))
        let url = URL(string: flickr_images[randIndex])
        var image: UIImage?
        DispatchQueue.global().async {
            guard let url = url else {
                return
            }
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    let parsed = UIImage(data: data)
                    image = parsed
                }
            } catch {
                print(error)
            }
        }
        return image
    }
    
    let cost_per_launch: Int
    let first_flight: String
    let country: String
    let height: Height
    let diameter: Diameter
    let mass: Mass
    let payload_weights: Payload_weights
    let first_stage: First_stage
    let second_stage: Second_stage
}
