//
//  ViewController.swift
//  Silly Song
//
//  Created by Salazar, Isaac on 10/19/17.
//  Copyright © 2017 Salazar, Isaac. All rights reserved.
//

import UIKit

extension CreateLyricsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

func shortName(from name: String) -> String {
    let lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    var index = lowercaseName.startIndex;
    
    for character in lowercaseName {
        if String(character).rangeOfCharacter(from: vowelSet) != nil {
            index = lowercaseName.index(of: character)!
            break
        }
    }
    
    return String(lowercaseName.suffix(from: index))
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    return lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName).replacingOccurrences(of: "<SHORT_NAME>", with: shortName(from: fullName))
}

class CreateLyricsViewController: UIViewController {
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")

    @IBOutlet weak var lyricsView: UITextView!
    
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }
    
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        if (!nameField.text!.isEmpty) {
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        }
    }
}
