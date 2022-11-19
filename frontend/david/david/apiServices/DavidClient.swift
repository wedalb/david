//
//  DavidClient.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//
/*
import Foundation

class DavidClient{
    
    let session = URLSession.shared
    static let shared = DavidClient()
    
    /**
     A function that returns a url depending on what ghibli type you need (e.g. films, people, ...) you need.
     - Parameter type: An enum of ghibli data that you want to get the url of
     - Returns: A URL to the data inside of the ghibli api
     */
    func getGhibliURL (type: GhibliType) -> URL {
        let url = "https://ghibliapi.herokuapp.com/\(type.rawValue)"
        return URL(string: url)!
    }

    /**
     A function that fetches for Ghibli Data
     - Parameter type: The Type of data that you need specified in the enum GhibliType
     - Returns: An array containing a Ghibli  Data T Struct
     - Throws:
     */
    func fetchGhibliData<T : Decodable>(type: GhibliType) async throws -> [T] {
        let (data, _) = try await session.data(from: getGhibliURL(type: type))
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([T].self, from: data)
    }
}

*/
