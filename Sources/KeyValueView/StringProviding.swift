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
