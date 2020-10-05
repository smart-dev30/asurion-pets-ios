//
//  UIViewController.swift
//  AsurionPets
//
//  Created by Akio on 10/6/20.
//  Copyright © 2020 Akio. All rights reserved.
//

import UIKit

extension UIViewController {
  func alert(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
