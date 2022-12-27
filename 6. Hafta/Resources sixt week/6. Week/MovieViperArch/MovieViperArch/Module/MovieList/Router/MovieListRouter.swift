//
//  MovieListRouter.swift
//  MovieViperArch
//
//  Created by Kaan YILDIRIM on 4.12.2022.
//

import UIKit

protocol MovieListRouterProtocol: AnyObject {
    func navigateToDetail(id: Int)
}

final class MovieListRouter: MovieListRouterProtocol {
    weak var view: MovieListViewController!
    
    static func assembleModule() -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
        let presenter = MovieListPresenter()
        let interactor = MovieListInteractor()
        let router = MovieListRouter()
        
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        return navigation
    }
    
    func navigateToDetail(id: Int) {
        view.present(MovieDetailRouter.assembleModule(id: id), animated: true)
    }
}
