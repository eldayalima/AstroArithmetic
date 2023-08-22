//
//  DTDropTarget.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 20/08/23.
//

import SwiftUI

struct DTDropTarget: DropDelegate {
    var num1: Int
    var num2: Int
    
    var onComplete: ((Bool) -> ())
    
    func performDrop(info: DropInfo) -> Bool {
        let provider = info.itemProviders(for: [.text]).first
        
        provider?.loadTransferable(type: String.self) { result in
            switch result {
            case .success(let string):
                Task {
                    await onComplete(await num1 + num2 == Int(string)!)
                }
            case .failure(let error):
                print(error)
            }
        }
        
        return true
    }
    
}
