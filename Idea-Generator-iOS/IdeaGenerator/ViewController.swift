//
//  ViewController.swift
//  IdeaGenerator
//
//  Created by Memo on 7/3/18.
//  Copyright © 2018 Memo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let startups = ["Make School", "Uber", "Netflix", "Facebook", "Google", "Kickstarter", "Spotify", "Airbnb", "Snapchat", "YouTube", "Dropbox", "Amazon", "Craigslist", "Tinder", "Instagram", "Tesla", "Twitter", "SpaceX"]
    
    let ideas = ["Dogs", "Books", "Gamers", "Star Wars", "Bitcoin", "Goats", "Zombies", "Rich People", "Swimmers", "Florida", "Vampires", "Dragons", "Internet of Things", "Mars", "Cryptocurrency", "Mosquito Repellent", "Fidget Spinners", "Sun Screen", "Water Bottles", "Lost Travelers", "Superheroes"]

    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    func generateIdea() {
        let maxIdeas = UInt32(ideas.count)
        let randomIdea = Int(arc4random_uniform(maxIdeas))
        
        let maxStartups = UInt32(startups.count)
        let randomStartup = Int(arc4random_uniform(maxStartups))
        
        label1.text = ideas[randomIdea]
        label2.text = startups[randomStartup]
    }
    
    @IBAction func generatePressed(_ sender: UIButton) {
        generateIdea()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        generateIdea()}

}
