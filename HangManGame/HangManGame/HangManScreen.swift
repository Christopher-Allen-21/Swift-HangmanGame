//
//  HangManScreen.swift
//  HangManGame
//
//  Created by Chris Allen on 4/6/21.
//

import UIKit

class HangManScreen: UIViewController {

    @IBOutlet weak var currentGuessesText: UILabel!
    @IBOutlet weak var blankSpacesText: UILabel!
    @IBOutlet weak var gameStringText: UILabel!
    @IBOutlet weak var textFieldPrompt: UITextField!
    
    let wordList: [String] = ["abstract","assert","boolean","break","byte","case","catch","char","class","continue","default","do","double","else","enum","extends","final","finally","float","for","if","implements","import","instanceof","int","interface","long","native","new","package","private","protected","public","return","short","static","super","switch","synchronized","this","throws","throw","transient","try","void","volatile","while"]
    var currentGuesses: Int = 7
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gameString: String = self.generateWord()
        blankSpacesText.text = self.generateBlankSpaces(word: gameString)
        gameStringText.text = gameString;
        currentGuessesText.text = "Current Guesses: \(currentGuesses)"

    }
    
    
    func generateWord() -> String {
        let randomNum: Int = Int.random(in: 0...wordList.count-1);
        return wordList[randomNum]
    }
    
    func generateBlankSpaces(word: String) -> String {
        var blackSpaces: String = ""
        // _ replaces a placeholder variable (compiler was throwing warning as it was never used)
        for _ in word {
            blackSpaces.append("_  ")
        }
        
        return blackSpaces
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
