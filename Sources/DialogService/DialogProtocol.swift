//
//  BaseViewModel.swift
//  
//
//  Created by Artem Tischenko on 26.12.2020.
//


import SwiftEventBus

protocol DialogProtocol {
    
}

extension DialogProtocol {
    func showActionSheet(title: String? = nil,
                         message: String? = nil,
                         actions: [String] = [],
                         cancelAnction: String? = "Cancel",
                         completion: ((String?) -> Void)? = nil) {
        let dic = [
            "title": title,
            "message": message,
            "actions": actions,
            "cancelAction": cancelAnction,
            "completion": completion
        ] as [String: Any?]
        SwiftEventBus.postToMainThread("SwiftEventBus.showActionSheet", sender: dic)
    }
    
    
    func showAlert(title: String? = nil,
                   message: String? = nil,
                   action: String = "ok",
                   cancelAnction: String? = nil,
                   completion: ((Bool) -> Void)? = nil) {
        let dic = [
            "title": title,
            "message": message,
            "action": action,
            "cancelAction": cancelAnction,
            "completion": completion
            ] as [String: Any?]
        SwiftEventBus.postToMainThread("SwiftEventBus.showAlert", sender: dic)
    }
    
}
