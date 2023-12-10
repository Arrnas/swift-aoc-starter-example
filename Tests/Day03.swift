import XCTest

@testable import AdventOfCode

final class Day03Tests: XCTestCase {
  let testData = """
    .........874.772...........787..........556.....292......141................910............54...............................................
    .......*..*.......314............308.......*....*..............156.759.....*................*.......408*954.84..55.......................515
    ......927.49...........734...............115...738..=....723..........*...599.......+........573.....................324..../508............
    """

  func testPart1() throws {
    let challenge = Day03(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "8316")
  }

  func testPart2() throws {
    let challenge = Day03(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "42")
  }
}
