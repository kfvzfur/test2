//
//  NoFriend.swift
//  worktest
//
//  Created by kfvz on 2022/5/26.
//

import Foundation
import SwiftUI

struct FriendView: View{
    @StateObject  private var viewModel: FriendViewModel
    @State var serTrxt:String = ""
    init(){
        self._viewModel = StateObject(wrappedValue: FriendViewModel())
    }
    
    var body: some View{
        ZStack(alignment: .center){
            
            NavigationView{
                
                VStack(){
                    
                    if(!viewModel.user.isEmpty){
                        
                        UserView(user: $viewModel.user.first! )
                        
                        
                        if(!viewModel.friendsInvite.isEmpty && $viewModel.selectedTab.wrappedValue == 2){
                            FriendInviteList(friends: $viewModel.friendsInvite)
                        }
                        
                        Tabs(tabs: .constant(["好友", "狀態2", "狀態3"]),
                             selection: $viewModel.selectedTab,
                             underlineColor: .red) { title, isSelected in
                            Text(title.uppercased())
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(isSelected ? .black : .gray)
                        }
//                        Spacer()
                                
                        switch self.$viewModel.selectedTab.wrappedValue{
                            case 1:
                                //                NoFriendView().getView()
                                FriendList(friends: $viewModel.friends
                                           ,isUseSearch:$viewModel.isUseSearch,searchText:$viewModel.searchText)
                                //                    friends: $viewModel.friends, isUseSearch: $viewModel.isUseSearch, searchText: $viewModel.searchText)
                            case 2:
                                FriendList(friends:$viewModel.friendsInvite
                                           ,isUseSearch:$viewModel.isUseSearch, searchText:$viewModel.searchText)
                            default:
                                //                HStack(alignment: .center, spacing: 44 ){
                                NoFriendView().getView()
                                //                }
                            }
                      
//                        }
                    }
                }
                .refreshable{
                    switch self.$viewModel.selectedTab.wrappedValue{
                    case 1:
//                        self.viewModel.friendsInvite.removeAll()
                        await self.viewModel.reload()
                    case 2:
//                        self.viewModel.friends.removeAll()
                        await self.viewModel.getFriendInviteList()
                    default:
                        await self.viewModel.getUserData()
                        
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .task {
//                    switch self.$viewModel.selectedTab.wrappedValue{
//                    case 1:
//                        self.viewModel.friendsInvite.removeAll()
                        await self.viewModel.reload()
//                    case 2:
//                        self.viewModel.friends.removeAll()
                        await self.viewModel.getFriendInviteList()
//                    default:
                        await self.viewModel.getUserData()
                        
//                    }
//                    await self.viewModel.getUserData()
                }
                
             
                .toolbar{
                    appbar()
                    
                }
           
                .navigationTitle("AppCoda")
                
            }
            
        
            if(self.viewModel.isBusy){
                ProgressView().padding(20).frame(width: 100, height: 100)
            }
        }
        
    }
}
//struct NoFriend_Previews: PreviewProvider {
//    static var previews: some View {
//       FriendView()
//    }
//}

