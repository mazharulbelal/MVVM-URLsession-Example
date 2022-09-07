//
//  MovieDataModel.swift
//  iOS Practical Test
//
//  Created by Belal on 7/9/22.
//

// MARK: - WelcomeElement

import Foundation


struct MovieDataModel: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let overview: String?
    let posterPath: String?
    let title: String?
   
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case posterPath = "poster_path"
    }
}

