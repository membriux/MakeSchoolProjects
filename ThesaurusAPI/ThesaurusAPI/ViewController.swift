//
//  ViewController.swift
//  ThesaurusAPI
//
//  Created by Memo on 7/18/18.
//  Copyright © 2018 Memo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var synonyms: [String: String] = [:]
    var wordsUsed: [String]  = ["world", "arrow"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        getSynonyms()
        WordExists.check(wordGiven: "asdlfkajsdf;")

        
    }
    
    func getSynonyms() {
        print("Testing synonyms")
        
        for word in wordsUsed {
            var synonymText: String = ""
            Thesaurus.getSynonymsFor(word: word.lowercased()) { (synonymsArray) in
                DispatchQueue.main.sync {
                    for synonym in synonymsArray {
                        if synonym == synonymsArray[synonymsArray.count - 1] {
                            synonymText += synonym
                        } else {
                            synonymText += synonym +  ", "
                        }
                    }
                    print(synonymText)
                    self.synonyms[word] = synonymText
                    print(self.synonyms)
                }
            }
        }
    }
    


}

