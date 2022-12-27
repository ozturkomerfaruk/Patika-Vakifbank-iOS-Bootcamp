//
//  MovieDetailRouter.swift
//  MovieViperArch
//
//  Created by Kaan YILDIRIM on 4.12.2022.
//

import UIKit

protocol MovieDetailRouterProtocol: AnyObject {}

final class MovieDetailRouter: MovieDetailRouterProtocol {
    weak var view: MovieDetailViewController!
    
    static func assembleModule(id: Int) -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        let presenter = MovieDetailPresenter()
        let interactor = MovieDetailInteractor()
        let router = MovieDetailRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.movieId = id
        
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}
