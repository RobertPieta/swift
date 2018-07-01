//===--- IndexSetTests.swift ----------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2017 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import TestsUtils
import Foundation

public let IndexSetTests = [
  BenchmarkInfo(name: "IndexSetUnion", runFunction: run_IndexSetUnion, tags: [.validation, .api, .Set]),
]

@inline(never)
public func run_IndexSetUnion(_ N: Int) {
  let size = 400

  SRand()

  var set = IndexSet()
  var otherSet = IndexSet()

  for _ in 0 ..< size {
    set.insert(Int(truncatingIfNeeded: Random()))
    otherSet.insert(Int(truncatingIfNeeded: Random()))
  }

  for _ in 0 ..< N * 100 {
    _ = set.union(otherSet)
  }
}
