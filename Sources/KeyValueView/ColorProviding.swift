import SwiftUI

public protocol ColorProviding {
    associatedtype ColorKey: Hashable
    
    var colors: [ColorKey: KVColor] { get set }
    
    func color(forKey key: ColorKey, defaultColor: KVColor) -> KVColor
    func color(forKey key: ColorKey, defaultColor: KVColor) -> Color
}

public extension ColorProviding {
    func color(forKey key: ColorKey, defaultColor: KVColor) -> KVColor {
        colors[key] ?? defaultColor
    }
    
    func color(forKey key: ColorKey, defaultColor: KVColor) -> Color {
        Color(color(forKey: key, defaultColor: defaultColor))
    }
}
