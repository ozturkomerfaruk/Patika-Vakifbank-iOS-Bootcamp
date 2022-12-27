//
//  SeeAllQuotesCell.swift
//  BreakingBadApp
//
//  Created by Ufuk on 24.11.2022.
//

import UIKit

class SeeAllQuotesCell: UITableViewCell {

    @IBOutlet private weak var seeAllQuotesButton: UIButton!
    private var nameOfSelectedCharacter: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        seeAllQuotesButton.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(nameOfSelectedCharacter: String) {
        let characterName = nameOfSelectedCharacter.replacingOccurrences(of: " ", with: "+")
        self.nameOfSelectedCharacter = characterName
    }
    @IBAction func seeAllQuotesButtonTapped(_ sender: Any) {
        
        let network = NetworkManager(session: .shared)
        let breakingBadApi = BreakingBadAPI(networkManager: network)
        let quotesDataProvider = QuotesListDataProvider(breakingBadAPI: breakingBadApi)
        let quotesViewModel = QuotesListViewModel(dataProvider: quotesDataProvider, nameOfSelectedCharacter: nameOfSelectedCharacter)
        let quotesListVC = QuotesListVC()
        quotesListVC.viewModel = quotesViewModel
        UIApplication.topViewController()?.navigationController?.pushViewController(quotesListVC, animated: true)
    }
}
