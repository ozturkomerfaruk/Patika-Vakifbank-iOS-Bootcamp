//
//  MovieListViewModel.swift
//  MVVM-MovieDB
//
//  Created by Ömer Faruk Öztürk on 7.12.2022.
//

import Foundation

//Burada protocol kullanılmadan da kullanılırdı çünkü direk Classdan çekiyoruz veriyi. Ancak, bu Protocol tabanlı bir MVVM mimarisidir. Biz mesela burada ViewController tabanlı oluşturduk ViewModel'i ancak aynı şekilde belki bir tane View'ı da etkilemek istiyoruz ya da başka şeyleri vs. Protocol Oriented gitmek daha mantıklı. Burada maksat bu yapıyı göstermektir.

protocol MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate? { get set }
    
    func fetchPopularMovies()
    func getMovieCount() -> Int
    func getMovie(at index: Int) -> MovieModel?
    func getMovieId(at index: Int) -> Int?
}

protocol MovieListViewModelDelegate: AnyObject {
    func moviesLoaded()
    func moviesFailed(error: Error)
    
    //birde bu delegate işlemlerinde şunlar kullanılabiliyor.
    // func preFetch()
    // func postFetch()
    //Loglama işlemlerinin yapılması, activity Indicator'un açılması vs.
    //BaseController'a kadar gidebiliyor olay. Yabilirsen yap bunu da bitirme projesinde.
    //Ancak asıl olması gereken olay biraz buna giriyor.
}


class MovieListViewModel: MovieListViewModelProtocol {
    weak var delegate: MovieListViewModelDelegate?
    private var movies: [MovieModel]?
    
    func fetchPopularMovies() {
        Client.getPopularMovies { [weak self] models, error in
            guard let self = self else { return }
            if let error = error {
                self.delegate?.moviesFailed(error: error)
                //Alerti ViewController'da yapman gerekmekte. Burası ViewModel
            }
            
            self.movies = models
            self.delegate?.moviesLoaded()
        }
    }
    
    func getMovieCount() -> Int {
        movies?.count ?? 0
    }
    
    func getMovie(at index: Int) -> MovieModel? {
        movies?[index]
    }
    
    func getMovieId(at index: Int) -> Int? {
        movies?[index].id
    }
    
    
}
