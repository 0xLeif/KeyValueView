# KeyValueView

*A Color and String KeyValue SwiftUI View*

## Usage

```swift
import KeyValueView
```

### Example

```swift
public enum SomeColors: String, Hashable {
    case textColor, backgroundColor, iconColor
}

public enum SomeStrings: String, Hashable {
    case usageDescription
}

public struct SomeView<
    ColorDictionary: ColorProviding,
    StringDictionary: StringProviding
>: KeyValueView where ColorDictionary.ColorKey == SomeColors,
                    StringDictionary.StringKey == SomeStrings {
                    
    public var colorDictionary: ColorDictionary
    public var stringDictionary: StringDictionary
    
    public init(
        colorDictionary: ColorDictionary,
        stringDictionary: StringDictionary
    ) {
        self.colorDictionary = colorDictionary
        self.stringDictionary = stringDictionary
    }
    
    public var body: some View {
        Text(string(forKey: .usageDescription, defaultString: "👋"))
            .foregroundColor(color(forKey: .textColor, defaultColor: .white))
            .background(color(forKey: .backgroundColor, defaultColor: .clear))
    }
}
```

### Using a KeyValueView


#### Define Colors and Strings

```swift
struct SomeColorDictionary: ColorProviding {
    var colors: [SomeColors : UIColor] = [
        .backgroundColor: .orange,
        .textColor: .blue
    ]
}

struct SomeStringDictionary: StringProviding {
    var strings: [SomeStrings : String] = [
        .usageDescription: "import KeyValueView"
    ]
}
```

#### Create a KeyValueView

```swift
SomeView(
    colorDictionary: SomeColorDictionary(),
    stringDictionary: SomeStringDictionary()
)
```
