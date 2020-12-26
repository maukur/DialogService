//
//  DialogService.swift
//  DialogService
//
//  Created by Artem Tischenko on 13.05.2020.
//  Copyright © 2020 Artem Tischenko. All rights reserved.
//
#if canImport(UIKit)
import UIKit
#endif

import SwiftEventBus

public class DialogService {
    
    private static let instance = DialogService()
    private init() {}
    #if canImport(UIKit)

    public static func initialize(getTopViewController: (() -> UIViewController?)? = nil) {
  
        self.instance.getTopViewController = getTopViewController
     
        SwiftEventBus.onMainThread(self, name: "SwiftEventBus.showAlert") { result in
            DialogService.showAlert(result: result?.object)
        }
        
        SwiftEventBus.onMainThread(self, name: "SwiftEventBus.showActionSheet") { result in
            DialogService.showActionSheet(result: result?.object)
        }
    }
    
 
    
    static func showAlert(result: Any?) {
        let dic = result as! Dictionary<String, Any?>
        let title = dic["title"] as? String
        let message = dic["message"]  as? String
        let action = dic["action"]  as! String?
        let completion = dic["completion"] as! ((Bool) -> Void)?
        let cancel = dic["cancelAction"] as! String?
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction  = UIAlertAction(title: action, style: .default, handler: { _ in completion?(true)})
        alert.addAction(okAction)
        if(cancel != nil) {
            let cancelAction  = UIAlertAction(title: cancel!, style: .cancel, handler: { _ in completion?(false)})
            alert.addAction(cancelAction)
        }
        self.instance.getTopViewController!()!.present(alert, animated: true)
    }
    
    static func showActionSheet(result: Any?) {
        let dic = result as! [String: Any]
        let title = dic["title"] as? String
        let actions = dic["actions"]  as! [String]
        let message = dic["message"]  as? String
        let completion = dic["completion"] as! ((String?) -> Void)?
        let cancel = dic["cancelAction"] as! String?
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for item in actions {
            let action  = UIAlertAction(title: item, style: .default, handler: { _ in completion?(item)})
            alert.addAction(action)
        }
        
        let cancelAction  = UIAlertAction(title: cancel!, style: .cancel, handler: { _ in completion?(nil)})
        alert.addAction(cancelAction)
        self.instance.getTopViewController!()!.present(alert, animated: true)
    }
    
    var getTopViewController: (() -> UIViewController?)?
    #endif

}
