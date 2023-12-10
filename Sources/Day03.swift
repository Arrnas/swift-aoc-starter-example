import Algorithms

struct Day03: AdventDay {
  var data: String

  var entities: [[Character]] {
    data.split(separator: "\n").map { Array($0) }
  }

  func part1() -> Any {
    entities.enumerated().flatMap { (lineIndex, line) in
      let lineWithoutSymbols = line.map { char in char.isWholeNumber ? char : " " }
      let lineNumbers = lineWithoutSymbols.split(separator: " ")
      let partNumbers = lineNumbers.compactMap { chars in
        let surroundingChars = ((chars.startIndex - 1)...chars.endIndex).map { ($0, lineIndex - 1) } +
        [((chars.startIndex - 1), lineIndex), (chars.endIndex, lineIndex)] +
        ((chars.startIndex - 1)...chars.endIndex).map { ($0, lineIndex + 1) }

        let adjacentChars = surroundingChars.compactMap({ (x, y) in
          entities.lookup(x, y)
        })

        if let _ = adjacentChars.first(where: { !$0.isWholeNumber && $0 != "." }) {
          return Int(String(chars))
        } else {
          return nil
        }
      }
      return partNumbers
    }.reduce(0, +)
  }

  func part2() -> Any {
    return 42
  }
}

private extension Array where Element == [Character] {
  func lookup(_ x: Int, _ y: Int) -> Character? {
    if x < 0 || y < 0 || y >= count || x >= self[y].count {
      return nil
    } else {
      return self[y][x]
    }
  }
}
