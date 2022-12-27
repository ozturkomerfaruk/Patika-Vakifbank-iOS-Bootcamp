//
//  RootRooter.swift
//  MovieViperArch
//
//  Created by Kaan YILDIRIM on 4.12.2022.
//

import UIKit

final class RootRooter {
    func showMovieListScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = MovieListRouter.assembleModule()
    }
}
