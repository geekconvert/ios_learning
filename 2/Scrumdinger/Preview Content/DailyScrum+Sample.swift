//
//  DailyScrum+Sample.swift
//  Scrumdinger
//
//  Created by Anish kumar dubey on 07/02/26.
//


////Preview Content is an Xcode folder where you can put development assets to use while developing and debugging your project. Assets in this folder aren’t shipped to users in the final version of your app.

import Foundation
import ThemeKit

//// Swift extensions add new functionality to an existing type.
extension DailyScrum{
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
    ]
}
