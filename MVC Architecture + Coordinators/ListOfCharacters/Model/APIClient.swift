//
//  APIClient.swift
//  MVC Architecture + Coordinators
//
//  Created by Miguel Angel Bric Ulloa on 06/05/23.
//

import Foundation

class ListOfCharactersAPIClient {
    
    func getListOfCharacters() async -> Result<CharacterDataModelResponse, NetworkError> {
        
        // Validate Url
        guard let apiUrl = URL(string: "https://rickandmortyapi.com/api/character") else {
            return .failure(.invalidURL)
        }
        
        do{
            // Send request
            let (data, response) = try await URLSession.shared.data(from: apiUrl)

            // Validate http Response
            guard let httpResponse = response as? HTTPURLResponse else{
                return .failure(.httpResponseError)
            }
            
            // Valide Http Code
            if (httpResponse.statusCode > 299){
                return .failure(.statusCodeError)
            }
            
            let decoder = JSONDecoder()
            do {
                let decodeData = try decoder.decode(CharacterDataModelResponse.self, from: data)
                return .success(decodeData)
            } catch {
                return .failure(.couldNotDecodeData)
            }
            
        } catch {
            return .failure(.generic)
        }
    }

}
