//
//  WonViewController.swift
//  BasicGame
//
//  Created by Niclas Borrmann on 09.12.22.
//

import UIKit

class WonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func restartPressed(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name.init("restartGame"), object: nil)
        self.dismiss(animated: true)
    }
    
}
