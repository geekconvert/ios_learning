/*
 See LICENSE folder for this sample’s licensing information.
 */

import Foundation
import ThemeKit

//struct DailyScrum: Identifiable {
//    let id: UUID
//    var title: String
//    var attendees: [String]
//    var lengthInMinutes: Int
//    var theme: Theme
//    
//    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
//        self.id = id
//        self.title = title
//        self.attendees = attendees
//        self.lengthInMinutes = lengthInMinutes
//        self.theme = theme
//    }
//}

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        //map(_:) creates a new collection by iterating over and applying a transformation to each element in an existing collection.
        self.attendees = attendees.map{
            Attendee(name: $0)
        }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee : Identifiable{
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
}
