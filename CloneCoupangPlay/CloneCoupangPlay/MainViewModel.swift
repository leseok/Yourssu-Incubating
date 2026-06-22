import Combine
import SwiftUI

enum contentType {
    case movie
    case series
    case economy
    case notDefined
}
struct Content {
    let name : String
    let genre : contentType
}


class MainViewModel: ObservableObject {
    
    @Published var mainPosters : [Content] = [
        Content(name : "mainPoster1", genre : .movie)
    ]
    
    @Published var topContents: [Content] = [
        Content(name: "snl", genre: .series),
        Content(name: "solo", genre: .notDefined),
        Content(name: "ifWe", genre: .movie)
    ]
    
    @Published var newContents: [Content] = [
        Content(name: "him", genre: .movie),
        Content(name: "bonjour", genre: .series),
        Content(name: "whatname", genre: .notDefined)
    ]
    
    
    @Published var smallContents: [String] = [
        "smallContent1",
        "smallContent2",
        "smallContent3",
        "smallContent4",
        "smallContent5",
        "smallContent6",
        "smallContent7",
        "smallContent8",
        "smallContent9"
    ]
    
    @Published var economyContents: [String] = [
        "economyContent1",
        "economyContent2",
        "economyContent3",
        "economyContent4"
    ]
    
}
