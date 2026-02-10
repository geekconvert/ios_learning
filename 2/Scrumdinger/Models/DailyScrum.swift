//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Anish kumar dubey on 07/02/26.
//

import Foundation
import ThemeKit /*You import ThemeKit so that you can use the Theme type in the structure definition in the next step.*/

struct DailyScrum{
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var theme: Theme
}
