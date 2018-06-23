import Foundation

let jsonString = try! String(contentsOfFile: "/Users/mulangsu/Desktop/Untitled.json")
guard let portsAndSurveyorsData = try? JSONDecoder().decode(PortsAndSurveyorsData.self, from: jsonString.data(using: .utf8)!) else {
    print("JSON not in correct format!")
    exit(0)
}

// duplicate ids
let surveyorIds = portsAndSurveyorsData.surveyors.map { $0.id }
var idSet = Set<Int>()
for id in surveyorIds {
    if !idSet.insert(id).inserted {
        print("Surveyor ID \(id) appears more than once!")
    }
}

// ports no duplicate
let portNames = portsAndSurveyorsData.ports.map { $0.name }
var nameSet = Set<String>()
for name in portNames {
    if !nameSet.insert(name).inserted {
        print("Port name \"\(name)\" appears more than once!")
    }
}

// ports have surveyors
for port in portsAndSurveyorsData.ports {
    if port.surveyors.isEmpty {
        print("Port \"\(port.name)\" has no surveyors!")
    }
}

