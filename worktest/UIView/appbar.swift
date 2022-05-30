//
//  appbar.swift
//  worktest
//
//  Created by kfvz on 2022/5/28.
//

import Foundation
import SwiftUI


struct appbar: ToolbarContent{
    var body: some ToolbarContent{
        ToolbarItem(placement: .navigationBarLeading) {
            HStack{
                Button {
                    print("")
                } label: {
                    Image("icNavPinkWithdraw")
                }
                Button {
                    print("")
                } label: {
                    Image("icNavPinkTransfer")
                }
            }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                print("")
            } label: {
                Image("icNavPinkScan")
            }
        }
       
    }

}
