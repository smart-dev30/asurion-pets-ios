//
//  APIError.swift
//  AsurionPets
//
//  Created by Akio on 10/5/20.
//  Copyright © 2020 Akio. All rights reserved.
//

import Foundation

public enum APIError: Error {
    
    case clientError(HTTPURLResponse?)
    
    case serverError(HTTPURLResponse?)
    
    case redirection(HTTPURLResponse?)
    
    case invalidEndpoint
    
    case invalidResponse(URLResponse?)
    
    case unsupported(Error)
    
    case noResponse
    
    case noData(HTTPURLResponse?)
    
    case decodeError(HTTPURLResponse?)
    
    case encodeError
    
}
