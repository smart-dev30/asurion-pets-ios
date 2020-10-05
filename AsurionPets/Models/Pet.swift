//
//  Settings.swift
//  AsurionPets
//
//  Created by Akio on 10/5/20.
//  Copyright © 2020 Akio. All rights reserved.
//

import Foundation

struct Pet : Codable {
    let image_url: String
    let title: String
    let content_url: String
    let date_added: String
}
