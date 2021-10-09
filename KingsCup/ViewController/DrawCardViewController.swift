//
//  ViewController.swift
//  KingsCup
//
//  Created by Allan Aranzaso on 2021-10-04.
//

import UIKit

class DrawCardViewController: UIViewController {
    static let showRuleViewSegueIdentifier = "ShowRuleViewSegue"
    
    lazy var cards:[Card] = []
    private var cardDrawn: Card?
    
    @IBOutlet var cardDisplayed: UIImageView!
    @IBOutlet var drawButton: UIButton!
    @IBOutlet var shuffleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func resize(image: UIImage) -> UIImage {
        let size = cardDisplayed.bounds.size
        
        let renderer = UIGraphicsImageRenderer(size: size)
        let resizedImage = renderer.image {
            context in image.draw(in: CGRect(x:0, y:0, width: size.width, height: size.height))
        }
        return resizedImage
    }
    
    
    /// <#Description#>
    /// - Parameters:
    ///   - segue: <#segue description#>
    ///   - sender: <#sender description#>
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Check if the segue id matches the intended segue
        // Cast the destination as the destination Viewcontroller
        // and assign the variable in the destination view
        if segue.identifier == Self.showRuleViewSegueIdentifier,
           let destinationView = segue.destination as? RuleViewController {
            destinationView.cardDrawn = self.cardDrawn
        }
    }
    
    /// <#Description#>
    /// - Parameter sender: <#sender description#>
    @IBAction func drawACardButton(_ sender: Any) {
        print("Number of cards left in the deck: \(cards.count)")

        if let index = cards.indices.randomElement() {
            let rand = cards[index]
            if let newImg = UIImage(named: rand.id) {
                cardDisplayed.image = resize(image: newImg)
                cardDrawn = rand
                cards.remove(at: index)
            }
        }
        
        if cards.count == 0 {
            // end the game!
            fatalError("Not implemented yet")
        }
        
    
    }
    
    // MARK: Shuffle Cards button function
    /**
     Loads the deck using the CardData JSON file. Button will be disabled after tapping shuffle once
     */
    @IBAction func shuffleCardsButton(_ sender: Any) {
        drawButton.isEnabled = true // enable the draw button once shuffle is tapped once
        
        if cards.isEmpty {
            cards = loadJSON("CardData")
            
            shuffleButton.isEnabled = true
        }
        shuffleButton.isEnabled = false
    }
}

