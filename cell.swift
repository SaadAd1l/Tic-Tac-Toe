//
//  File.swift
//  Tic Tac Toe
//
//  Created by Saad Adil on 26/10/2022.
//

import Foundation
import SwiftUI

struct Cell
{
    var tile: Tile
    
    func displayTile() -> String
    {
        switch(tile)
        {
        case Tile.circle:
            return "O"
        case Tile.cross:
            return "X"
        default:
            return ""
        }
        
    }
    
    func tileColor() -> Color
    {
        switch(tile)
        {
        case Tile.circle:
            return Color.red
        case Tile.cross:
            return Color.black
        default:
            return Color.black
        }
        
    }
}
enum Tile
{
    case circle
    case cross
    case empty
}
