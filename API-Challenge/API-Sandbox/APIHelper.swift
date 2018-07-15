//
//  APIHelper.swift
//  API-Sandbox
//
//  Created by Memo on 7/13/18.
//  Copyright © 2018 Make School. All rights reserved.
//


import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator

extension ViewController {
    
    
    func getMovies() {
        let apiToContact = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        // This code will call the iTunes top 25 movies endpoint listed above
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success: // Within a switch!!
                if let value = response.result.value {
                    let json = JSON(value)
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func getMovieObjects(json: JSON) -> [Movie] {
        // Do what you need to with JSON here!
        // The rest is all boiler plate code you'll use for API requests
        var movieList: [Movie] = []
        let movies = json["feed"]["entry"].arrayValue
        for movieData in movies {
            let movie = Movie(json: movieData)
            movieList.append(movie)
        }
        return movieList
    }
    
    
    
    
    
}
