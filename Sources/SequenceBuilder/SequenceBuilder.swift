@resultBuilder
public enum SequenceBuilder<Element> {
  @inlinable
  public static func buildExpression(_ expression: Element) -> SequenceOfOne<Element> {
    SequenceOfOne(expression)
  }

  @inlinable
  public static func buildExpression<S: Sequence<Element>>(_ expression: S) -> S {
    expression
  }

  @inlinable
  public static func buildExpression<S: Sequence<Element>>(_ expression: S?) -> OptionalSequence<S> {
    OptionalSequence(expression)
  }

  @inlinable
  public static func buildBlock() -> EmptyCollection<Element> {
    EmptyCollection()
  }

  @inlinable
  public static func buildPartialBlock<S: Sequence<Element>>(first: S) -> S {
    first
  }

  @inlinable
  public static func buildPartialBlock<Accumulated: Sequence<Element>, Next: Sequence<Element>>(
    accumulated: Accumulated,
    next: Next
  ) -> Chain2Sequence<Accumulated, Next> {
    Chain2Sequence(base1: accumulated, base2: next)
  }

  @inlinable
  public static func buildArray<S: Sequence<Element>>(_ components: [S]) -> FlattenSequence<[S]> {
    components.joined()
  }

  @inlinable
  public static func buildOptional<S: Sequence<Element>>(_ component: S?) -> OptionalSequence<S> {
    OptionalSequence(component)
  }

  @inlinable
  public static func buildEither<First: Sequence<Element>, Second: Sequence<Element>>(
    first component: First
  ) -> EitherSequence<First, Second> {
    EitherSequence(left: component)
  }

  @inlinable
  public static func buildEither<First: Sequence<Element>, Second: Sequence<Element>>(
    second component: Second
  ) -> EitherSequence<First, Second> {
    EitherSequence(right: component)
  }

  @inlinable
  public static func buildLimitedAvailability<S: Sequence<Element>>(_ component: S) -> S {
    component
  }
}
