/*
 See LICENSE folder for this sample’s licensing information.
 */

import Foundation
import ThemeKit

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    /// By using a computed property, you can provide a getter to retrieve the scrum’s length as a double value and a setter to update the corresponding integer value when the slider changes.
    var lengthInMinutesAsDouble: Double {
        
        /// For Swift functions that return a value, you can omit the return keyword when the body is a single expression.
        get {
            Double(lengthInMinutes)
        }
        /// You can provide an argument to the setter to name the newly set value. If you omit the argument, the setter uses newValue as the default name.
        set{
            /// When the slider changes the value of lengthInMinutesAsDouble, convert the double value to an integer, and update the lengthInMinutes property.
            lengthInMinutes = Int(newValue)
        }
    }
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    static var emptyScum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
}
