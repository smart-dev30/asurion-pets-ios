//
//  Settings.swift
//  AsurionPets
//
//  Created by Akio on 10/5/20.
//  Copyright © 2020 Akio. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public func addViewBorder(borderColor:CGColor, borderWith:CGFloat, borderCornerRadius:CGFloat) {
        self.layer.borderWidth = borderWith
        self.layer.borderColor = borderColor
        self.layer.cornerRadius = borderCornerRadius
    }
}
