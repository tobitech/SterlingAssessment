//
//  Extensions.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alertController.addAction(
            UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        )
        present(alertController, animated: true, completion: nil)
    }
}

extension DateFormatter {
    static let football = DateFormatter(dateFormat: "yyyy-MM-dd'T'HH:mm:ssZ")
    
    static let fixture = DateFormatter(dateFormat: "HH:mm")
    
    convenience init (dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }
}
