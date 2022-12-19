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
    
    let nought = "o"
    let cross = "x"
    var board = [UIButton]()
    
    var noughtScore = 0
    var crossScore = 0
    
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
    
    // Нажатие по ячейке
    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        
        if checkForVictory(cross) {
            crossScore += 1
            resultAlert(title: "Крестики победили!")
        }
        
        if checkForVictory(nought) {
            noughtScore += 1
            resultAlert(title: "Нолики победили!")
        }
        
        if fullBorad() {
            resultAlert(title: "Ничья!")
        }
    }
    
    // Добавление крестика или нолика на доску
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
    
    // Проверка заполнили ли доску полностью
    func fullBorad() -> Bool {
        for button in board {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    
    // Проверка на победу
    func checkForVictory(_ s: String) -> Bool {
        
        // Горизонтальная победа
        if thisSymbol(fieldA1, s) && thisSymbol(fieldA2, s) && thisSymbol(fieldA3, s) {
            return true
        }
        
        if thisSymbol(fieldB1, s) && thisSymbol(fieldB2, s) && thisSymbol(fieldB3, s) {
            return true
        }
        
        if thisSymbol(fieldC1, s) && thisSymbol(fieldC2, s) && thisSymbol(fieldC3, s) {
            return true
        }
        
        // Вертикальная победа
        if thisSymbol(fieldA1, s) && thisSymbol(fieldB1, s) && thisSymbol(fieldC1, s) {
            return true
        }
        
        if thisSymbol(fieldA2, s) && thisSymbol(fieldB2, s) && thisSymbol(fieldC2, s) {
            return true
        }
        
        if thisSymbol(fieldA3, s) && thisSymbol(fieldB3, s) && thisSymbol(fieldC3, s) {
            return true
        }
        
        // Победа диагональная
        if thisSymbol(fieldA1, s) && thisSymbol(fieldB2, s) && thisSymbol(fieldC3, s) {
            return true
        }
        
        if thisSymbol(fieldA3, s) && thisSymbol(fieldB2, s) && thisSymbol(fieldC1, s) {
            return true
        }
        
        return false
    }
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        
        return button.title(for: .normal) == symbol
    }
    
    // Алерт по завершению
    func resultAlert(title: String) {
        let message = "\nКрестики: " + String(crossScore) + "\n\nНолики: " + String(noughtScore)
        let ac = UIAlertController(title: title,
                                   message: message,
                                   preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Играть заново",
                                   style: .default,
                                   handler: { _ in
            self.resetBoard()
        }))
        self.present(ac, animated: true)
    }
    
    // Очистка доски
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
    
}

