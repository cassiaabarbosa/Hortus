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
        static var selectedCell: UIColor {return #colorLiteral(red: 0.4588235294, green: 0.6666666667, blue: 0.3529411765, alpha: 1)}
        static var deselectedCell: UIColor {return #colorLiteral(red: 0.8941176471, green: 0.8980392157, blue: 0.9019607843, alpha: 1)}
        static var borderColor: UIColor{return #colorLiteral(red: 0.1379964054, green: 0.3034812212, blue: 0.1233024672, alpha: 1)}
//        static var change: UIColor { return #colorLiteral(red: 0.2901960784, green: 0.3058823529, blue: 0.4117647059, alpha: 1) }
//        static var check: UIColor { return #colorLiteral(red: 0.2509803922, green: 0.5490196078, blue: 0.6, alpha: 1) }
//        static var error: UIColor { return #colorLiteral(red: 0.6117647059, green: 0.1098039216, blue: 0.06274509804, alpha: 1) }
//        static var background: UIColor { return #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1) }
//        static var segmentedSelected: UIColor { return #colorLiteral(red: 0.8666666667, green: 0.431372549, blue: 0.2588235294, alpha: 1) }
//        static var actionColor: UIColor { return #colorLiteral(red: 0.8666666667, green: 0.431372549, blue: 0.2588235294, alpha: 1) }
//        static var black: UIColor { return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) }
//        static var white: UIColor { return #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1) }
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


//precisa pegar as referencias do CoreData
//precisa  fazer o imagepicker
//precisa atualizar as labels 
