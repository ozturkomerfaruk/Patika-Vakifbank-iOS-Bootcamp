//
//  ViewController.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 8.12.2022.
//

import UIKit

final class GameListVC: BaseVC {
    
    private let loadingActivityIndicator = UIActivityIndicatorView(style: .large)
    
    @IBOutlet private weak var gameListTableView: UITableView!
    private var viewModel = GameListViewModel()
    private var lottieView = LottieView()
    private var fetchingMore = false
    private var pageSize = 1
    private var perPage: Int = 25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationManager.shared.addLocalNotification()
        configureGameListVC()
        configureTableView()
        sortDeclaration()

    }
}

extension GameListVC {
    private func configureGameListVC() {
        viewModel.delegate = self
        
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.tintColor = .white
        self.title = "gameList".localized()
        
        //MARK: SearchController
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.searchBar.placeholder = "searchByName".localized()
        navigationItem.searchController = search
    }
    
    private func configureTableView() {
        gameListTableView.delegate = self
        gameListTableView.dataSource = self
        viewModel.fetchGameList()
        gameListTableView.register(UINib(nibName: "GameCustomCell", bundle: nil), forCellReuseIdentifier: "gameCustomCell")
        
    }
    
    private func sortDeclaration() {
        let sortAtoZ = UIAction(title: "sortAZ".localized()) { [weak self] action in
            guard let self = self else { return }
            self.viewModel.sortedAtoZ()
            self.viewModel.delegate = self
        }
        let sortZtoA = UIAction(title: "sortZA".localized()) { [weak self] action in
            guard let self = self else { return }
            self.viewModel.sortedZtoA()
            self.viewModel.delegate = self
        }
        let sortNewest = UIAction(title: "sortNewest".localized()) { [weak self] action in
            guard let self = self else { return }
            self.viewModel.fetchGameListOrderingNewest()
            self.viewModel.delegate = self
        }
        let sortOldest = UIAction(title: "sortOldest".localized()) { [weak self] action in
            guard let self = self else { return }
            self.viewModel.fetchGameListOrderingOldest()
            self.viewModel.delegate = self
        }
        let sortHighest = UIAction(title: "sortHighest".localized()) { [weak self] action in
            guard let self = self else { return }
            self.viewModel.fetchGameListOrderingHighest()
            self.viewModel.delegate = self
        }
        let sortLowest = UIAction(title: "sortLowest".localized()) { [weak self] action in
            guard let self = self else { return }
            self.viewModel.fetchGameListOrderingLowest()
            self.viewModel.delegate = self
        }
        let menu = UIMenu(title: "filterMenu".localized(), children: [sortAtoZ, sortZtoA, sortNewest, sortOldest, sortHighest, sortLowest])
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(named: "filter"), primaryAction: nil, menu: menu)
    }
    
}

//MARK: SearchController with Endpoint
extension GameListVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        let newString = text.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        viewModel.fetchGameListSearchByName(searchGameName: newString)
        gameListTableView.reloadData()
    }
}

extension GameListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getGameListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "gameCustomCell", for: indexPath) as? GameCustomCell,
              let model = viewModel.getGame(at: indexPath.row) else { return UITableViewCell() }
        cell.configureCell(model: model)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "gameDetailVC") as? GameDetailVC else { return }
        vc.model = viewModel.getGame(at: indexPath.row)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}

extension GameListVC: GameListViewModelDelegate {
    func gamesLoaded() {
        gameListTableView.reloadData()
        LottieManager.shared.stopLottie()
        stopLottie()
        lottieView.isHidden = true
    }
    
    func gamesFailed(error: Error) {
        print("\(error)")
    }
    
    func preFetch() {
        loadingLottieView(name: LottieNames.loading.rawValue)
    }
    
    func preSearchText() {
        lottieView = LottieView(frame: CGRect(origin: CGPointMake(0, 50), size: CGSize(width: self.view.frame.width, height: self.view.frame.height - 100)))
        lottieView.backgroundColor = .black
        LottieManager.shared.playLottie(view: lottieView, lottieName: LottieNames.gameBoyAdvance.rawValue)
        self.view.addSubview(lottieView)
    }
}
