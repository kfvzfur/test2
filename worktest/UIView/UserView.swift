//
//  UserView.swift
//  worktest
//
//  Created by kfvz on 2022/5/27.
//

import Foundation
import SwiftUI
struct UserView : View{
//  @State var viewmodel = NoFriendViewModel()
//    @ObservedObject var viewModel = NoFriendViewModel()
    @Binding var user:User
    var body: some View{
       
        HStack{
            VStack(alignment: .leading, spacing: 10){
                Text(user.name).font(.largeTitle)
                HStack{
                if let id = user.kokoid {
                    Text("KOKO ID：\(id)")
                } else{ Button(action: {print("")}, label: {Text("設定KOKO ID：")})}
                    Text(">")
                }
            }
            Spacer()
            Image("imgFriendsFemaleDefault").frame(width: 52, height: 52)
        }.padding(30)
           
        
    }
}
