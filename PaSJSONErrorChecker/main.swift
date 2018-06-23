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

