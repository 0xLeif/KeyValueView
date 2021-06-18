public protocol StringProviding {
    associatedtype StringKey: Hashable
    
    var strings: [StringKey: String] { get set }
    
    func string(forKey key: StringKey, defaultString: String) -> String
}

public extension StringProviding {
    func string(forKey key: StringKey, defaultString: String) -> String {
        strings[key] ?? defaultString
    }
}

public struct BasicStringDictionary<Key: Hashable>: StringProviding {
    public var strings: [Key : String]
    
    public init(strings: [Key : String]) {
        self.strings = strings
    }
}

extension BasicStringDictionary: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (Key, String)...) {
        strings = [Key: String](uniqueKeysWithValues: elements)
    }
}
