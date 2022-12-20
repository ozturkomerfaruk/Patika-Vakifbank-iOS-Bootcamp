//
//  FavouriteListViewModel.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 13.12.2022.
//

import Foundation

protocol FavouriteListProtocol {
    var delegate: FavouriteListDelegate? { get set }
    
    func getFavouritesCount() -> Int
    func fetchFavourites()
    func getFavourites(index: Int) -> FavouritesEntity
    func appendFavourites(gameId: Int)
    func deleteFavourites(index: Int)
    func isArrayEmpty() -> Bool
}

protocol FavouriteListDelegate: AnyObject {
    func favouritesLoaded()
    func favouritesFailed(error: Error)
    
    func preFetch()
    func postFetch()
}

final class FavouriteListViewModel: FavouriteListProtocol {
    weak var delegate: FavouriteListDelegate?
    private var favourites: [FavouritesEntity]?
    
    func getFavouritesCount() -> Int {
        return favourites?.count ?? 0
    }
     
    func fetchFavourites() {
        favourites = CoreDataManager.shared.getFavourites()
        self.delegate?.favouritesLoaded()
        if favourites?.count == 0 {
            delegate?.preFetch()
        } else {
            delegate?.postFetch()
        }
    }

    func getFavourites(index: Int) -> FavouritesEntity {
        return favourites![index]
    }
    
    func appendFavourites(gameId: Int) {
        favourites?.append(CoreDataManager.shared.saveFavourite(gameId: gameId)!)
        self.delegate?.favouritesLoaded()
        if favourites?.count != 0 {
            delegate?.postFetch()
        }
    }
    
    func deleteFavourites(index: Int) {
        let fav = favourites![index]
        favourites?.remove(at: index)
        CoreDataManager.shared.deleteFavourite(favourite: fav)
        self.delegate?.favouritesLoaded()
        if favourites?.count == 0 {
            delegate?.preFetch()
        }
    }
    
    func deleteFavouritesFromArray(index: Int) {
        favourites?.remove(at: index)
    }
    
    func isArrayEmpty() -> Bool {
        return favourites?.count == 0 ? true : false
    }
}
