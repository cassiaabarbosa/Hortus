//
//  Extensions.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 13/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//

import UIKit

extension UIColor {
    
    struct App {
        static var navigation: UIColor { return #colorLiteral(red: 0.4588235294, green: 0.6666666667, blue: 0.3529411765, alpha: 1) }
        static var navigationTitle: UIColor { return #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1) }
        static var modalButton: UIColor { return .systemBlue}
        static var delete: UIColor { return .systemRed }
        static var selectedCell: UIColor {return #colorLiteral(red: 0.6156862745, green: 0.7568627451, blue: 0.5137254902, alpha: 1)}
    }
}


enum DateFormatType: String {
    /// Time
    case time = "HH:mm:ss"

    /// Date with hours
    case dateWithTime = "dd MMM yyyy   H:mm"

    /// Date
    case date = "dd MMM yyyy"
}


extension Date {
    
    func convertToString(dateformat formatType: DateFormatType) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatType.rawValue
        let newDate: String = dateFormatter.string(from: self)
        return newDate
    }
    
}


