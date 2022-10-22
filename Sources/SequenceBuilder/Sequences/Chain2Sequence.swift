/// A concatenation of two sequences with the same element type.
public struct Chain2Sequence<First: Sequence, Second: Sequence>
where First.Element == Second.Element {
  /// The first sequence in this chain.
  public let base1: First

  /// The second sequence in this chain.
  public let base2: Second

  @inlinable
  public init(base1: First, base2: Second) {
    self.base1 = base1
    self.base2 = base2
  }
}

extension Chain2Sequence: Sequence {
  /// The iterator for a `Chain2Sequence` instance.
  public struct Iterator: IteratorProtocol {
    @usableFromInline
    internal var iterator1: First.Iterator

    @usableFromInline
    internal var iterator2: Second.Iterator

    @inlinable
    internal init(_ concatenation: Chain2Sequence) {
      iterator1 = concatenation.base1.makeIterator()
      iterator2 = concatenation.base2.makeIterator()
    }

    @inlinable
    public mutating func next() -> First.Element? {
      return iterator1.next() ?? iterator2.next()
    }
  }

  @inlinable
  public func makeIterator() -> Iterator {
    Iterator(self)
  }
}

extension Chain2Sequence: Equatable where First: Equatable, Second: Equatable {}
extension Chain2Sequence: Hashable where First: Hashable, Second: Hashable {}
extension Chain2Sequence: Sendable where First: Sendable, Second: Sendable {}
