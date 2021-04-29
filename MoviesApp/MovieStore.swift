//
//  MovieStore.swift
//  MoviesApp
//
//  Created by Trenton Lazorchak on 4/29/21.
//

import Foundation

struct MovieResponse: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Decodable {
    let imdbID: String
    let title: String
    let poster: String
    let year: String
    let type: String
    
    private enum CodingKeys: String, CodingKey {
        case imdbID
        // title, year and poster mapped to capital first letter because of JSON
        case title = "Title"
        case poster = "Poster"
        case year = "Year"
        case type = "Type"
    }
}

class MovieStore: ObservableObject {
    
    @Published var movies: [Movie]? = [Movie]()
    
    func getAll() {
        
        // url for the JSON from API
        // first page of the batman movies, more movies can be accessed with multiple API calls
        guard let url = URL(string: "http://www.omdbapi.com/?s=Batman&page=1&apikey=587dcb3c") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            if let movieResponse = movieResponse {
                DispatchQueue.main.async {
                    self.movies = movieResponse.movies
                }
            }
            
        }.resume()
        
    }
    
}
