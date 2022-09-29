//
//  RocketModel.swift
//  spaceXapp
//
//  Created by boockich mac on 28.09.2022.
//

import Foundation

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
