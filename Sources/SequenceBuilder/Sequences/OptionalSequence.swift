public struct OptionalSequence<Base: Sequence>: Sequence {
  public struct Iterator: IteratorProtocol {
    @usableFromInline
    var iterator: Base.Iterator?

    @inlinable
    init(iterator: Base.Iterator?) {
      self.iterator = iterator
    }

    @inlinable
    public mutating func next() -> Base.Element? {
      iterator?.next()
    }
  }

  public let base: Base?

  @inlinable
  public init(_ base: Base?) {
    self.base = base
  }

  @inlinable
  public func makeIterator() -> Iterator {
    Iterator(iterator: base?.makeIterator())
  }
}

extension OptionalSequence: Equatable where Base: Equatable {}
extension OptionalSequence: Hashable where Base: Hashable {}
extension OptionalSequence: Sendable where Base: Sendable {}
