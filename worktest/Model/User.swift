//
//  User.swift
//  worktest
//
//  Created by kfvz on 2022/5/27.
//

import Foundation
struct User:Codable,Equatable{
    var name:String
    var kokoid:String?
   
    func getUserMessage()->String{
        let result = "名字：\(self.name) id：\(self.kokoid ?? "")"
        return result
    }
}
