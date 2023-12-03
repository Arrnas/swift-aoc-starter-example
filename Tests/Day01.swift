import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day01Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
    sixdxpnthgkfmddvqhrvsixsevenx4q
    ch29onepqnine
    sixlnh68
    1one5rqxz6nine7
    cone9
    fourseven3kddtmbjhnkz9kxhzspvtdngvsix
    3sixnrjcxv1
    onemdts29zrbh
    4796
    kzxfnrqktwohmp9cclstwo
    """

  func testPart1() throws {
    let challenge = Day01(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "339")
  }

  func testPart2() throws {
    let challenge = Day01(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "361")
  }
}
