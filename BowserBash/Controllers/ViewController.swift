//
//  ViewController.swift
//  BasicGame
//
//  Created by Niclas Borrmann on 09.12.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var magicianButton: UIButton!
    @IBOutlet weak var fighterButton: UIButton!
    @IBOutlet weak var bossButton: UIButton!
    @IBOutlet weak var magicianLabel: UILabel!
    @IBOutlet weak var fighterLabel: UILabel!
    @IBOutlet weak var bossLabel: UILabel!
    
    var fightersCounter = 0
     var fighter: Fighter!
     var magician: Magician!
     var boss: Boss!
     override func viewDidLoad() {
       super.viewDidLoad()
       initGame()
       NotificationCenter.default.addObserver(self, selector: #selector(onRestart(_:)), name: NSNotification.Name.init("restartGame"), object: nil)
     }
    
    
      func initGame() {
        // TODO: initialize Characters with values
          fighter = Fighter(maxHP: 100)
              magician = Magician(maxHP: 200)
              boss = Boss(maxHP: 600)
              magicianButton.isEnabled = true
              fighterButton.isEnabled = true
              bossButton.isEnabled = false
              updateLabels()
            }
    
    @objc func onRestart(_ notification: NSNotification) { initGame() }
    
    func updateLabels() {
        
        // TODO: override with Character lifepoints
        magicianLabel.text = String(magician.actualHP)
           fighterLabel.text = String(fighter.actualHP)
           bossLabel.text = String(boss.actualHP)
         }
    
    
    @IBAction func magicianPressed(_ sender: UIButton) {
        
        // TODO: Magician attack logic
        
        fightersCounter = fightersCounter + 1
             if (fightersCounter == 4 ) {
               bossButton.isEnabled = true
               fighterButton.isEnabled = false
               magicianButton.isEnabled = false
             }
             magician.randomAttack(charakter: fighter)
             updateLabels()
             gameOver()
           }
    
    @IBAction func fighterPressed(_ sender: UIButton) {
        
        // TODO: Fighter attack logic
        fightersCounter = fightersCounter + 1
        if (fightersCounter == 4 ) {
          bossButton.isEnabled = true
          fighterButton.isEnabled = false
          magicianButton.isEnabled = false
        }
        fighter.randomAttack(charakter: boss)
        updateLabels()
        gameOver()
      }
    func gameOver () {
      if (fighter.actualHP < 1 || magician.actualHP < 1) {
        performSegue(withIdentifier: "lostSegue", sender: nil)
      } else if (boss.actualHP < 1) {
        performSegue(withIdentifier: "wonSegue", sender: nil)
      }
    }
    
    @IBAction func bossButtonPressed(_ sender: UIButton) {
        
        // TODO: Boss attack logic
        
        let attackCharakter = [magician,fighter]
        guard let attack = attackCharakter.randomElement() else { return }
        bossButton.isEnabled = false
        fighterButton.isEnabled = true
        magicianButton.isEnabled = true
        fightersCounter = 0
        boss.randomAttack(charakter: attack ?? fighter)
        updateLabels()
        gameOver()
      }
    }
