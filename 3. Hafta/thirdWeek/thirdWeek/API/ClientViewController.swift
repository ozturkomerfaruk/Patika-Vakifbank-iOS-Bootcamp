//
//  ClientViewController.swift
//  thirdWeek
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
//

import UIKit

class ClientViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Client.getSpells { spells, error in
            guard let firstSpell = spells?[0] else { return }
            print(firstSpell.name!)
        }
        
    }

}
