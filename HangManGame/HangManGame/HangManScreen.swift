//
//  HangManScreen.swift
//  HangManGame
//
//  Created by Chris Allen on 4/6/21.
//

import UIKit

extension String {
    func characterAtIndex(index: Int) -> Character? {
        var cur = 0
        for char in self {
            if cur == index {
                return char
            }
            cur += 1
        }
        return nil
    }
}

class HangManScreen: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var letsPlayHangmanText: UILabel!
    @IBOutlet weak var currentGuessesText: UILabel!
    @IBOutlet weak var blankSpacesText: UILabel!
    @IBOutlet weak var gameStringText: UILabel!
    @IBOutlet weak var textFieldPrompt: UITextField!
    
    let wordList: [String] = ["abstract","assert","boolean","break","byte","case","catch","char","class","continue","default","do","double","else","enum","extends","final","finally","float","for","if","implements","import","instanceof","int","interface","long","native","new","package","private","protected","public","return","short","static","super","switch","synchronized","this","throws","throw","transient","try","void","volatile","while"]
    
    var currentGuesses: Int = 7
    var gameString: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textFieldPrompt.delegate = self; // this and textFieldShouldResign used to get keyboard to disappear on clicking Return
       
        gameString = generateWord()
        blankSpacesText.text = generateBlankSpaces(word: gameString)
        gameStringText.text = gameString;
        currentGuessesText.text = "Current Guesses: \(currentGuesses)"
    
    }
    
    // ************************************************************ //
    // *************             UI Logic             ************* //
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textFieldPrompt.resignFirstResponder()
    }
    
    @IBAction func enterWord(_ sender: Any) {
        checkGuess(guess: textFieldPrompt.text!) // ! is something to do with force unwrapping
    }
    
    // ************************************************************ //

    
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
    
    func checkGuess(guess: String) {
        let character = guess.characterAtIndex(index: 0)
        
        if(guess.count == 1){
            var correct: Bool = false
            for (i, _) in gameString.enumerated(){
                if(character?.lowercased() == gameString.characterAtIndex(index: i)?.lowercased()){
                    letsPlayHangmanText.text = "Correct!"
                    correct = true
                }
            }
            if(!correct){
                incorrectGuess()
            }
        }
        else if(guess.lowercased() == gameString.lowercased()){
            letsPlayHangmanText.text = "You WIN!"
        }
        else{
            incorrectGuess()
        }
    }
    
    
    func incorrectGuess() {
        letsPlayHangmanText.text = "Incorrect"
        currentGuesses -= 1
        currentGuessesText.text = "Current Guesses: \(currentGuesses)"
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
