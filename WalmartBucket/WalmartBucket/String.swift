//
//  String.swift
//  Pods
//
//  Created by Abid Amirali on 12/4/17.
//
//

import Foundation

extension String {
    func indexDistance(of character: Character) -> Int? {
        guard let index = characters.index(of: character) else { return nil }
        return distance(from: startIndex, to: index)
    }
}
