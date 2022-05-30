//
//  friend.swift
//  worktest
//
//  Created by kfvz on 2022/5/27.
//

import Foundation
struct Friend:Codable,Equatable {
    
//    var uid = UUID()
    var name:String
    var status:Int
    var isTop:String
    var fid:String
    var updateDate:String
    
    func getFriendMessage()->String{
        let result = "name:\(self.name) status:\(self.status) isTop:\(self.isTop) fid:\(self.fid) updateDate:\(self.updateDate)"
        return result
    }
}
//extension Friend: Identifiable {
//    var id: Int { return Int(fid)! }
//}
