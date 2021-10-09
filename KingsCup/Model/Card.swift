//
//  Card.swift
//  King's Cup
//
//  Created by Allan Aranzaso on 2021-10-04.
//

import Foundation

// Card class which conforms to Decodable, the viewcontroller will load the data from a json file and will create Card objects
class Card: Decodable {
    // Filename of the card: ex. Heart_Card2
    var id: String
    // Face of the card: ex. Ace, 2, 3 ... etc
    var face: String
    // Value of the card: ex. Ace = 1, 2 = 2 ... etc
    var value: Int
    // Suit of the card: ex. Spade, Heart, Diamond, Club
    var suit: String
}
