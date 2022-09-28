//
//  RocketInfo.swift
//  spaceXapp
//
//  Created by boockich mac on 28.09.2022.
//

import Foundation
import UIKit

struct RocketInfo: Decodable {
    let name: String?
    let cost_per_launch: Int?
    let first_flight: String?
    let country: String?
    let height: Height?
    let diameter: Diameter?
    let mass: Mass?
    let payload_weights: Payload_weights?
    let flickr_images: [URL?]
    let first_stage: First_stage?
    let second_stage: Second_stage?
}

struct Height: Decodable {
    let meters: Double?
    let feet: Double?
}
struct Diameter: Decodable {
    let meters: Double?
    let feet: Double?
}
struct Mass: Decodable {
    let kg: Double?
    let lb: Double?
}
struct Payload_weights: Decodable {
    let kg: Double?
    let lb: Double?
}
struct First_stage: Decodable {
    let engines: Int?
    let fuel_amount_tons: Double?
    let burn_time_sec: Double?
}
struct Second_stage: Decodable {
    let engines: Int?
    let fuel_amount_tons: Double?
    let burn_time_sec: Double?
}
