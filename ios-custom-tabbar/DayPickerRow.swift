//
//  DayPickerRow.swift
//  ios-custom-tabbar
//
//  Created by Alex S. on 14/04/2023.
//

import SwiftUI

struct DayPickerItem: View {
    let name: String
    let isSelected: Bool
    
    var body: some View {
        Text(name)
            .font(.subheadline)
            .fontWeight(.medium)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .foregroundColor(isSelected ? .white : .black)
            .background(Capsule().foregroundColor(isSelected ? .mint : .clear))
    }
}

struct DayPickerItem_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            DayPickerItem(name: "Wednesday", isSelected: true)
            DayPickerItem(name: "Thursday", isSelected: false)
        }
    }
}
