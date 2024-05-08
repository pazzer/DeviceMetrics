// The Swift Programming Language


import Foundation
import UIKit

let iPhone14ProMaxPointSize = CGSize(width: 430, height: 932)
let iPhone14ProPointSize = CGSize(width: 393, height: 852)
let iPhone14PlusPointSize = CGSize(width: 428, height: 926)
let iPhone14PointSize = CGSize(width: 390, height: 844)
let iPhone11PointSize = CGSize(width: 414, height: 896)
let iPhone11ProMaxPointSize = CGSize(width: 414, height: 896)
let iPhone13MiniPointSize = CGSize(width: 375, height: 812)
let iPhone8PlusPointSize = CGSize(width: 414, height: 736)
let iPhone8PointSize = CGSize(width: 375, height: 667)
let iPodGen7PointSize = CGSize(width: 320, height: 568)


let iPodGen7PixelSize = CGSize(width: 640, height: 1136)
let iPhone8PixelSize = CGSize(width: 750, height: 1334)
let iPhone8PlusPixelSize = CGSize(width: 1080, height: 1920)
let iPhone13MiniPixelSize = CGSize(width: 1125, height: 2436)
let iPhone11ProMaxPixelSize = CGSize(width: 1242, height: 2688)
let iPhone11PixelSize = CGSize(width: 828, height: 1792)
let iPhone14PixelSize = CGSize(width: 1170, height: 2532)
let iPhone14PlusPixelSize = CGSize(width: 1284, height: 2778)
let iPhone14ProPixelSize = CGSize(width: 1179, height: 2556)
let iPhone14ProMaxPixelSize = CGSize(width: 1290, height: 2796)


public enum iPhoneDeviceFamily {
    
    case iPhone14ProMax
    case iPhone14Pro
    case iPhone14Plus
    case iPhone14
    case iPhone11
    case iPhone11ProMax
    case iPhone13Mini
    case iPhone8Plus
    case iPhone8
    case iPodGen7
}

public extension iPhoneDeviceFamily {
    init?(from pointSize: CGSize, scale: CGFloat) {
        
        switch (pointSize, round(scale)) {
        case (iPodGen7PointSize, _):
            self = .iPodGen7
        case (iPhone8PointSize, _):
            self = .iPhone8
        case (iPhone8PlusPointSize, _):
            self = .iPhone8Plus
        case (iPhone13MiniPointSize, _):
            self = .iPhone13Mini
        case (iPhone11ProMaxPointSize, 3):
            self = .iPhone11ProMax
        case (iPhone11PointSize, 2):
            self = .iPhone11
        case (iPhone14PointSize, _):
            self = .iPhone14
        case (iPhone14PlusPointSize, _):
            self = .iPhone14Plus
        case (iPhone14ProPointSize, 3):
            self = .iPhone14Pro
        case (iPhone14ProMaxPointSize, 3):
            self = .iPhone14ProMax
        default:
            return nil
        }
    }
    
    var scale: Int {
        switch self {
        case .iPodGen7, .iPhone8, .iPhone11:
            return 2
        default:
            return 3
        }
    }
    
    var pointDimensions: CGSize {
        
        switch self {
        case .iPodGen7:
            return iPodGen7PointSize
        case .iPhone8:
            return iPhone8PointSize
        case .iPhone8Plus:
            return iPhone8PlusPointSize
        case .iPhone13Mini:
            return iPhone13MiniPointSize
        case .iPhone11ProMax:
            return iPhone11ProMaxPointSize
        case .iPhone11:
            return iPhone11PointSize
        case .iPhone14:
            return iPhone14PointSize
        case .iPhone14Plus:
            return iPhone14PlusPointSize
        case .iPhone14Pro:
            return iPhone14PointSize
        case .iPhone14ProMax:
            return iPhone14ProMaxPointSize
        }
        
    }
    
    var pixelDimensions: CGSize {
        
        switch self {
        case .iPodGen7:
            return iPodGen7PixelSize
        case .iPhone8:
            return iPhone8PixelSize
        case .iPhone8Plus:
            return iPhone8PlusPixelSize
        case .iPhone13Mini:
            return iPhone13MiniPixelSize
        case .iPhone11ProMax:
            return iPhone11ProMaxPixelSize
        case .iPhone11:
            return iPhone11PixelSize
        case .iPhone14:
            return iPhone14PixelSize
        case .iPhone14Plus:
            return iPhone14PlusPixelSize
        case .iPhone14Pro:
            return iPhone14ProPixelSize
        case .iPhone14ProMax:
            return iPhone14ProMaxPixelSize
        }
    }
    
}
    
    



public extension UIDevice {
    
    var family: iPhoneDeviceFamily? {
        return iPhoneDeviceFamily(from: UIScreen.main.bounds.size, scale: UIScreen.main.scale)
    }
    
}
