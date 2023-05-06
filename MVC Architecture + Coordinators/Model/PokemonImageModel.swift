//
//  PokemonImageModel.swift
//  MVC Architecture + Coordinators
//
//  Created by Miguel Angel Bric Ulloa on 06/05/23.
//

import Foundation

struct PokemonImageModel: Decodable {
    
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case sprites
        case other
        case dreamWorld = "dream_world"
        case front_default = "image"
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let sprites = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .sprites)
        let other = try sprites.nestedContainer(keyedBy: CodingKeys.self, forKey: .other)
        let dreamWorld = try other.nestedContainer(keyedBy: CodingKeys.self, forKey: .dreamWorld)
        
        self.image = try dreamWorld.decode(String.self, forKey: .front_default)
    }
    
}
