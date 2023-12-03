import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day01Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
    vqxqnzrpqvtdtmgndhs7eightnqpxcntfmjr
    4vzpsdreight337hgvq
    jone4ccn8
    nftdkmtmcz4
    nlnineeightmndkqz8nineonenrqm
    nrhdxfsqvxcbcghf35eightthreeseven5
    """

  func testPart1() throws {
    let challenge = Day01(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "339")
  }

  func testPart2() throws {
    let challenge = Day01(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "42")
  }
}
