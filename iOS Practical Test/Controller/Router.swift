//
//  Router.swift
//  iOS Practical Test
//
//  Created by Belal on 7/9/22.
//

import Foundation

let IMAGE_BASE_URL = "https://image.tmdb.org/t/p/w200"
typealias COMPLETION_HANDLER<T> = (_ json: T?, _ error: Error?)->Void

enum Router {
    
    case movieURL(name: String)

    var path: String {
        switch self {
            case.movieURL(let name):
                return "https://api.themoviedb.org/3/search/movie?api_key=38e61227f85671163c275f9bd95a8803&query=\(name)"
         
        }
    }
}
