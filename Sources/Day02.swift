import Algorithms

struct Day02: AdventDay {
  var data: String

  let limits = ["red": 12, "green": 13, "blue": 14]

  var entities: [(Int, [[(String, Int)]])] {
    data.split(separator: "\n").map { line in
      let parts = line.split(separator: ":")
      let id = Int(String(parts.first!.split(separator: " ").last!))!
      let games = games(input: parts.last!)
      return (id, games)
    }
  }

  func games(input: Substring) -> [[(String, Int)]] {
    input.split(separator: ";").map { game in
      game.split(separator: ",").map { pair in
        let cubes = pair.split(separator: " ")
        let count = Int(String(cubes.first!))!
        let color = String(cubes.last!)
        return (color, count)
      }
    }
  }

  func part1() -> Any {
    entities.compactMap { game in
      let id = game.0
      let gameInstances = game.1.compactMap { bags in
        let invalidBags = bags.compactMap { (cubeColor, cubeNumber) in
          if let limit = limits[cubeColor] {
            return limit < cubeNumber ? cubeNumber : nil
          } else {
            return nil
          }
        }
        return invalidBags.isEmpty ? nil : true
      }
      return gameInstances.isEmpty ? id : nil
    }.reduce(0, +)
  }

  func part2() -> Any {
    entities.compactMap { game in
      let gameInstances = game.1.flatMap { bags in
        var maxSet = ["green": 0, "red": 0, "blue": 0]
        bags.forEach { (cubeColor, cubeNumber) in
          if maxSet[cubeColor]! < cubeNumber {
            maxSet[cubeColor] = cubeNumber
          }
        }
        return maxSet
      }
      var maxSet = ["green": 0, "red": 0, "blue": 0]
      gameInstances.forEach { (cubeColor, cubeNumber) in
        if maxSet[cubeColor]! < cubeNumber {
          maxSet[cubeColor] = cubeNumber
        }
      }
      return maxSet
    }.reduce(0) { partialResult, minCubeSet in
      let minCubeProduct = minCubeSet.reduce(1) { partialResult, minColor in
        partialResult * minColor.1
      }
      return partialResult + minCubeProduct
    }
  }
}
