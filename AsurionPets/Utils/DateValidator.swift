//
//  DateTime.swift
//  AsurionPets
//
//  Created by Akio on 10/6/20.
//  Copyright © 2020 Akio. All rights reserved.
//

import Foundation

public final class DateValidator {
    let startTime: String?
    let endTime: String?
    
    func isInRange() -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let today = dateFormatter.string(from: Date())

        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

        let startDate = dateFormatter.date(from: "\(today) \(startTime!)")!
        let endDate = dateFormatter.date(from: "\(today) \(endTime!)")!

        return (startDate ... endDate).contains(Date())
    }
    
    public init(dateString: String) {
        do {
            let regex = try NSRegularExpression(pattern: "\\d+:\\d+")
            let results = regex.matches(
                in: dateString,
                range: NSRange(dateString.startIndex..., in: dateString)
            )
            
            let resultString = results.map {
                String(dateString[Range($0.range, in: dateString)!])
            }
            
            self.startTime = resultString[0]
            self.endTime = resultString[1]
        } catch let error {
            self.startTime = ""
            self.endTime = ""
            
            print("invalid regex: \(error.localizedDescription)")
        }
    }
}
