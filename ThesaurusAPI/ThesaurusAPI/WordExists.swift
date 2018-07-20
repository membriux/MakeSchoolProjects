//
//  WordExists.swift
//  ThesaurusAPI
//
//  Created by Memo on 7/20/18.
//  Copyright © 2018 Memo. All rights reserved.
//

import Foundation
import SwiftyJSON

struct WordExists {
    
    static func check(wordGiven: String) -> Bool {
        guard let jsonURL = Bundle.main.url(forResource: "dictionary", withExtension: "json")
            else { return false }
        
        let jsonData = try! Data(contentsOf: jsonURL)
        let wordsJSON = try! JSON(data: jsonData)
        
        if wordsJSON[wordGiven] == 1 {
            return true
        } else {
            return false
        }
    }
    
}
