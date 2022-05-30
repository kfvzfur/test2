//
//  SearchBar.swift
//  worktest
//
//  Created by kfvz on 2022/5/30.
//

import Foundation
import SwiftUI
struct SearchBar :View{
//    @EnvironmentObject var viewModel:FriendViewModel
//    @Binding var viewModel:FriendViewModel
//    @MainActor func getFouc(focused:Bool){
//        viewModel.isUseSearch = focused
//    }
    @Binding var isFouced:Bool
    @Binding var searchText:String
    var body:some View{
        HStack{
//            142 142 147, 0.12
//            rgb 142 142 147
            TextField("想轉一筆給誰呢", text: $searchText,onEditingChanged: { bool in
               isFouced = bool
                print("good")
            })
                .padding(10)
                .padding(.horizontal, 30)
                .foregroundColor(Color(red: 142.0/255.0, green: 142.0/255.0, blue: 147.0/255.0))
                .background(Color(red: 142.0/255.0, green: 142.0/255.0, blue: 147.0/255.0,opacity: 0.12))
                .cornerRadius(10)
                .padding(30)
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(red: 142.0/255.0, green: 142.0/255.0, blue: 147.0/255.0))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 40)
                )
            Spacer()
            Image("icBtnAddFriends")
                .padding(.trailing,30)
        }
    }
}
//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar(text: .constant(""))
//    }
//}
