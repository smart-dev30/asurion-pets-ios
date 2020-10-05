//
//  Settings.swift
//  AsurionPets
//
//  Created by Akio on 10/5/20.
//  Copyright © 2020 Akio. All rights reserved.
//

import Foundation

struct Settings: Codable {
    let isChatEnabled: Bool
    let isCallEnabled: Bool
    let workHours: String
}
