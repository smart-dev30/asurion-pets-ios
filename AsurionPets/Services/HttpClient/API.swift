//
//  API.swift
//  AsurionPets
//
//  Created by Akio on 10/6/20.
//  Copyright © 2020 Akio. All rights reserved.
//

import Foundation

struct API {

    struct Pets {
        static func all() -> Endpoint<Void, [Pet]> {
            return Endpoint(
                method: .get,
                path: "/pets"
            )
        }
    }
    
    static func getSettings() -> Endpoint<Void, Settings> {
        return Endpoint(
            method: .get,
            path: "/config"
        )
    }
}
