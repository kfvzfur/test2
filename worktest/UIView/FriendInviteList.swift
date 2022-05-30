//
//  FriendListInvite.swift
//  worktest
//
//  Created by kfvz on 2022/5/26.
//

import Foundation
import SwiftUI
struct FriendInviteList :View{
    @Binding var friends:[Friend]
    
    var body: some View{
        VStack{
           
//            List(self.friends,id:\.name)
//            ScrollView {
            ForEach(self.friends,id:\.name)
            { (friend) in
                if(friend.status == 2){
                 
                    HStack{
                        Image("imgFriendsFemaleDefault")
                            .resizable()
                            .frame(width: 32, height: 32, alignment: .center)
                            .padding(.trailing,15)
                        VStack(alignment: .leading){
                        Text(friend.name).font(.system(size: 16))
                            Text("邀請你成為好友:)").foregroundColor(Color.gray)
                        }
                        Spacer()
                        Image("btnFriendsAgree")
                        Image("btnFriendsDelet")
                        
                    }
                    .padding(20)
//                    .border(Color.black, width: 1)
                    .shadow(color: Color(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0,opacity:0.1)
                                                          , radius: 0, x: 0, y: 4)
//                    .frame( height: 40)
//                        .padding(20)
                        .padding(.horizontal, 30)
                        
//                    Spacer()
                }
                }
//            }
//                .background(Color.white)
          
        } .frame(maxWidth: .infinity)
            .edgesIgnoringSafeArea(.all)
            .listStyle(.insetGrouped)
    }

}
