//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    
    var questionNumber = 0
    
    var stories = [
        Story(story0: "You see a fork in the road", choice1: "Take a left", choice2: "Take a right", choice1Destination: 2, choice2Destination: 1),
        Story(story0: "You see a tiger", choice1: "Shout for help", choice2: "Play dead", choice1Destination: 2, choice2Destination: 3),
        Story(story0: "You find a treasure chest", choice1: "Open it", choice2: "Check for traps", choice1Destination: 0, choice2Destination: 1),]
    
    mutating func nextStory(_ userAnswer: String)  {
        
        let currentStory = stories[questionNumber]
        if userAnswer == currentStory.choice1 {
            questionNumber = currentStory.choice1Destination
        } else if
            userAnswer == currentStory.choice2 {
            questionNumber = currentStory.choice2Destination
        }
    }
    
    
    func nextQuestion() -> String {
        return stories[questionNumber].story0
    }
    
    func getChoice1() -> String {
        
        return stories[questionNumber].choice1
    }
    
    func getChoice2() -> String {
        return stories[questionNumber].choice2
    }
}
