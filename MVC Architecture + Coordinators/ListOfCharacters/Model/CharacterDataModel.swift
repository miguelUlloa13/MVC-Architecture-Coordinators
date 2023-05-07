//
//  PokemonDataModel.swift
//  MVC Architecture + Coordinators
//
//  Created by Miguel Angel Bric Ulloa on 06/05/23.
//

import Foundation

struct CharacterDataModel: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
}
