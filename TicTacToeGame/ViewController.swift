//
//  ViewController.swift
//  TicTacToeGame
//
//  Created by Анна Лошакова on 27.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
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
    var board = [UIButton]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBoard()
    }
    
    // MARK: - Setup
    
    func initBoard() {
        board.append(contentsOf: [fieldA1, fieldA2, fieldA3])
        board.append(contentsOf: [fieldB1, fieldB2, fieldB3])
        board.append(contentsOf: [fieldC1, fieldC2, fieldC3])
    }

    // MARK: - Actions
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        
        if fullBorad() {
            resultAlert(title: "Draw")
        }
    }
    
    func resultAlert(title: String) {
        let ac = UIAlertController(title: title,
                                   message: nil,
                                   preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset",
                                   style: .default,
                                   handler: { _ in
            self.resetBoard()
        }))
        self.present(ac, animated: true)
    }
    
    func resetBoard() {
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        
        if firstTurn == Turn.nought {
            firstTurn = Turn.cross
            turnLabel.text = cross
        } else if firstTurn == Turn.cross {
            firstTurn = Turn.nought
            turnLabel.text = nought
        }
        
        currentTurn = firstTurn
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
            sender.isEnabled = false
        }
    }
    
    func fullBorad() -> Bool {
        for button in board {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
}

