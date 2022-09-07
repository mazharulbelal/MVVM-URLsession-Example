//
//  APIManager.swift
//  iOS Practical Test
//
//  Created by Belal on 7/9/22.
//

import Foundation

class APIManager {
    
    static let  shared = APIManager()
    private func decodeDataToJSON<T>(data: Data?,error: Error?,modelType: T.Type) -> (value: T?, err: Error?) where T : Decodable {
        guard error == nil else {
            return (nil,error)
        }
        
        guard let _data = data else {return (nil,nil)}
        do {
            let value =  try JSONDecoder().decode(modelType, from: _data)
            return (value,nil)
            
        }catch {
            return (nil,error)
        }
    }
    
    
    // MARK: - MOVIE LIST API CALLED
    func getMovieList(movieName: String, completion: @escaping COMPLETION_HANDLER<MovieDataModel>){

        guard let url = URL(string: Router.movieURL(name: movieName.replaceWhitespaces).path) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decodeJson = self.decodeDataToJSON(data: data, error: error, modelType: MovieDataModel.self)
            completion(decodeJson.value,decodeJson.err)
            
        }.resume()
    }
}
