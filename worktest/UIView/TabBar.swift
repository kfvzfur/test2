//
//  TabBar.swift
//  worktest
//
//  Created by kfvz on 2022/5/29.
//

import Foundation
import SwiftUI
struct Tabs<Label: View>: View {
  @Binding var tabs: [String]
  @Binding var selection: Int
  let underlineColor: Color
  let label: (String, Bool) -> Label
    private func tab(title: String) -> some View {
      let index = self.tabs.firstIndex(of: title)!
      let isSelected = index == selection
      return Button(action: {
        withAnimation {
           self.selection = index
        }
      }) {
        label(title, isSelected)
          .overlay(Rectangle()
            .frame(height: 2)
            .foregroundColor(isSelected ? underlineColor : .clear)
            .padding(.top, 2)
            .transition(.move(edge: .bottom)) ,alignment: .bottomLeading)
      }
    }
    
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing: 30) {
        ForEach(tabs, id: \.self) {
         tab(title: $0)
        }
      }.padding(.horizontal, 32)  

    }
  }
}
