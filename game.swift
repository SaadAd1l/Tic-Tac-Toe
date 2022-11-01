//
//  game.swift
//  TicTacToe
//
//  Created by Saad Adil on 26/10/2022.
//

import Foundation

class GameState: ObservableObject
{
    @Published var board = [[Cell]]()
    @Published var turn = Tile.cross
    @Published var circleScore = 0
    @Published var crossesScore = 0
    @Published var showAlert = false
    @Published var alertMessage = "Draw"
    
    init()
    {
        resetBoard()
    }
    
    func turnText() -> String
    {
        return turn == Tile.cross ? "Turn: X" : "Turn: O"
    }
    
    func placeTile(_ row: Int,_ column: Int)
    {
        if(board[row][column].tile != Tile.empty)
        {
            return
        }
        
        board[row][column].tile = turn == Tile.cross ? Tile.cross : Tile.circle
        
        if(checkForVictory())
        {
            if (turn == Tile.cross)
            {
                crossesScore += 1
            }
            else
            {
                circleScore += 1
            }
            let winner = turn == Tile.cross ? "Crosses" : "Circles"
            alertMessage = winner + " Win!"
            showAlert = true
        }
        else
        {
            turn = turn == Tile.cross ? Tile.circle : Tile.cross
        }
        
        if (checkForDraw())
        {
            alertMessage = "Draw!"
            showAlert = true
        }
        
    }
    
    func checkForDraw() -> Bool
    {
        for row in board
        {
            for cell in row
            {
                if cell.tile == Tile.empty
                {
                    return false
                }
            }
        }
        
        return true
    }
    
    
    func checkForVictory() -> Bool
    {
        //Vertical Victories
        if isTurnTile(0, 0) && isTurnTile(1, 0) && isTurnTile(2, 0)
        {
            return true
        }
        if isTurnTile(0, 1) && isTurnTile(1, 1) && isTurnTile(2, 1)
        {
            return true
        }
        if isTurnTile(0, 2) && isTurnTile(1, 2) && isTurnTile(2, 2)
        {
            return true
        }
        //Horizontal Victories
        if isTurnTile(0, 0) && isTurnTile(0, 1) && isTurnTile(0, 2)
        {
            return true
        }
        if isTurnTile(1, 0) && isTurnTile(1, 1) && isTurnTile(1, 2)
        {
            return true
        }
        if isTurnTile(2, 0) && isTurnTile(2, 1) && isTurnTile(2, 2)
        {
            return true
        }
        
        //Diagnol Victories
        if isTurnTile(0, 0) && isTurnTile(1, 1) && isTurnTile(2, 2)
        {
            return true
        }
        if isTurnTile(0, 2) && isTurnTile(1, 2) && isTurnTile(2, 0)
        {
            return true
        }
        
        return false
        
    }
    
    func isTurnTile(_ row: Int,_ column: Int) -> Bool
    {
        return board[row][column].tile == turn
    }
    
    func resetBoard()
    {
        var newBoard = [[Cell]]()
        
        for _ in 0...2
        {
            var row = [Cell]()
            for _ in 0...2
            {
                row.append(Cell(tile: Tile.empty))
            }
            newBoard.append(row)
        }
        board = newBoard
    }
}
