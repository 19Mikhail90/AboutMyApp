//
//  WelcomeViewController.swift
//  AboutMyApp
//
//  Created by Михаил Ю. Гоженко on 06.08.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var emojiLabel: UILabel!
    
    var welcomeText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: set welcome text

        welcomeLabel.text = "Welcome, \(welcomeText ?? "")!"
        
        // MARK: set background gradient

        let startColor = UIColor.init(
            red: 209 / 255,
            green: 123 / 255,
            blue: 147 / 255,
            alpha: 1.0
        ).cgColor
        
        let endColor = UIColor.init(
            red: 126 / 255,
            green: 156 / 255,
            blue: 231 / 255,
            alpha: 1.0
        ).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [startColor, endColor]
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        // MARK: set emoji

        
//        emojiLabel.text = ""
//        emojiLabel.font = UIFont.systemFont(ofSize: 80)
//        emojiLabel.textAlignment = .center
        emojiLabel.text = "👋🏽"
        
        view.addSubview(emojiLabel)
    }
}
