import XCTest
@testable import SequenceBuilder

final class SequenceBuilderTests: XCTestCase {
  func testExample() throws {
    XCTAssertEqual(Array(build: {}), [Int]())
    
    let use6 = true
    let useArray = false
    let nums = "7,8,9"
    
    @SequenceBuilder<Int>
    var makeSequence: Chain2Sequence<
      Chain2Sequence<
        Chain2Sequence<
          Chain2Sequence<
            SequenceOfOne<Int>,
            [Int]
          >,
          OptionalSequence<SequenceOfOne<Int>>
        >,
        LazyMapSequence<
          LazyFilterSequence<
            LazyMapSequence<
              LazyMapSequence<
                [String.SubSequence],
                String
              >,
              Int?
            >
          >,
          Int
        >
      >,
      EitherSequence<
        [Int],
        Set<Int>
      >
    > {
      1
      [2, 3, 4, 5]
      if use6 {
        SequenceOfOne(6)
      }
      nums.split(separator: ",").lazy
        .map(String.init)
        .compactMap(Int.init)
      if useArray {
        [10]
      } else {
        [10] as Set
      }
    }
    
    XCTAssertEqual(
      Array { makeSequence },
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    )
    assertElementsEqual(
      makeSequence,
      Chain2Sequence(
        base1: Chain2Sequence(
          base1: Chain2Sequence(
            base1: Chain2Sequence(
              base1: SequenceOfOne(1),
              base2: [2, 3, 4, 5]
            ),
            base2: OptionalSequence(SequenceOfOne(6))
          ),
          base2: nums.split(separator: ",").lazy
            .map(String.init)
            .compactMap(Int.init)
        ),
        base2: EitherSequence<[Int], Set<Int>>(right: [10])
      )
    )
  }
  
  private func assertElementsEqual<T: Sequence>(_ first: T, _ second: T) where T.Element: Equatable {
    var firstIterator = first.makeIterator()
    var secondIterator = second.makeIterator()
    while true {
      let nextFirst = firstIterator.next()
      let nextSecond = secondIterator.next()
      guard let nextFirst, let nextSecond else {
        XCTAssertNil(nextFirst)
        XCTAssertNil(nextSecond)
        break
      }
      XCTAssertEqual(nextFirst, nextSecond)
    }
  }
}

