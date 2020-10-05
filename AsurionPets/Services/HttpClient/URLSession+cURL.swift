//
//  URLSession+cURL.swift
//  AsurionPets
//
//  Created by Akio on 10/5/20.
//  Copyright © 2020 Akio. All rights reserved.
//

import Foundation

extension URLRequest {
    
    /* Returns a cURL command for a request.
     * Return A String object that contains cURL command or "" if an URL is not properly initalized.
    */
    var cURL: String {
        
        guard
            let url = url,
            let httpMethod = httpMethod,
            url.absoluteString.utf8.count > 0
            else {
                return ""
        }
        
        var curlCommand = "curl --verbose \\\n"
        
        // URL
        curlCommand = curlCommand.appendingFormat(" '%@' \\\n", url.absoluteString)
        
        curlCommand = curlCommand.appendingFormat(" -X %@ \\\n", httpMethod)
        
        // Headers
        let allHeadersFields = allHTTPHeaderFields!
        let allHeadersKeys = Array(allHeadersFields.keys)
        let sortedHeadersKeys  = allHeadersKeys.sorted(by: <)
        for key in sortedHeadersKeys {
            curlCommand = curlCommand.appendingFormat(" -H '%@: %@' \\\n", key, self.value(forHTTPHeaderField: key)!)
        }
        
        // HTTP body
        if let httpBody = httpBody, httpBody.count > 0 {
            let httpBodyString = String(data: httpBody, encoding: String.Encoding.utf8)!
            let escapedHttpBody = URLRequest.escapeAllSingleQuotes(httpBodyString)
            curlCommand = curlCommand.appendingFormat(" --data '%@' \\\n", escapedHttpBody)
        }
        
        return curlCommand
    }
    
    /// Escapes single quotes for shell execution.
    static func escapeAllSingleQuotes(_ value: String) -> String {
        return value.replacingOccurrences(of: "'", with: "'\\''")
    }
}
