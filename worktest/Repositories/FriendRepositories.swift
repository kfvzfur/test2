import Foundation
////
////  NoFriendRepositories.swift
////  worktest
////
////  Created by kfvz on 2022/5/27.
////
//
//import Foundation
class FriendRepositories{

    //==========取得使用者資料
    func getUser()async->[User]{
        var users:[User] = []
        do{
        let response = try await NetworRepositories().netWork(url: "https://dimanyen.github.io/man.json")
        
             let result = try JSONDecoder().decode(UserResponse.self, from: response)
            users = result.response
        }catch{
            debugPrint("Error loading : \(String(describing: error))")
        }
        return users
    }
    //==========取得好友列表1=======
    func getFriendListOne()async ->[Friend]{
        var friends:[Friend] = []
        do{
        let response = try await NetworRepositories().netWork(url: "https://dimanyen.github.io/friend1.json")
             let result = try JSONDecoder().decode(FriendResponse.self, from: response)
            friends = result.response
        }catch{
            debugPrint("Error loading : \(String(describing: error))")
        }
       return friends
    }
    //==========取得好友列表2=======
    func getFriendListTwo()async ->[Friend]{
        var friends:[Friend] = []
        do{
        let response = try await NetworRepositories().netWork(url: "https://dimanyen.github.io/friend2.json")
             let result = try JSONDecoder().decode(FriendResponse.self, from: response)
            friends = result.response
        }catch{
            debugPrint("Error loading : \(String(describing: error))")
        }
       return friends
    }
    //==========好友列表含邀請列表 https://dimanyen.github.io/friend3.json
    func getFriendListThree()async ->[Friend]{
        var friends:[Friend] = []
        do{
        let response = try await NetworRepositories().netWork(url: "https://dimanyen.github.io/friend3.json")
             let result = try JSONDecoder().decode(FriendResponse.self, from: response)
            friends = result.response
        }catch{
            debugPrint("Error loading : \(String(describing: error))")
        }
       return friends
    }
    //=======無資料邀請/好友列表 https://dimanyen.github.io/friend4.json
    func getFriendListFour()async ->[Friend]{
        var friends:[Friend] = []
        do{
        let response = try await NetworRepositories().netWork(url: "https://dimanyen.github.io/friend4.json")
             let result = try JSONDecoder().decode(FriendResponse.self, from: response)
            friends = result.response
        }catch{
            debugPrint("Error loading : \(String(describing: error))")
        }
       return friends
    }
}
