//
//  RuleViewController.swift
//  King's Cup
//
//  Created by Allan Aranzaso on 2021-10-06.
//

import UIKit

class RuleViewController: UIViewController {
    
    lazy private var rules: [RuleCell] = []
    var cardDrawn: Card?
    
    @IBOutlet var ruleTitle: UILabel!
    @IBOutlet weak var cardDrawnSubText: UILabel!
    @IBOutlet weak var cardRuleTextDescription: UILabel!
    @IBOutlet var cardDisplayed: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load the rules array wit info from the JSON file
        rules = loadJSON("RuleData")
        
        // Unwrap optionals, set the image in the view, and retrieve
        //  the rules
        if let newCard = cardDrawn,
           let newImg = UIImage(named: newCard.id) {
            
            getRule(fromCard: newCard)
            getRuleTitle(fromCard: newCard)
            cardDisplayed.image = resize(image: newImg)
            
        }
    }
    
    
    /// Dismisses the modal view once the user is finished viewing the rule
    /// - Parameter sender: the sender, in this case, the UIButton
    @IBAction func endView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // TODO: card is too long (height)
    func resize(image: UIImage) -> UIImage {
        let size = cardDisplayed.bounds.size
        
        let renderer = UIGraphicsImageRenderer(size: size)
        let resizedImage = renderer.image {
            context in image.draw(in: CGRect(x:0, y:0, width: size.width, height: size.height))
        }
        return resizedImage
    }
    
    /// Retrieve the rule description from the rules array by iterating through each element. If a match is found
    ///  the description will be updated
    /// - Parameter card: the card that was drawn when the user tapped the "Draw" button
    fileprivate func getRule(fromCard card: Card?) {
        
        for rule in rules {
            // Unwrap optionals, if not nil -> set the text description
            if let cardValue = card?.value {
                if cardValue == rule.id {
                    cardRuleTextDescription.text = rule.rule
                }
            }
            
        }
        
    }
    
    
    /// Retrieve the rule name from the rules array by iterating through each element. If a match is found
    ///  the title will be updated
    /// - Parameter card: The card that was drawn when the user tapped the "Draw" button
    fileprivate func getRuleTitle(fromCard card: Card?) {
        
        for rule in rules {
            
            if let cardValue = card?.value {
                if cardValue == rule.id {
                    ruleTitle.text = rule.title
                }
            }
            
        }
    }
    
    fileprivate func getRuleInformation(fromCard card: Card?, updateThe text: UILabel, withRule ruleToUpdate: String) {
        
        for rule in rules {
            
            if let cardValue = card?.value {
                
                if cardValue == rule.id {
                    // if UILabel contains title.. update rule.title
                    // if UILabel contains textdesc... update rule.rule
                }
            }
        }
    }
    
    
}
