//
//  PokemonDataModelResponse.swift
//  MVC Architecture + Coordinators
//
//  Created by Miguel Angel Bric Ulloa on 06/05/23.
//

import Foundation

struct PokemonDataModelResponse: Decodable {
    let pokemons: [PokemonDataModel]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pokemons = try container.decode([PokemonDataModel].self, forKey: .results)
    }
}
