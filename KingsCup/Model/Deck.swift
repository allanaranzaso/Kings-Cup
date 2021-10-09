//
//  Deck.swift
//  KingsCup
//
//  Created by Allan Aranzaso on 2021-10-05.
//

import Foundation
import UIKit

class Deck {
    
    // load a static Json file from the project
    func loadJSON(_ fileName: String) {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else { fatalError("JSON file could not be loaded. Check the file name.")
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode([Card].self, from: data)
            for card in response {
                print(card)
            }
        } catch {
            debugPrint(error)
        }
    }
    
    let cardName:String = "Spade_Card14"
    func load() {
        for card in cardName {
            let cards = [UIImage(imageLiteralResourceName: card.description)]
            print(cards.count)
        }
    }
    
}

