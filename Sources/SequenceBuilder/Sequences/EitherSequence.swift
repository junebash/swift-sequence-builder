public struct EitherSequence<Left: Sequence, Right: Sequence>: Sequence
where Left.Element == Right.Element {
  public struct Iterator: IteratorProtocol {
    @usableFromInline
    var eitherIterator: Either<Left.Iterator, Right.Iterator>

    @inlinable
    init(eitherIterator: Either<Left.Iterator, Right.Iterator>) {
      self.eitherIterator = eitherIterator
    }

    @inlinable
    public mutating func next() -> Left.Element? {
      eitherIterator.next()
    }
  }

  @usableFromInline
  let base: Either<Left, Right>

  public init(left: Left) {
    self.base = .left(left)
  }

  public init(right: Right) {
    self.base = .right(right)
  }

  @inlinable
  public func makeIterator() -> Iterator {
    .init(eitherIterator: base.makeIterator())
  }
}

extension EitherSequence: Equatable where Left: Equatable, Right: Equatable {}
extension EitherSequence: Hashable where Left: Hashable, Right: Hashable {}
extension EitherSequence: Sendable where Left: Sendable, Right: Sendable {}
