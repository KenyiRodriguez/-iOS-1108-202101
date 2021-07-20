//
//  DateManager.swift
//  ConsumoServicios
//
//  Created by Kenyi Rodriguez on 28/06/21.
//

import Foundation


extension String {
    
    func toDateWithFormat(_ format: String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let newDate = dateFormatter.date(from: self)
        return newDate ?? Date()
    }
}

extension Date {
    
    func toStringWithFormart(_ format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "es_PE")
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}
