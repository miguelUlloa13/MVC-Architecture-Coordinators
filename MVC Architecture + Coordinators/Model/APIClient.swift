//
//  APIClient.swift
//  MVC Architecture + Coordinators
//
//  Created by Miguel Angel Bric Ulloa on 06/05/23.
//

import Foundation

class ListOfPokemonsAPIClient {
    
    func getPokemons(completion: @escaping (Result<PokemonDataModelResponse, NetworkError>) -> Void) async {
        
        // Validate Url
        guard let pokeApiUrl = URL(string: "https://pokeapi.co/api/v2/pokemon/") else {
            return completion(.failure(.invalidURL))
        }
        
        do{
            // Send request
            let (data, response) = try await URLSession.shared.data(from: pokeApiUrl)

            // Validate http Response
            guard let httpResponse = response as? HTTPURLResponse else{
                return completion(.failure(.httpResponseError))
            }
            
            // Valide Http Code
            if (httpResponse.statusCode > 299){
                completion(.failure(.statusCodeError))
            }
            
            let decoder = JSONDecoder()
            do {
                let decodeData = try decoder.decode(PokemonDataModelResponse.self, from: data)
                print("Character Model: \(decodeData)")
                completion(.success(decodeData))
            } catch {
                completion(.failure(.couldNotDecodeData))
            }
            
        } catch {
            completion(.failure(.generic))
        }
    }
}
