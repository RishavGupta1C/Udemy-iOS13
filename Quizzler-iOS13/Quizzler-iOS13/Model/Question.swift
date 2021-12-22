//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Rishav Gupta on 29/09/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q text: String,a answer: String) {
        self.text = text
        self.answer = answer
    }
}
