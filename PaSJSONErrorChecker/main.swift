import Foundation

let jsonString = try! String(contentsOfFile: "/Users/mulangsu/Desktop/Untitled.json")
guard let portsAndSurveyorsData = try? JSONDecoder().decode(PortsAndSurveyorsData.self, from: jsonString.data(using: .utf8)!) else {
    print("JSON not in correct format!")
    exit(0)
}

