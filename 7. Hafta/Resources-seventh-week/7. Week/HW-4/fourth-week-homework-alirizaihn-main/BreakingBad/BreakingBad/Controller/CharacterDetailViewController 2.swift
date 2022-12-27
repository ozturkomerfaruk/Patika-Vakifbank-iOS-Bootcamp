//
//  CharacterDetailViewController.swift
//  BreakingBad
//
//  Created by Ali Rıza İLHAN on 27.11.2022.
//

import UIKit

final class CharacterDetailViewController: UIViewController {
    //    Karakterlerin Detay Sayfasının gösterildiği ekranın VClü
    var character: CastModel?
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var birthdayLabel: UILabel!
    @IBOutlet private weak var nicknameLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let character = character {
            statusLabel.text = "Status: " + character.status
            birthdayLabel.text = "Birthday: " +  character.birthday
            nicknameLabel.text = "Nickname: " +  character.nickname
            nameLabel.text =  "Name: " + character.name
            imageView.sd_setImage(with: URL(string: character.img), placeholderImage: UIImage(named: "placeholderImg.jpeg"))
            title = character.name
        }
        

    }
 
    @IBAction func openQutesPagePressed(_ sender: Any) {
        guard let pushWithIdVC = storyboard?.instantiateViewController(withIdentifier: "QuotesViewController") as? QuotesViewController else { return }
        pushWithIdVC.character = character
        self.navigationController?.pushViewController(pushWithIdVC, animated: true)

    }
    
   
    
}
