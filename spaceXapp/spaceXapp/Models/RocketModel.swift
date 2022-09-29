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
    let cost_per_launch: Int
    let first_flight: String
    let country: String
    let height: Height
    let diameter: Diameter
    let mass: Mass
    let payload_weights: Payload_weights
    let flickr_images: [URL]
    let first_stage: First_stage
    let second_stage: Second_stage
}

func getImage(imageURL: String) -> UIImage? {
    let url = URL(string: imageURL)
    DispatchQueue.global().async {
        guard let url = url else {
            return nil
        }
        if let data = try? Data(contentsOf: url) {
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                return image
            }
            return nil
        }
    }
}
