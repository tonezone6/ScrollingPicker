//
//  ContentView.swift
//  ios-custom-tabbar
//
//  Created by Alex S. on 14/04/2023.
//

import SwiftUI

struct ContentView: View {
    let weekdays: [Weekday] = [
        .monday, .tuesday,
        .wednesday, .thursday,
        .friday, .saturday, .sunday
    ]
    
    @State private var selected: Weekday = .monday
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                Image(systemName: "globe")
                    .resizable()
                    .scaledToFit()
                    .fontWeight(.light)
                    .frame(height: 80)
                    .foregroundColor(.teal)
                Text("Hello, \(selected.name)!")
            }
        }
        .safeAreaInset(edge: .top) {
            ScrollingPicker(weekdays, selected: $selected) { weekday in
                DayPickerItem(name: weekday.name, isSelected: weekday == selected)
            }
            .padding(8)
            .background(Color(.systemGroupedBackground))
            .clipShape(Capsule())
        }
        .padding()
        .task {
            try? await Task.sleep(for: .seconds(2))
            selected = .friday
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
