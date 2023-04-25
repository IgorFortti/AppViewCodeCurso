//
//  Alert.swift
//  AppViewCodeCurso
//
//  Created by Igor Fortti on 03/03/23.
//

import UIKit

class Alert: NSObject {
    
    var controller: UIViewController?
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    public func getAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ok", style: .cancel) { acao in
            completion?()
        }
        alertController.addAction(cancel)
        controller?.present(alertController, animated: true)
    }
}
