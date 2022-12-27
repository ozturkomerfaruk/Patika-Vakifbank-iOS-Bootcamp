//
//  CharacterDetailsViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Esat Tozlu on 22.11.2022.
//

import UIKit

class CharacterDetailsViewController: UIViewController {

    @IBOutlet weak var characterCard: UIView!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var birthdayTextField: UILabel!
    @IBOutlet weak var nicknameTextField: UILabel!
    @IBOutlet weak var occupationTextField: UILabel!
    @IBOutlet weak var appearedSeasons: UILabel!
    @IBOutlet weak var quotesButton: UIButton!
    var character: CharacterModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureComponents()
        configureLabels()
    }
    
    //configrues labels
    func configureLabels() {
        guard let character = character else { return }
        NetworkManager.getImage(from: character.img) { image in
            guard let image = image else { return }
            self.characterImageView.image = image
        }
        nameTextField.text = character.name
        birthdayTextField.text = character.birthday
        nicknameTextField.text = character.nickname
        
        var occupationSring = ""
        character.occupation.forEach { occupationSring += "\($0) \n" }
        occupationTextField.text = occupationSring
        
        var appearedSeasonString = ""
        character.appearance.forEach{ appearedSeasonString += "\($0) "}
        appearedSeasons.text = appearedSeasonString
    }
    
    // configures other components
    func configureComponents() {
        characterCard.backgroundColor = .systemGray6
        characterCard.layer.cornerRadius = 15
        characterCard.layer.shadowColor = UIColor.black.cgColor
        characterCard.layer.shadowOffset = CGSize(width: 0, height: 0)
        characterCard.layer.shadowRadius = 15
        characterCard.layer.shadowOpacity = 0.3
        characterCard.layer.masksToBounds = false
        
        quotesButton.backgroundColor = .systemGray6
        quotesButton.layer.cornerRadius = 15
        quotesButton.layer.shadowColor = UIColor.black.cgColor
        quotesButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        quotesButton.layer.shadowRadius = 15
        quotesButton.layer.shadowOpacity = 0.3
        quotesButton.layer.masksToBounds = false
        
        characterImageView.layer.cornerRadius = 15
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let characterQuotesVC = segue.destination as? CharacterQuotesViewController
        characterQuotesVC?.character = character
    }
    
    
    @IBAction func showQuotesButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toCharacterQuotes", sender: nil)
    }
}
