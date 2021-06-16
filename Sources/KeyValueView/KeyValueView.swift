import SwiftUI

#if os(macOS)
public typealias KVColor = NSColor
#else
public typealias KVColor = UIColor
#endif

public protocol ViewValueView: View {
    associatedtype ColorDictionary: ColorProviding
    associatedtype StringDictionary: StringProviding
    
    var colorDictionary: ColorDictionary { get set }
    var stringDictionary: StringDictionary { get set }
    
    func color(forKey key: ColorDictionary.ColorKey, defaultColor: KVColor) -> KVColor
    func color(forKey key: ColorDictionary.ColorKey, defaultColor: KVColor) -> Color
    func string(forKey key: StringDictionary.StringKey, defaultString: String) -> String
}

public extension ViewValueView {
    func color(forKey key: ColorDictionary.ColorKey, defaultColor: KVColor) -> KVColor {
        colorDictionary.color(forKey: key, defaultColor: defaultColor)
    }
    
    func color(forKey key: ColorDictionary.ColorKey, defaultColor: KVColor) -> Color {
        colorDictionary.color(forKey: key, defaultColor: defaultColor)
    }
    
    func string(forKey key: StringDictionary.StringKey, defaultString: String) -> String {
        stringDictionary.string(forKey: key, defaultString: defaultString)
    }
}
