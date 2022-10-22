public struct SequenceOfOne<Element> {
  public let element: Element

  @inlinable
  public init(_ element: Element) {
    self.element = element
  }
}

extension SequenceOfOne: Sequence {
  public struct Iterator: IteratorProtocol {
    @usableFromInline
    internal var element: Element?

    @inlinable
    init(element: Element? = nil) {
      self.element = element
    }

    @inlinable
    public mutating func next() -> Element? {
      if let element {
        self.element = nil
        return element
      }
      return nil
    }
  }

  public func makeIterator() -> Iterator {
    Iterator(element: element)
  }
}

extension SequenceOfOne: Equatable where Element: Equatable {}
extension SequenceOfOne: Hashable where Element: Hashable {}
extension SequenceOfOne: Sendable where Element: Sendable {}
