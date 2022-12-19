//
//  Boss.swift
//  BasicGame
//
//  Created by Jacqueline Schmitz on 19.12.22.
//

import Foundation

class Boss: Charakters {
  let randomSecondary = Int.random(in: 40...80)
  override func basisAttack(charakter: Charakters) {
    charakter.actualHP = charakter.actualHP - Int.random(in: 20...40)
  }
  override func secondaryAttack(charakter: Charakters) {
    charakter.actualHP = charakter.actualHP - Int.random(in: 40...80)
  }
  override func randomAttack(charakter: Charakters) {
    let battleArray = [ 1, 1, 1, 1, 1, 2, 2, 2, 2 ,3 ]
    let chooseAttack = battleArray.randomElement()
     if (chooseAttack == 1) {
       basisAttack(charakter: charakter)
     } else if (chooseAttack == 2) {
       secondaryAttack(charakter: charakter)
     } else {
       maledictionlAttack(charakter: charakter)
     }
  }
  func maledictionlAttack(charakter: Charakters) {
    while (charakter.actualHP > 20) {
      charakter.actualHP = (charakter.actualHP - Int (Double(actualHP) * 0.20))
    }
  }
  func finisherAttack(charakter: Charakters){
    charakter.actualHP = 0
  }
}
