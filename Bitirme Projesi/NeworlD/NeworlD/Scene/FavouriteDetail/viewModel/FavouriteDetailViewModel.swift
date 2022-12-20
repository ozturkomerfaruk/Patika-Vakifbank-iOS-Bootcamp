//
//  FavouriteDetailViewModel.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 13.12.2022.
//

import Foundation

protocol FavouriteDetailViewModelProtocol {
    var delegate: FavouriteDetailViewModelDelegate? { get set }
    
    func fetchFavourites()
    func getFavourites() -> [FavouritesEntity]
    func fetchFavouriteGameDetail(gameId: Int)
    func getLblName() -> String?
    func getImgGame() -> String?
    func getLblDescription() -> String?
    func getLblRelease() -> String?
    func getLblUserReviews() -> String?
    func getParentPlatform() -> [ParentPlatformsBaseModel]
}

protocol FavouriteDetailViewModelDelegate: AnyObject {
    func gameLoaded()
    func gameFailed(error: Error)
    
     func preFetch()
}

final class FavouriteDetailViewModel: FavouriteDetailViewModelProtocol {
    var delegate: FavouriteDetailViewModelDelegate?
    private var model: GameDetailModel?
    private var favourites: [FavouritesEntity]? 
    
    func fetchFavourites() {
        favourites = CoreDataManager.shared.getFavourites()
    }
    
    func getFavourites() -> [FavouritesEntity] {
        return favourites ?? []
    }
    
    func deleteFavourite(fav: FavouritesEntity, index: Int) {
        favourites?.remove(at: index)
        CoreDataManager.shared.deleteFavourite(favourite: fav)
    }
    
    func fetchFavouriteGameDetail(gameId: Int) {
        delegate?.preFetch()
        Client.getGameDetail(gameID: gameId) { [weak self] model, error in
            guard let self = self else { return }
            if let error = error {
                self.delegate?.gameFailed(error: error)
            }
            self.model = model
            self.delegate?.gameLoaded()
        }
    }
    
    func getLblName() -> String? {
        return model?.name
    }
    
    func getImgGame() -> String? {
        if model?.backgroundImage == Constants.APIWebNilURL || model?.backgroundImage == nil {
            return Constants.OPPSImageURL
        }
        return model?.backgroundImage
    }
    
    func getLblDescription() -> String? {
        return model?.descriptionRaw
    }
    
    func getLblRelease() -> String? {
        return model?.released.formattedDateFromString(dateString: model!.released, withFormat: "MMM dd, yyyy")!
    }
    
    func getLblUserReviews() -> String? {
        let rating = model?.ratings.first
        
        return "\(rating?.title.capitalized ?? "") | \(rating?.count ?? -1) " + "userReviews".localized()
    }
    
    func getParentPlatform() -> [ParentPlatformsBaseModel] {
        return model?.parentPlatforms ?? []
    }
}
