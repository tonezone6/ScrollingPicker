//
//  TabbarView.swift
//  ios-custom-tabbar
//
//  Created by Alex S. on 14/04/2023.
//

import SwiftUI

struct ScrollingPicker<E, L>: View where E: Identifiable, E: Hashable, L: View {
    var elements: [E]
    @Binding var selected: E
    let label: (E) -> L
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(elements) { item in
                        label(item).onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selected = item
                            }
                        }
                    }
                }
            }
            .onChange(of: selected) { item in
                withAnimation(.easeInOut) {
                    proxy.scrollTo(item.id, anchor: .center)
               }
            }
        }
    }
    
    init(_ items: [E], selected: Binding<E>, label: @escaping (E) -> L) {
        self.elements = items
        self._selected = selected
        self.label = label
    }
}
