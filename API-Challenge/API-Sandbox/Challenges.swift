//
//  Challenges.swift
//  API-Sandbox
//
//  Created by Dion Larson on 6/26/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation
import SwiftyJSON

internal func exerciseOne() {
    // This would normally be network calls that return `NSData`. We'll show you how to do those soon!
    // In this case, we are using a local JSON file.
    guard let jsonURL = Bundle.main.url(forResource: "Random-User", withExtension: "json") else {
        print("Could not find Random-User.json!")
        return
    }
    let jsonData = try! Data(contentsOf: jsonURL)
    
    
    // Enter SwiftyJSON!
    // userData now contains a JSON object representing all the data in the JSON file.
    // This JSON file contains the same data as the tutorial example.
    let userData = try! JSON(data: jsonData)
    
    // Alright, now we have a JSON object from SwiftyJSON containing the user data!
    // Let's save the user's first name to a constant!
    let firstName = userData["results"][0]["name"]["first"].stringValue
    // Do you see what we did there? We navigated down the JSON heirarchy, asked for "results",
    // then the first dictionary value of that array, then the dictionary stored in "name",
    // then the value stored in "first". We  then told it that we wanted the value as a string.
    
    /*
     
     Now it's your turn to get the rest of the values needed to print the following:
     
     "<first name> <last name> lives at <street name> in <city>, <state>, <post code>.
     If you want to contact <title>. <last name>, you can email <email address> or
     call at <cell phone number>."
     
     */
    

    let location = userData["results"][0]["location"]
    let name = userData["results"][0]["name"]
    let contact = userData["results"][0]

    let lastName = name["last"].stringValue
    let street = location["street"].stringValue
    let state = location["state"].stringValue
    let postcode = location["postcode"].stringValue
    let email = contact["email"].stringValue
    let cellphone = contact["phone"].stringValue
    let title = name["title"].stringValue

    
    print(firstName, lastName, "lives at", street, "in", state, ",", postcode + "."
        ,"If you want to contact", title + ".", lastName, "you can email", email,
         "or call at", cellphone + ".")
    
    
}



internal func exerciseTwo() {
    // This would normally be network calls that return `NSData`. We'll show you how to do those soon!
    // In this case, we are using a local JSON file.
    guard let jsonURL = Bundle.main.url(forResource: "iTunes-Movies", withExtension: "json") else {
        print("Could not find Random-User.json!")
        return
    }
    let jsonData = try! Data(contentsOf: jsonURL)
    
    
    // Enter SwiftyJSON!
    // moviesData now contains a JSON object representing all the data in the JSON file.
    // This JSON file contains the same data as the tutorial example.
    
    
    let moviesData = try! JSON(data: jsonData)
    
    // We save the value for ["feed"]["entry"][0] to topMovieData to pull out just the first movie's data
    
    
    //Uncomment lines below
    let topMovieData = moviesData["feed"]["entry"][0]
    let topMovie = Movie(json: topMovieData)
    
    // Uncomment this print statement when you are ready to check your code!
    
    print("The top movie is \(topMovie.name) by \(topMovie.rightsOwner). It costs $\(topMovie.price) and was released on \(topMovie.releaseDate). You can view it on iTunes here: \(topMovie.link)")
}

internal func exerciseThree() {
    // This would normally be network calls that return `NSData`. We'll show you how to do those soon!
    // In this case, we are using a local JSON file.
    guard let jsonURL = Bundle.main.url(forResource: "iTunes-Movies", withExtension: "json") else {
        print("Could not find iTunes-Movies.json!")
        return
    }
    let jsonData = try! Data(contentsOf: jsonURL)
    
    // Enter SwiftyJSON!
    // moviesData now contains a JSON object representing all the data in the JSON file.
    // This JSON file contains the same data as the tutorial example.
    let moviesData = try! JSON(data: jsonData)
    
    // We've done you the favor of grabbing an array of JSON objects representing each movie
    //*************** Remember this ***************
    let allMoviesData = moviesData["feed"]["entry"].arrayValue // Grabs each movie json
    
    
    /*
     Figure out a way to turn the allMoviesData array into Movie structs!
     */
    
    var allMovies: [Movie] = []
    for movieData in allMoviesData {
        let movie = Movie(json: movieData)
        allMovies.append(movie)
    }
    
    
    
    /*
     
     Uncomment the below print statement and then print out the names of the two Disney
     movies in allMovies. A movie is considered to be a "Disney movie" if `rightsOwner`
     contains the `String` "Disney". Iterate over all the values in `allMovies` to check!
     
     */
    
    print("The following movies are Disney movies:")
    for movie in allMovies {
        if (movie.rightsOwner.range(of: "Disney") != nil){
            print(movie.name)
        }
    }
    
    
    
    
    /*
     
     Uncomment the below print statement and then print out the name and price of each
     movie that costs less than $15. Iterate over all the values in `allMovies` to check!
     
     */
    
//    print("")
//    print("The following movies are cost less than $15:")
//    for movie in allMovies {
//        if movie.price < 15 {
//            print(movie.name, "$" + String(movie.price))
//        }
//    }
    
    
    
    
    /*
     
     Uncomment the below print statement and then print out the name and release date of
     each movie released in 2016. Iterate over all the values in `allMovies` to check!
     
     */
    print("")
    print("The following movies were released in 2016:")
    
    for movie in allMovies {
        var movieReleaseDate = movie.releaseDate.split(separator: " ")
        let movieYear = movieReleaseDate[2]
        if Int(movieYear) == 2016 {
            print(movie.name, "was released on", movie.releaseDate)
        }
    }
    
    
    
}











