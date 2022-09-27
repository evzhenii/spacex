//
//  spaceXManager.swift
//  spaceX
//
//  Created by boockich mac on 24.09.2022.
//

import Foundation

//struct SpaceXManager {
//    let rocketsURL = "https://api.spacexdata.com/v4/rockets"
//    let launchesURL = "https://api.spacexdata.com/v4/launches"
//    
//    func fetchSpace(rocket: String) {
//        
//    }
//    
//    func performRequest(urlString: String) {
//        if let url = URL(string: urlString) {
//            let session = URLSession(configuration: .default)
//            
//            let task = session.dataTask(with: url, completionHandler: { data, response, error in
//                if error != nil {
//                    print(error!)
//                    return
//                }
//                
//                if let safeData = data {
//                    let dataString = String(data: safeData, encoding: .utf8)
//                    self.parseJSON(data: safeData)
//                }
//            })
//            
//            task.resume()
//        }
//    }
//    
//    func parseJSON(data: Data) {
//        let decoder = JSONDecoder()
//        do {
//            let decodedData = try decoder.decode([RocketData].self, from: data)
//            print(decodedData[0].name)
//            
//        } catch {
//            print(error)
//        }
//        
//    }
//}
