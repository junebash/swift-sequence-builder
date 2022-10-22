@usableFromInline
enum Either<Left, Right> {
  case left(Left)
  case right(Right)
}

extension Either: Equatable where Left: Equatable, Right: Equatable {}
extension Either: Hashable where Left: Hashable, Right: Hashable {}
extension Either: Sendable where Left: Sendable, Right: Sendable {}

extension Either
where Left: IteratorProtocol, Right: IteratorProtocol, Left.Element == Right.Element {
  @inlinable
  mutating func next() -> Left.Element? {
    switch self {
    case .left(var first):
      let value = first.next()
      self = .left(first)
      return value
    case .right(var second):
      let value = second.next()
      self = .right(second)
      return value
    }
  }
}

extension Either
where Left: Sequence, Right: Sequence, Left.Element == Right.Element {
  @inlinable
  func makeIterator() -> Either<Left.Iterator, Right.Iterator> {
    switch self {
    case .left(let first): return .left(first.makeIterator())
    case .right(let second): return .right(second.makeIterator())
    }
  }
}
