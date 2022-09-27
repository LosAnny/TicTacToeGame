//
//  ViewController.swift
//  TicTacToeGame
//
//  Created by Анна Лошакова on 27.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn {
        case nought
        case cross
    }

    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var fieldA1: UIButton!
    @IBOutlet weak var fieldA2: UIButton!
    @IBOutlet weak var fieldA3: UIButton!
    
    @IBOutlet weak var fieldB1: UIButton!
    @IBOutlet weak var fieldB2: UIButton!
    @IBOutlet weak var fieldB3: UIButton!
    
    @IBOutlet weak var fieldC1: UIButton!
    @IBOutlet weak var fieldC2: UIButton!
    @IBOutlet weak var fieldC3: UIButton!
    
    var firstTurn = Turn.cross
    var currentTurn = Turn.cross
    
    let nought = "O"
    let cross = "X"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
    }
    
    func addToBoard(_ sender: UIButton) {
        if sender.title(for: .normal) == nil {
            if currentTurn == Turn.nought {
                sender.setTitle(nought, for: .normal)
                currentTurn = Turn.cross
                turnLabel.text = cross
            } else if currentTurn == Turn.cross {
                sender.setTitle(cross, for: .normal)
                currentTurn = Turn.nought
                turnLabel.text = nought
            }
        }
    }
}

