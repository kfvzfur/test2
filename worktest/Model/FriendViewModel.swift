//
//  NoFriendViewModel.swift
//  worktest
//
//  Created by kfvz on 2022/5/27.
//

import Foundation
import SwiftUI
@MainActor
 class FriendViewModel: ObservableObject {
     @Published var user:[User] = []
     @Published var friends:[Friend] = []
     @Published var friendsInvite:[Friend] = []
     @Published var searchText:String = ""
     @Published var isUseSearch:Bool = false
     @Published var isBusy = false
     @Published var selectedTab = 0
   
     init(){
         isBusy = true
         Task{
             user = await FriendRepositories().getUser()
           
         }
         isBusy = false
     }
     func clearFriendListSame( OneList:[Friend],TwoList:[Friend])->[Friend]{
       
         var result:[Friend] = [Friend]()
         var dic = [String:Friend]()
         for index in 0..<OneList.count{
             dic[OneList[index].fid] = OneList[index]
            
//
             for index2 in 0..<TwoList.count{
//
                 if (dic[TwoList[index2].fid] == nil){
                     dic[TwoList[index2].fid] = TwoList[index2]
                 }else{
                     let OneString = OneList[index].updateDate.filter{ "0123456789".contains($0) }
                     let TwoString = TwoList[index2].updateDate.filter{ "0123456789".contains($0) }
                 
                 if let time = Int(OneString){
                     print("now:\(time)")
                     if let time2 = Int(TwoString){
                         print("now:\(time2)")
                         if(time<time2){
                            
                             dic.updateValue(TwoList[index2], forKey: TwoList[index2].fid)
                          
                         }
                     }
                 }}
                          
             }
             
         }
         
         print("總共：\(dic.count)")
         for(_,value) in dic{
             result.append(value)
         }
         let sortresult = result.sorted{
             Int($0.fid)!<Int($1.fid)!
         }
         return sortresult
     }
     func getUserData() async{
         isBusy = true
         user = await FriendRepositories().getUser()
         isBusy = false
     }
     func reload() async  {
         isBusy = true
          let friendsListOne = await FriendRepositories().getFriendListOne()
              let friendsListTwo = await FriendRepositories().getFriendListTwo()
         print("test\(friendsListTwo)")
         if(!friendsListOne.isEmpty && !friendsListTwo.isEmpty){
         self.friends = clearFriendListSame(OneList: friendsListOne, TwoList: friendsListTwo)
                 
         }
          isBusy = false
    }
        
     func getFriendInviteList() async{
         isBusy = true
         let list = await FriendRepositories().getFriendListThree()
         self.friendsInvite = list
         isBusy = false
     }
       
//     
 
}
