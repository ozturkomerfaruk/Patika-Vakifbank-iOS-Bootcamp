//
//  CharacterDetailVC.swift
//  BreakingBadApp
//
//  Created by Ufuk on 24.11.2022.
//

import UIKit

class CharacterDetailVC: UIViewController {
    
    @IBOutlet private weak var characterDetailTableView: UITableView!
    
    var viewModel: CharacterDetailVCViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel?.character?.name ?? ""
        characterDetailTableView.dataSource = self
        registerCells()
        viewModel?.viewDidLoad()
    }
    
    private func registerCells() {
        let characterImageCellName = String(describing: CharacterImageCell.self)
        let characterImageCellNib = UINib(nibName: characterImageCellName, bundle: .main)
        characterDetailTableView.register(characterImageCellNib, forCellReuseIdentifier: characterImageCellName)
        
        let characterInfoCellName = String(describing: CharacterInfoCell.self)
        let characterInfoCellNib = UINib(nibName: characterInfoCellName, bundle: .main)
        characterDetailTableView.register(characterInfoCellNib, forCellReuseIdentifier: characterInfoCellName)
        
        let seeAllQuotesCellName = String(describing: SeeAllQuotesCell.self)
        let seeAllQuotesCellNib = UINib(nibName: seeAllQuotesCellName, bundle: .main)
        characterDetailTableView.register(seeAllQuotesCellNib, forCellReuseIdentifier: seeAllQuotesCellName)
    }
}

extension CharacterDetailVC: CharacterDetailVCDelegate {
    func handle(output: CharacterDetailVCOutput) {
        switch output {
        case .fetchedCharacter:
            characterDetailTableView.reloadData()
        }
    }
}

extension CharacterDetailVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionsCount = viewModel?.sections.count
        else { return 0 }
        return sectionsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = viewModel?.sections[indexPath.row],
              let characterName = viewModel?.character?.name
        else { return UITableViewCell() }
        
        switch section {
        case .characterImage:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CharacterImageCell.self), for: indexPath) as? CharacterImageCell {
                guard let imageURL = viewModel?.character?.img
                else { return UITableViewCell() }
                cell.configImage(with: imageURL)
                return cell
            }
        case .characterName(let title, let value):
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CharacterInfoCell.self), for: indexPath) as? CharacterInfoCell {
                cell.config(title: title, value: value)
                return cell
            }
        case .characterNickName(let title, let value):
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CharacterInfoCell.self), for: indexPath) as? CharacterInfoCell {
                cell.config(title: title, value: value)
                return cell
            }
        case .characterBirthday(let title, let value):
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CharacterInfoCell.self), for: indexPath) as? CharacterInfoCell {
                cell.config(title: title, value: value)
                return cell
            }
        case .characterStatus(let title, let value):
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CharacterInfoCell.self), for: indexPath) as? CharacterInfoCell {
                cell.config(title: title, value: value)
                return cell
            }
        case .characterPortrayed(let title, let value):
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CharacterInfoCell.self), for: indexPath) as? CharacterInfoCell {
                cell.config(title: title, value: value)
                return cell
            }
        case .seeAllQuotes:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SeeAllQuotesCell.self), for: indexPath) as? SeeAllQuotesCell {
                cell.config(nameOfSelectedCharacter: characterName)
                return cell
            }
        }
        return UITableViewCell()
    }
}
