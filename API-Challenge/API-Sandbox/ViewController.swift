//
//  ViewController.swift
//  API-Sandbox
//
//  Created by Dion Larson on 6/24/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator

class ViewController: UIViewController {

    var movieLink: String = ""
    var movieMenuList: [Movie] = []
    var movieSelectedIndex = 0

    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var rightsOwnerLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        exerciseOne()
//        exerciseTwo()
//        exerciseThree()
        
        getMovies()
        
        
        
    }
    
    
    // Updates the image view when passed a url string
    func loadPoster(urlString: String) {
        posterImageView.af_setImage(withURL: URL(string: urlString)!)
    }
    
    // Takes you to the itunes website
    @IBAction func viewOniTunesPressed(_ sender: AnyObject) {
        UIApplication.shared.openURL(URL(string: "\(self.movieLink)")!)
    }
    
    func updateLabels(movie: Movie) -> Void {
        movieTitleLabel.text = movie.name
        rightsOwnerLabel.text = movie.rightsOwner
        releaseDateLabel.text = movie.releaseDate
        priceLabel.text = "$" + String(movie.price)
        loadPoster(urlString: movie.posterImageURL)
    }
    
    func nextMovie(movieList: [Movie]) -> Movie {
        let randomInt = Int(arc4random_uniform(UInt32(24)))
        let randomMovie = movieList[randomInt]
        self.movieMenuList.append(randomMovie)
        return randomMovie
    }
    
}



