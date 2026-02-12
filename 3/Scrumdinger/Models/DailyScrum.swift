/*
 See LICENSE folder for this sample’s licensing information.
 */

import Foundation
import ThemeKit

//struct DailyScrum {
//    var title: String
//    var attendees: [String]
//    var lengthInMinutes: Int
//    var theme: Theme
//}


/// To work with user-generated content, you’ll make DailyScrum conform to the Identifiable protocol for a more robust way to communicate identity. The protocol has one requirement: an id property that provides a stable identifier for the entity.
struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var theme: Theme
    
    /// Add an initializer that assigns a default value to the id property.
    /// When you define a default value for a parameter, you can omit that parameter when you call an initializer or function.
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}
