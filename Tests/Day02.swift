import XCTest

@testable import AdventOfCode

final class Day02Tests: XCTestCase {
  let testData = """
    Game 96: 3 blue, 12 red, 3 green; 13 red, 9 blue; 2 green, 5 red, 13 blue; 2 red, 18 blue, 4 green; 6 red, 6 blue, 7 green; 3 green, 15 red, 18 blue
    Game 97: 4 red, 3 green; 2 blue, 4 red, 5 green; 3 red, 3 green
    Game 98: 2 red, 19 blue; 2 blue; 11 blue, 2 red; 3 green, 5 blue, 1 red; 2 red, 1 blue; 17 blue
    Game 99: 2 red, 16 blue, 1 green; 2 green, 12 blue, 6 red; 1 red, 3 green, 3 blue; 8 red, 1 green; 2 red, 9 blue; 1 green, 7 red, 9 blue
    Game 100: 8 green, 3 red; 7 green, 4 red; 1 red, 7 green, 2 blue; 1 green, 2 red
    """

  func testPart1() throws {
    let challenge = Day02(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "197")
  }

  func testPart2() throws {
    let challenge = Day02(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "361")
  }
}
