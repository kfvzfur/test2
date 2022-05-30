//
//  NoFriendView.swift
//  worktest
//
//  Created by kfvz on 2022/5/29.
//

import Foundation
import SwiftUI
struct NoFriendView: View{
    func getView()->AnyView{
        return AnyView(NoFriendView())
    }
    let viewWidth = UIScreen.main.bounds.width * (192/375)
    var body: some View{
        VStack(alignment: .center, spacing: 65){
            Image("imgFriendsEmpty")
                .resizable()
//                .scaledToFill()
//                .frame(width: 245, height: 172)
//
           
            Text("與好友們一起用 KOKO 聊起來！\n還能互相收付款、發紅包喔：）")
           
//
            Button {
                print("加好友")
            } label: {
                Text("加好友")
                    .padding([.leading,.trailing],62)
                //rgb 86 179 11   rgb 166 204 66 設定漸層色
                //Color(red: 86.0/255.0, green: 179.0/255.0, blue: 11.0/255.0)
                //Color(red: 166.0/255.0, green: 204.0/255.0, blue: 66.0/255.0)
                
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 86.0/255.0, green: 179.0/255.0, blue: 11.0/255.0),Color(red: 166.0/255.0, green: 204.0/255.0, blue: 66.0/255.0)]) , startPoint: .leading, endPoint: .trailing))
                    .foregroundColor(.white)
                    .font(.title)
                    .cornerRadius(.infinity)
//                    .frame(width: viewWidth+100)
                    
            }
            Spacer()
            
        }.padding(30)
    }
}
