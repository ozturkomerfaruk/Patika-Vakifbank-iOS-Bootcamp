//
//  GameCustomCell.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 8.12.2022.
//

import UIKit

final class GameCustomCell: UITableViewCell {
    
    @IBOutlet private weak var androidIcon: UIImageView!
    @IBOutlet private weak var appleIcon: UIImageView!
    @IBOutlet private weak var windowsIcon: UIImageView!
    @IBOutlet private weak var linuxIcon: UIImageView!
    @IBOutlet private weak var psIcon: UIImageView!
    @IBOutlet private weak var xboxIcon: UIImageView!
    @IBOutlet private weak var webIcon: UIImageView!
    @IBOutlet private weak var nintendoIcon: UIImageView!
    private var iconImageViews: [UIImageView] = []
    
    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var gameName: UILabel!
    @IBOutlet private weak var gameReleaseDate: UILabel!
    @IBOutlet private weak var gameRating: UILabel!
    @IBOutlet private weak var gameGenres: UILabel!
    
    
    @IBOutlet private weak var releaseLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        iconImageViews.append(androidIcon)
        iconImageViews.append(appleIcon)
        iconImageViews.append(windowsIcon)
        iconImageViews.append(linuxIcon)
        iconImageViews.append(psIcon)
        iconImageViews.append(xboxIcon)
        iconImageViews.append(webIcon)
        iconImageViews.append(nintendoIcon)
        
        self.contentView.layer.cornerRadius = 20
        self.contentView.layer.masksToBounds = true
        gameImageView.layer.cornerRadius = 20
        self.gameImageView.layer.masksToBounds = true
        
        
        let customCellView = UIView()
        customCellView.backgroundColor = UIColor.clear
        self.selectedBackgroundView = customCellView
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .black
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10,
                                                                     left: 10,
                                                                     bottom: 10,
                                                                     right: 10))
    }
    
    override func prepareForReuse() {
        gameImageView.image = nil
        gameName.text = ""
        gameReleaseDate.text = ""
        gameRating.text = ""
        gameGenres.text = ""
    }
    
    func configureCell(model: GameModel) {
        
        for i in iconImageViews {
            i.image = i.image?.withRenderingMode(.alwaysTemplate)
            i.tintColor = UIColor.white
            i.isHidden = true
        }
        
        for i in model.parentPlatforms {
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
        
        for i in model.genres {
            gameGenres.text! += (i.name + " ")
        }
        
        gameName.text = model.name
        gameReleaseDate.text = model.released.formattedDateFromString(dateString: model.released, withFormat: "MMM dd, yyyy")
        gameRating.text = String(model.rating)
        
        gameImageView.load(url: URL(string: model.backgroundImage) ?? URL(string: Constants.OPPSImageURL)!)
        
        releaseLabel.text = "releaseDate".localized()
        genreLabel.text = "genres".localized()
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
