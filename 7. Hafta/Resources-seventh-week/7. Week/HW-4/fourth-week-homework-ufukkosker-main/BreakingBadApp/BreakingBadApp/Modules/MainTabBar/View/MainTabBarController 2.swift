//
//  MainTabBarController.swift
//  BreakingBadApp
//
//  Created by Ufuk on 21.11.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Breaking Bad App"
        
        let networking = NetworkManager(session: .shared)
        let breakingBadApi = BreakingBadAPI(networkManager: networking)
        
        let characterListDataProvider = CharacterListDataProvider(breakingBadAPI: breakingBadApi)
        let characterListViewModel = CharacterListViewModel(dataProvider: characterListDataProvider)
        let characterListVC = CharacterListVC(nibName: String(describing: CharacterListVC.self), bundle: .main)
        characterListVC.viewModel = characterListViewModel
        characterListVC.tabBarItem.title = "Characters"
        characterListVC.tabBarItem.image = UIImage(systemName: "person.3")
        characterListVC.tabBarItem.selectedImage = UIImage(systemName: "person.3.fill")
        
        let episodeListDataProvider = EpisodeListDataProvider(breakingBadAPI: breakingBadApi)
        let episodeListViewModel = EpisodeListViewModel(dataProvider: episodeListDataProvider)
        let episodeListVC = EpisodeListVC(nibName: String(describing: EpisodeListVC.self), bundle: .main)
        episodeListVC.viewModel = episodeListViewModel
        episodeListVC.tabBarItem.title = "Episodes"
        episodeListVC.tabBarItem.image = UIImage(systemName: "rectangle.stack.badge.play")
        episodeListVC.tabBarItem.selectedImage = UIImage(systemName: "rectangle.stack.badge.play.fill")
        
        let breakingBadWebVC = BreakingBadWebVC()
        breakingBadWebVC.tabBarItem.title = "IMDB"
        breakingBadWebVC.tabBarItem.image = UIImage(systemName: "film")
        breakingBadWebVC.tabBarItem.selectedImage = UIImage(systemName: "film.fill")
        self.viewControllers = [characterListVC, episodeListVC, breakingBadWebVC]
    }
}
