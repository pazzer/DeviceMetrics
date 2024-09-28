// The Swift Programming Language


import Foundation
import UIKit

/// Crash reports were suggesting that on occassion `iPhoneDeviceFamily(from: UIScreen.main.bounds.size, scale: UIScreen.main.scale)`
/// was  returning nil. In the absence of a conclusive explanation, I've made the assumption that this unexpected behaviour was the
/// result of a relying on a pair of notoriously unreliable floating-point equality checks (CGSize.width == CGSize.width &&
/// CGSize.height == CGSize.height). These have therefore been removed, and replaced with integer equality checks. The DeviceSize
/// struct - with its two integer properties - is used in place of CGSize to make this change explicit.
struct DeviceSize {
    let width: Int
    let height: Int
    
    init(from cgSize: CGSize) {
        return DeviceSize(width: Int(cgSize.width, height: Int(cgSize.height)))
    }
}


let iPhone14ProMaxPointSize = DeviceSize(width: 430, height: 932)
let iPhone14ProMaxPixelSize = DeviceSize(width: 1290, height: 2796)

let iPhone14ProPointSize = DeviceSize(width: 393, height: 852)
let iPhone14ProPixelSize = DeviceSize(width: 1179, height: 2556)

let iPhone14PlusPointSize = DeviceSize(width: 428, height: 926)
let iPhone14PlusPixelSize = DeviceSize(width: 1284, height: 2778)

let iPhone14PointSize = DeviceSize(width: 390, height: 844)
let iPhone14PixelSize = DeviceSize(width: 1170, height: 2532)

let iPhone11PointSize = DeviceSize(width: 414, height: 896)
let iPhone11PixelSize = DeviceSize(width: 828, height: 1792)

let iPhone11ProMaxPointSize = DeviceSize(width: 414, height: 896)
let iPhone11ProMaxPixelSize = DeviceSize(width: 1242, height: 2688)

let iPhone13MiniPointSize = DeviceSize(width: 375, height: 812)
let iPhone13MiniPixelSize = DeviceSize(width: 1125, height: 2436)

let iPhone8PlusPointSize = DeviceSize(width: 414, height: 736)
let iPhone8PlusPixelSize = DeviceSize(width: 1080, height: 1920)

let iPhone8PointSize = DeviceSize(width: 375, height: 667)
let iPhone8PixelSize = DeviceSize(width: 750, height: 1334)

let iPodGen7PointSize = DeviceSize(width: 320, height: 568)
let iPodGen7PixelSize = DeviceSize(width: 640, height: 1136)

let iPhone16ProPointSize = DeviceSize(width: 402, height: 874)
let iPhone16ProPixelSize = DeviceSize(width: 1206, height: 2622)

let iPhone16ProMaxPointSize = DeviceSize(width: 440, height: 956)
let iPhone16ProMaxPixelSize = DeviceSize(width: 1320, height: 2868)


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
    case iPhone16Pro
    case iPhone16ProMax
}

public extension iPhoneDeviceFamily {
    init?(from deviceSize: DeviceSize, scale: CGFloat) {
        switch (deviceSize, round(scale)) {
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
        case (iPhone16ProPointSize, 3):
            self = .iPhone16Pro
        case (iPhone16ProMaxPointSize, 3):
            self = .iPhone16ProMax
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
    
    var pointDimensions: DeviceSize {
        
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
        case .iPhone16Pro:
            return iPhone16ProPointSize
        case .iPhone16ProMax:
            return iPhone16ProMaxPointSize
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
        case .iPhone16Pro:
            return iPhone16ProPixelSize
        case .iPhone16ProMax:
            return iPhone16ProMaxPixelSize
        }
    }
    
}
    
    



public extension UIDevice {
    
    var family: iPhoneDeviceFamily? {
        let deviceSize = DeviceSize(from: UIScreen.main.bounds.size)
        return iPhoneDeviceFamily(from: UIScreen.main.bounds.size, scale: UIScreen.main.scale)
    }
    
}
