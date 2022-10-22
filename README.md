# swift-sequence-builder

Build sequences efficiently using result builders!

```swift
let array = Array {
  1
  [2, 3, 4, 5]
  if Bool.random() {
    CollectionOfOne(6)
  }
  "7,8,9".split(separator: ",").lazy
    .map(String.init)
    .compactMap(Int.init)
  if Bool.random() {
    [10]
  } else {
    [10] as Set
  }
}
```
