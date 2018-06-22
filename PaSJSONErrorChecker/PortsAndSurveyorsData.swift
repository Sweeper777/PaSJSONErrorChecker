// To parse the JSON, add this file to your project and do:
//
//   let portsAndSurveyorsData = try? JSONDecoder().decode(PortsAndSurveyorsData.self, from: jsonData)

import Foundation

struct PortsAndSurveyorsData: Codable {
    let surveyors: [Surveyor]
    let ports: [Port]
}

struct Port: Codable {
    let name: String
    let latitude, longitude: Double
    let surveyors: [Int]
}

struct Surveyor: Codable {
    let id: Int
    let name: String
    let contacts, prices: [String]
}
