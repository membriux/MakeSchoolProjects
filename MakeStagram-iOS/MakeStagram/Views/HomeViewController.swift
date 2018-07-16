//
//  File.swift
//  MakeStagram
//
//  Created by Memo on 7/12/18.
//  Copyright © 2018 Memo. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        // Get the posts from Firebase using UserService
        UserService.posts(for: User.current) { (posts) in
            self.posts = posts
            self.tableView.reloadData()
        }
    }
    
}


// Retrieve data from the [Post] array and display them
extension HomeViewController: UITableViewDataSource {
    
    // Styling for teable view
    func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    // Method that returns the height that each cell should be
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let post = posts[indexPath.row]
        
        return post.imageHeight
    }
    
    
    // Gets count of posts
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
   // Displays picutres for each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostImageCell", for: indexPath) as! PostImageCell
        
        let imageURL = URL(string: post.imageURL)
        cell.postImageView.kf.setImage(with: imageURL)
        
        return cell
    }
    
    
}

