//
//  FavouriteDetailVC.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 13.12.2022.
//

import UIKit

protocol FavouriteDetailVCDelegate: AnyObject {
    func deleteFavourite(index: Int)
}

final class FavouriteDetailVC: BaseVC {
    
    weak var delegate: FavouriteDetailVCDelegate?
    
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var imgGame: UIImageView!
    @IBOutlet private weak var lblDescription: UITextView!
    @IBOutlet private weak var lblRelease: UILabel!
    @IBOutlet private weak var lblUserReviews: UILabel!
    @IBOutlet private weak var btnFavouriteOutler: UIButton!
    
    
    private var iconImageViews: [UIImageView] = []
    @IBOutlet private weak var androidIcon: UIImageView!
    @IBOutlet private weak var appleIcon: UIImageView!
    @IBOutlet private weak var windowsIcon: UIImageView!
    @IBOutlet private weak var linuxIcon: UIImageView!
    @IBOutlet private weak var psIcon: UIImageView!
    @IBOutlet private weak var xboxIcon: UIImageView!
    @IBOutlet private weak var webIcon: UIImageView!
    @IBOutlet private weak var nintendoIcon: UIImageView!
    
    
    var gameId: Int?
    private var viewModel = FavouriteDetailViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureFavouriteDetailVC()
    }
    
    func configureFavouriteDetailVC() {
        iconImageViews.append(androidIcon)
        iconImageViews.append(appleIcon)
        iconImageViews.append(windowsIcon)
        iconImageViews.append(linuxIcon)
        iconImageViews.append(psIcon)
        iconImageViews.append(xboxIcon)
        iconImageViews.append(webIcon)
        iconImageViews.append(nintendoIcon)
        
        for i in iconImageViews {
            i.image = i.image?.withRenderingMode(.alwaysTemplate)
            i.tintColor = UIColor.white
            i.isHidden = true
        }
        
        viewModel.delegate = self
        viewModel.fetchFavouriteGameDetail(gameId: gameId!)
        viewModel.fetchFavourites()
        
        imgGame.layer.cornerRadius = 10
        btnFavouriteOutler.setTitle("removeFromFavourites".localized(), for: .normal)
    }
    
    @IBAction func removeFromFavouritesButtonAction(_ sender: Any) {
        for (i, fav) in self.viewModel.getFavourites().enumerated() {
            if fav.gameId == self.gameId! {
                self.viewModel.deleteFavourite(fav: fav, index: i)
                self.delegate?.deleteFavourite(index: i)
            }
        }
        self.dismiss(animated: true)
    }
    
    
}

extension FavouriteDetailVC: FavouriteDetailViewModelDelegate {
    func gameLoaded() {
        lblName.text = viewModel.getLblName()
        imgGame.load(url: URL(string: viewModel.getImgGame()!)!)
        lblDescription.text = viewModel.getLblDescription()
        lblRelease.text = viewModel.getLblRelease()
        lblUserReviews.text = viewModel.getLblUserReviews()
        
        for i in viewModel.getParentPlatform() {
            switch platformNameFunc(i.platform.name) {
            case "android":
                androidIcon.isHidden = false
                break
            case "apple":
                appleIcon.isHidden = false
                break
            case "windows":
                windowsIcon.isHidden = false
                break
            case "linux":
                linuxIcon.isHidden = false
                break
            case "ps":
                psIcon.isHidden = false
                break
            case "xbox":
                xboxIcon.isHidden = false
                break
            case "nintendo":
                nintendoIcon.isHidden = false
                break
            case "web":
                webIcon.isHidden = false
                break

            default:
                return
            }
        }
        
        indicator.stopAnimating()
    }
    
    func gameFailed(error: Error) {
        print("Error")
    }
    
    func preFetch() {
        indicator.startAnimating()
        indicator.color = .red
    }
    
    private func platformNameFunc(_ name: String) -> String {
        switch name {
        case "Android":
            return "android"
        case "iOS":
            return "apple"
        case "Apple Macintosh":
            return "apple"
        case "PC":
            return "windows"
        case "Linux":
            return "linux"
        case "PlayStation":
            return "ps"
        case "Xbox":
            return "xbox"
        case "Nintendo":
            return "nintendo"
        case "Web":
            return "web"
        default:
            return ""
        }
    }
}
