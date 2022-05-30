//
//  NetworkRepositories.swift
//  worktest
//
//  Created by kfvz on 2022/5/28.
//

import Foundation
class NetworRepositories{
    
    func netWork(url:String)async throws->Data{
        
        let url = URL(string: url)!
        let urlSession = URLSession.shared
        do{
        let (data,_) = try await urlSession.data(from: url)
            return data
        }
        catch {
            // Error handling in case the data couldn't be loaded
            // For now, only display the error on the console
            debugPrint("Error loading \(url): \(String(describing: error))")
            throw error
        }
        
    }
}
