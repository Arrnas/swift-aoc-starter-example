import XCTest

@testable import AdventOfCode

final class Day01Tests: XCTestCase {
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
