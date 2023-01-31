//
//  BoardVCPresenter.swift
//  Wordle Game
//
//  Created by mohamedSliem on 12/30/22.
//

import Foundation


class BoardVCPresenter {
    
    weak var view: BoardView?
    weak var boardView: BoardCollectionViewDelegate?
    weak var boardColorDelegate: BoardViewColorProtocol?
    
    private var currentRow: Int = 0
    private var currentColumn: Int = 0
    
    private var boardChars: [[Character]] = Array(repeating: Array(repeating: "\0", count: 5), count: 6)
    
    private var rightGuessWord: String = "trees"
    
    private var boardCellsColor: [[Character]] = Array(repeating: Array(repeating: "\0", count: 5), count: 6)
    
    init(view: BoardView, boardView: BoardCollectionView) {
        self.view = view
        self.boardView = boardView
    }
    
    func viewDidLoad(){
        getRandomWord()
    }
    
    func resetAll(){
        getRandomWord()
        currentRow = 0
        currentColumn = 0
        boardChars = Array(repeating: Array(repeating: "\0", count: 5), count: 6)
        boardCellsColor = Array(repeating: Array(repeating: "\0", count: 5), count: 6)
        view?.reloadBoardView()
        boardColorDelegate?.clearAllColor()
    }
    
    private func recognizeAction(with char: Character){
        
        if char == "+" {
            
            if currentColumn > 4 {
                guessEntered()
            }
        }
        else if char == "-"{
            removeCharFormBoard()
        }
        else if currentColumn < 5{
            boardChars[currentRow][currentColumn] = char
            boardView?.setCharacter(for: currentRow, at: currentColumn, char: char.uppercased())
            moveToNextColoumn()
        }

    }
    
    private func checkIfWordExist(boardString: String) -> Bool{
        return WordChecker.shared.checkIfWordExist(from: boardString)
    }
    
    private func guessEntered(){
        let boardString = String(boardChars[currentRow][0...4])
        
        switch checkIfWordExist(boardString: boardString) {
            case true:
                checkIfEnteredWordRight()
            case false:
                view?.showErrorAlert(title: "Wrong", message: "It is not a word", closeButtonMessage: "Another Try!")
        }
        
    }
    
    private func checkIfEnteredWordRight(){
        
        let enteredWord = String(boardChars[currentRow][0...4])
       
        if enteredWord == rightGuessWord {
           
            for i in 0 ... 4 {
                reviewAnimation(for: currentRow, column: i, red: 60/255, blue: 40/255, green: 200/255)
            }
            
            Timer.scheduledTimer(withTimeInterval: 2.7, repeats: false) { _ in
                self.view?.showCustomAlert(title: "Great", message: "You guessed the right word, new challenge?")
            }
        }
        else {
            // check the right charcter in the entered word
            reviewRightChars()
            Timer.scheduledTimer(withTimeInterval: 2.8, repeats: false) { _ in
                self.checkChancesNumber()
            }
        }
        
    }
    
    private func checkChancesNumber(){
        
        if currentRow == 5 {
            view?.showCustomAlert(title: "Oops", message: "The right guess is: \(rightGuessWord)")
        }
        else{
            moveToNextRow()
        }
    }
    
    private func reviewRightChars(){
        
        for i in 0 ... 4{
            
            let char = boardChars[currentRow][i]
            
            if char == rightGuessWord[i]{
                boardCellsColor[currentRow][i] = "G"
                reviewAnimation(for: currentRow, column: i, red: 60/255, blue: 40/255, green: 200/255)
                boardColorDelegate?.changeColor(for: char, red: 60/255, green: 200/255, blue: 40/255)
            }
            else if rightGuessWord.contains(char){
                boardCellsColor[currentRow][i] = "O"
                reviewAnimation(for: currentRow, column: i, red: 225/255, blue: 0/255, green: 165/255)
                boardColorDelegate?.changeColor(for: char, red: 225/255, green: 165/255, blue: 0/255)
            }
            else{
                boardCellsColor[currentRow][i] = "R"
                reviewAnimation(for: currentRow, column: i, red: 255/255, blue: 0/255, green: 0/255)
                boardColorDelegate?.changeColor(for: char, red: 255/255, green: 0/255, blue: 0/255)
            }
        }

    }
    
    private func reviewAnimation(for row: Int, column: Int, red: Float, blue: Float, green: Float){
        
        Timer.scheduledTimer(withTimeInterval: 0.3 * Double(column), repeats: false) { [weak self] timer in
            self?.boardView?.flipTranstion(for: row, at: column)
            self?.boardView?.setCellColor(for: row, at: column, red: red, blue: blue, green: green)
        }
    }
    
    //current column is an empty cell that must be filled with new char
    //so to remove a char, we must decrease the currentColumn to point at the cell with the char must be deleted
    //ex: H E L *  the * pictures the currentColumn index
    // so to delete L when button pressed we must first decrease the currentColumn index first and then remove the char.
    
    private func removeCharFormBoard(){
        
        if  currentColumn == 0 {
            return
        }
        currentColumn = (currentColumn - 1) >= 0 ? currentColumn - 1 : 0
        
        boardView?.removeCharacter(for: currentRow, at: currentColumn)
        boardChars[currentRow][currentColumn] = "\0"
        
        view?.reloadBoardView()
    }
    
    private func moveToNextRow(){
        currentRow += 1
        currentColumn = 0
    }
    
    private func moveToNextColoumn(){
        if currentColumn <= 4 {
            currentColumn += 1
        }
    }
}

extension BoardVCPresenter: BoardViewPresenter{
    
 
    func numberOfRows() -> Int {
        return 6
    }
    
    func numberOfItems() -> Int {
        return 5
    }
    
    func sizeForItem(width: Float, height: Float) -> (Float, Float) {
        let itemHeight = width / 6
        return (itemHeight, itemHeight)
    }
    
    
    func configure(cell: BoardCellView, section: Int, row: Int){
        cell.set(char: boardChars[section][row].uppercased())

        if boardCellsColor[section][row] == "G"{
            cell.setCurrentColor(red: 60/255, blue: 40/255, green: 200/255)
        }
        else if boardCellsColor[section][row] == "R"{
            cell.setCurrentColor(red: 255/255, blue: 0/255, green: 0/255)
        }
        else if boardCellsColor[section][row] == "O"{
            cell.setCurrentColor(red: 225/255, blue: 0/255, green: 165/255)
        }
    }
    
}

extension BoardVCPresenter: KeyboardPressedProtocol{
    
    func pressed(with char: Character) {
          recognizeAction(with: char)
    }
    
}


extension BoardVCPresenter{
    
    func getRandomWord(){
        
        view?.showIndicatorView()
        
        NetworkManager.shared.startRequest(with: BoardRequest.fetchRandomWord, objectType: String.self) { [weak self](result) in
            
            self?.view?.hideIndicatorView()
            switch result{
            
            case .success(let word):
                self?.rightGuessWord = word
                
            case .failure:
                DispatchQueue.main.async{
                self?.view?.showErrorAlert(title: "Error", message: "Something went wrong, check your connection", closeButtonMessage: "Try again")
                }
            }
        }
    }
}
