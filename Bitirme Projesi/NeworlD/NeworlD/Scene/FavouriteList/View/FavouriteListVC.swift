//
//  FavouriteList.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 13.12.2022.
//

import UIKit

final class FavouriteListVC: BaseVC {
    
    @IBOutlet private weak var favouritesCollectionView: UICollectionView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    private var viewModel = FavouriteListViewModel()
    private var lottieView = LottieView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureFavouriteListVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        viewModel.fetchFavourites()
    }
    
    func configureFavouriteListVC() {
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.tintColor = .white
        
        favouritesCollectionView.delegate = self
        favouritesCollectionView.dataSource = self
        viewModel.delegate = self
    }
}

extension FavouriteListVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getFavouritesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favouriteCustomCell", for: indexPath) as? FavouriteCustomCell else { return UICollectionViewCell() }
        let fav = viewModel.getFavourites(index: indexPath.row)
        cell.configureCustomCell(fav: fav)
        cell.index = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "favouriteDetailVC") as? FavouriteDetailVC else { return }
        if let presentationController = vc.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
        }
        vc.gameId = Int(viewModel.getFavourites(index: indexPath.row).gameId)
        vc.delegate = self
        present(vc, animated: true)
    }
}

extension FavouriteListVC: FavouriteListDelegate {
    func favouritesLoaded() {
        favouritesCollectionView.reloadData()
        titleLabel.text = viewModel.isArrayEmpty() ? "anyFavourite".localized() : "favourites".localized()
        if viewModel.isArrayEmpty() {
            titleLabel.textAlignment = viewModel.isArrayEmpty() ? .center : .left
        }
    }
    
    func favouritesFailed(error: Error) {
        showAlert(title: "error".localized(), message: "\(error)", completion: { })
    }
    
    func preFetch() {
        lottieView = LottieView(frame: CGRect(origin: CGPointMake(0, 200), size: CGSize(width: self.view.frame.width, height: 400)))
        lottieView.backgroundColor = .black
        LottieManager.shared.playLottie(view: lottieView, lottieName: LottieNames.gameBoy.rawValue)
        self.view.addSubview(lottieView)
    }
    
    func postFetch() {
        LottieManager.shared.stopLottie()
        self.lottieView.isHidden = true
    }
}

extension FavouriteListVC: FavouriteCustomCellDelegate {
    func deleteFavourite(index: Int) {
        showAlertWithCancel(title: "warning".localized(), message: "removingFavourites".localized()) {
            [weak self] buttonIndex in
            guard let self = self else { return }
            if buttonIndex == 0 {
                self.viewModel.deleteFavourites(index: index)
                
            }
        }
    }
}

extension FavouriteListVC: FavouriteDetailVCDelegate {
    func favoruiteDetailLoaded(index: Int) {
        viewModel.deleteFavourites(index: index)
    }
}
