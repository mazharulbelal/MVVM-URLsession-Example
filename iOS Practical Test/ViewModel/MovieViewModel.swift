//
//  MovieViewModel.swift
//  iOS Practical Test
//
//  Created by Belal on 7/9/22.
//

import Foundation

class MovieViewModel {
    
    var _movieList: [Result]?
    
    
    func getMovieList(movieName: String, completion : @escaping () -> ()) {
        APIManager.shared.getMovieList(movieName: movieName) { (dataModel, err) in
            guard err == nil else {
                print(err?.localizedDescription as Any)
                return }
            guard let _dataModel = dataModel else {return}
            self._movieList = _dataModel.results
            completion()
            
        }
    }
}
