//
//  GameDetailVC.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 9.12.2022.
//

import UIKit
import iCarousel

final class GameDetailVC: BaseVC {
    
    @IBOutlet private weak var tagsTableView: UITableView!
    @IBOutlet private weak var ratingsTableView: UITableView!
    @IBOutlet private weak var descriptionRaw: UITextView!
    @IBOutlet private weak var gameName: UILabel!
    @IBOutlet private weak var gamePublisher: UILabel!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var oppsImage: UIImageView!
    @IBOutlet private weak var favouriteOutletButton: UIButton!
    @IBOutlet private weak var tagLabel: UILabel!
    @IBOutlet private weak var aboutGameLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    
    private var isFavourite = false
    
    var model: GameModel?
    private var viewModel = GameDetailViewModel()
    
    private let myCarousel: iCarousel = {
        let view = iCarousel()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureGameDetailVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        viewModel.fetchFavourites()
        for i in viewModel.getFavourites() {
            if i.gameId == model!.id {
                isFavourite = true
                break
            } else {
                isFavourite = false
            }
        }
        if viewModel.getFavourites().isEmpty {
            isFavourite = false
        }
        favouriteOutletButton.setImage(UIImage(systemName: isFavourite ? "heart.fill" : "heart"), for: .normal)
    }
    
    @IBAction func favouriteActionButton(_ sender: Any) {
        if isFavourite {
            showAlertWithCancel(title: "warning".localized(), message: "removingFavourites".localized(), completion: { [weak self] buttonIndex in
                guard let self = self else { return }
                if buttonIndex == 0 {
                    for i in self.viewModel.getFavourites() {
                        if i.gameId == Int(self.model!.id) {
                            CoreDataManager.shared.deleteFavourite(favourite: i)
                            self.isFavourite = false
                            self.favouriteOutletButton.setImage(UIImage(systemName: self.isFavourite ? "heart.fill" : "heart"), for: .normal)
                        }
                    }
                } 
            })
            
        } else {
            isFavourite = true
            CoreDataManager.shared.saveFavourite(gameId: model!.id)
            tabBarController?.selectedIndex = 1
            
        }
        favouriteOutletButton.setImage(UIImage(systemName: isFavourite ? "heart.fill" : "heart"), for: .normal)
    }
}

extension GameDetailVC {
    private func configureGameDetailVC() {
        favouriteOutletButton.imageView?.contentMode = .scaleAspectFill
        setConfigureTableView()
        descriptionRaw.isEditable = false
        favouriteOutletButton.layer.cornerRadius = favouriteOutletButton.frame.height / 2
        
        view.addSubview(myCarousel)
        myCarousel.dataSource = self
        
        myCarousel.frame = CGRect(x: 0, y: 30, width: view.frame.size.width, height: 400)
        myCarousel.type = .rotary
        myCarousel.autoscroll = -0.3
        
        tagLabel.text = "tags".localized()
        aboutGameLabel.text = "aboutGame".localized()
        ratingLabel.text = "rating".localized()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "gameWebsite".localized(), style: .plain, target: self, action: #selector(goToWebsite))
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.tintColor = .white
        
        guard let model = model else { return }
        viewModel.delegate = self
        viewModel.fetchGameDetail(id: model.id)
        
        oppsImage.isHidden = true
        if viewModel.iCorouselImagesCount(model: model) == 0 {
            oppsImage.isHidden = false
            oppsImage.load(url: URL(string: Constants.OPPSImageURL)!)
        }
    }
    
    @objc func goToWebsite() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "gameWebsiteVC") as? GameWebsiteVC else { return }
        vc.gameWebsiteURLString = viewModel.getWebsiteURLString()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setConfigureTableView() {
        tagsTableView.backgroundColor = .clear
        ratingsTableView.backgroundColor = .clear
        
        tagsTableView.delegate = self
        tagsTableView.dataSource = self
        tagsTableView.register(UINib(nibName: "TagsCustomCell", bundle: nil), forCellReuseIdentifier: "tagsCustomCell")
        
        ratingsTableView.delegate = self
        ratingsTableView.dataSource = self
        ratingsTableView.register(UINib(nibName: "RatingsCustomCell", bundle: nil), forCellReuseIdentifier: "ratingsCustomCell")
        
        if model?.tags.count == 0 {
            tagsTableView.isHidden = true
        }
    }
}

extension GameDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case tagsTableView:
            return model?.tags.count ?? 0
        case ratingsTableView:
            return viewModel.getRatingTableCount()
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case tagsTableView:
            guard let tagCell = tableView.dequeueReusableCell(withIdentifier: "tagsCustomCell", for: indexPath) as? TagsCustomCell else { return UITableViewCell() }
            tagCell.configureTagsCustomCell(tagModel: (model?.tags[indexPath.row])!)
            return tagCell
        case ratingsTableView:
            guard let ratingCell = tableView.dequeueReusableCell(withIdentifier: "ratingsCustomCell", for: indexPath) as? RatingsCustomCell else { return UITableViewCell() }
            ratingCell.configureCustomCell(model: viewModel.getRating(index: indexPath.row)!)
            return ratingCell
        default:
            return UITableViewCell()
        }
    }
}

extension GameDetailVC: iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return viewModel.iCorouselImagesCount(model: self.model!)
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.13, height: 200))
        view.backgroundColor = .systemGray
        let imageview = UIImageView(frame: view.bounds)
        view.addSubview(imageview)
        imageview.contentMode = .scaleToFill
        imageview.load(url: URL(string: viewModel.iCorouselImagesArray(model: model!)[index])!)
        return view
    }
}

extension GameDetailVC: GameDetailViewModelDelegate {
    func gamesLoaded() {
        descriptionRaw.text = viewModel.getDescriptionRow()
        gameName.text = model?.name
        gamePublisher.text = viewModel.getPublisher()
        
        tagsTableView.reloadData()
        ratingsTableView.reloadData()
        
        if viewModel.getRatingTableCount() == 0 {
            self.tagsTableView.isHidden = true
        }
        indicator.stopAnimating()
    }
    
    func gamesFailed(error: Error) {
        showAlert(title: "error".localized(), message: "\(error)", completion: { })
    }
    
    func preFetch() {
        indicator.startAnimating()
    }
}
