//
//  Charakter.swift
//  BasicGame
//
//  Created by Jacqueline Schmitz on 19.12.22.
//

import Foundation

class Charakters {
  let maxHP: Int
  var actualHP: Int
  init(maxHP: Int) {
    self.maxHP = maxHP
    self.actualHP = maxHP
  }
  func basisAttack (charakter: Charakters) {}
  func secondaryAttack (charakter: Charakters) {}
  func randomAttack (charakter: Charakters) {}
}
