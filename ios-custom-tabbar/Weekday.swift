//
//  Weekday.swift
//  ios-custom-tabbar
//
//  Created by Alex S. on 14/04/2023.
//

enum Weekday: String, Identifiable {
    var id: String { rawValue }
    
    case monday, tuesday
    case wednesday, thursday
    case friday, saturday, sunday
    
    var name: String {
        self.rawValue.capitalized
    }
}
