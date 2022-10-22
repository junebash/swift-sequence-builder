extension RangeReplaceableCollection {
  @inlinable
  public init<S: Sequence<Element>>(@SequenceBuilder<Element> build: () -> S) {
    self.init(build())
  }
}

extension SetAlgebra {
  @inlinable
  public init<S: Sequence<Element>>(@SequenceBuilder<Element> build: () -> S) {
    self.init(build())
  }
}
