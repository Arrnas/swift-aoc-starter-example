import Algorithms

struct Day01: AdventDay {
  var data: String
  let numbers = [("one", "1"), ("two", "2"), ("three", "3"), ("four", "4"), ("five", "5"), ("six", "6"), ("seven", "7"), ("eight", "8"), ("nine", "9")]

  var entities: [String] {
    data.split(separator: "\n").map {
      String($0)
    }
  }

  func part1() -> Any {
    entities.reduce(0) { partialResult, line in
      let first = String(line.first { $0.isWholeNumber }!)
      let last = String(line.last { $0.isWholeNumber }!)
      return partialResult + Int(first + last)!
    }
  }

  func part2() -> Any {
    entities.reduce(0) { partialResult, line in
      let firstWordNumber = numbers.findFirstOccurences(in: line).sorted().first
      let lastWordNumber = numbers.findLastOccurences(in: line).sorted().last

      let firstNumber = line.firstWithIndex(where: { $0.isWholeNumber })
      let lastNumber = line.lastWithIndex(where: { $0.isWholeNumber })

      let firstNumberString: String
      let secondNumberString: String

      if let firstWordNumber = firstWordNumber, let firstNumber = firstNumber {
        if firstWordNumber.0 < firstNumber.0 {
          firstNumberString = firstWordNumber.1
        } else {
          firstNumberString = firstNumber.1
        }
      } else if let firstWordNumber = firstWordNumber {
        firstNumberString = firstWordNumber.1
      } else if let firstNumber = firstNumber {
        firstNumberString = firstNumber.1
      } else {
        exit(1)
      }

      if let lastWordNumber = lastWordNumber, let lastNumber = lastNumber {
        if lastWordNumber.0 > lastNumber.0 {
          secondNumberString = lastWordNumber.1
        } else {
          secondNumberString = lastNumber.1
        }
      } else if let lastWordNumber = lastWordNumber {
        secondNumberString = lastWordNumber.1
      } else if let lastNumber = lastNumber {
        secondNumberString = lastNumber.1
      } else {
        exit(1)
      }

      return partialResult + Int(firstNumberString + secondNumberString)!
    }
  }
}

private extension Array where Element == (String.Index, String) {
  func sorted() -> [(String.Index, String)] {
    self.sorted { lhs, rhs in
      lhs.0 < rhs.0
    }
  }
}

private extension Array where Element == (String, String) {
  func findFirstOccurences(in str: String) -> [(String.Index, String)] {
    self.compactMap { tupleToFind in
      if let index = str.firstRange(of: tupleToFind.0)?.lowerBound {
        return (index, tupleToFind.1)
      } else {
        return nil
      }
    }
  }

  func findLastOccurences(in str: String) -> [(String.Index, String)] {
    self.compactMap { tupleToFind in
      var searchStartIndex = str.startIndex
      var lastFoundIndex: String.Index?

      while searchStartIndex < str.endIndex, let range = str.range(of: tupleToFind.0, range: searchStartIndex..<str.endIndex), !range.isEmpty {
        lastFoundIndex = str.index(str.startIndex, offsetBy: str.distance(from: str.startIndex, to: range.lowerBound))
        searchStartIndex = range.upperBound
      }

      if let index = lastFoundIndex {
        return (index, tupleToFind.1)
      } else {
        return nil
      }
    }
  }
}

private extension String {
  func firstWithIndex(where condition: (Character) -> (Bool)) -> (String.Index, String)? {
    if let char = self.first(where: { char in condition(char) }), let index = self.firstIndex(where: { char in condition(char) }) {
      return (index, String(char))
    } else {
      return nil
    }
  }

  func lastWithIndex(where condition: (Character) -> (Bool)) -> (String.Index, String)? {
    if let char = self.last(where: { char in condition(char) }), let index = self.lastIndex(where: { char in condition(char) }) {
      return (index, String(char))
    } else {
      return nil
    }
  }
}
