//
//  Fighter.swift
//  BasicGame
//
//  Created by Jacqueline Schmitz on 19.12.22.
//

import Foundation

class Fighter: Charakters {
  let randomBasic = Int.random(in: 10...20)
  let randomSecondary = Int.random(in: 20...40)
  override func basisAttack(charakter: Charakters) {
    charakter.actualHP = charakter.actualHP - Int.random(in: 10...20)
  }
  override func secondaryAttack(charakter: Charakters) {
    charakter.actualHP = charakter.actualHP - Int.random(in: 20...40)
  }
  override func randomAttack(charakter: Charakters) {
    let battleArray = [ 1, 1, 1, 1, 1, 2, 2 ,3 ]
    var chooseAttack = battleArray.randomElement()
    if (chooseAttack == 1) {
      basisAttack(charakter: charakter)
    } else if (chooseAttack == 2) {
      secondaryAttack(charakter: charakter)
    } else {
      specialAttack(charakter: charakter)
    }
  }
  func specialAttack(charakter: Charakters) {
    charakter.actualHP = charakter.actualHP - 100
  }
}
