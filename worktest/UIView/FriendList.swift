//
//  FriendList.swift
//  worktest
//
//  Created by kfvz on 2022/5/26.
//

import Foundation
import SwiftUI
struct FriendList: View{
    //    @EnvironmentObject var viewModel:FriendViewModel
//        @Binding var viewModel:FriendViewModel
    @Binding var friends:[Friend]
    @Binding var isUseSearch:Bool
    @Binding var searchText:String
   
    var body: some View{
        VStack{
//            if(!isUseSearch){
                    SearchBar(isFouced:$isUseSearch, searchText: $searchText)
//            }
            
            List(self.friends
                .filter(
                {searchText.isEmpty ? true : $0.name.contains(searchText)}),
                 id:\.name){(friend) in
                if(friend.status == 1 || friend.status == 0){
                    ScrollView {
                        HStack{
                            if(friend.isTop == "1"){
                                Image("icFriendsStar").padding(.trailing,7)
                            }else { Image("icFriendsStar").hidden().padding(.trailing,7)}
                            Image("imgFriendsFemaleDefault")
                                .resizable()
                                .frame(width: 32, height: 32, alignment: .center)
                                .padding(.trailing,15)
                            Text(friend.name).font(.system(size: 16))
                            Spacer()
                            Button {
                                print("轉帳")
                            } label: {
                                //                    gb 236 0 140
                                Text("轉帳").foregroundColor(Color(red: 236.0/255.0, green: 0.0/255.0, blue: 140.0/255.0))
                                    .border(Color(red: 236.0/255.0, green: 0.0/255.0, blue: 140.0/255.0), width: 1)
                            }.padding(20)
                            switch(friend.status){
                            case 1:
                                ZStack{
                                    Image("icFriendsMore")
                                    //                            .font(.system(size:20))
                                    //                            .foregroundColor(Color.gray)
                                    Text("邀請中")
                                        .foregroundColor(Color.gray)
                                        .border(Color.gray,width:1).hidden()
                                }
                            case 2:
                                Text("邀請中")
                                    .foregroundColor(Color.gray)
                                    .border(Color.gray,width:1)
                            default:
                                ZStack{
                                    Button {
                                        if let index = self.friends.firstIndex(of: friend){
                                            self.friends[index].status = 2
                                        }
                                        print("邀請")
                                    } label: {
                                        Text("邀請").foregroundColor(Color.blue)
                                            .border(Color.blue,width:1)
                                    }
                                    Text("邀請中")
                                        .foregroundColor(Color.gray)
                                        .border(Color.gray,width:1).hidden()
                                    
                                }
                                
                                
                            }
                            
                        }.fixedSize(horizontal: false, vertical: true)
                        
                        
                    }
                    .frame( height: 60)
//                if(!isUseSearch){
//                    .searchable(text: $searchText)
                }
                }.frame( maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                .listStyle(.inset)
            //            Spacer()
        }
        
    }
}

