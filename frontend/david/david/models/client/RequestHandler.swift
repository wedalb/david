//
//  RequestHandler.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//

import Foundation

struct RequestHandler{
    
    let session = URLSession.shared
    static let shared = RequestHandler()
    
    /**
     A function that returns a url depending on what ghibli type you need (e.g. films, people, ...) you need.
     - Parameter type: An enum of ghibli data that you want to get the url of
     - Returns: A URL to the data inside of the ghibli api
     */
    func getURL (type: HTTPMethod) -> URL {
        let url = "https://ghibliapi.herokuapp.com/\(type.rawValue)" + "" // putin what we have to do
        return URL(string: url)!
    }
    
    /// A function that gives us all notes
    func fetchNotes() async throws -> [NoteStruct] {
        let (data, _) = try await session.data(from: getURL(type: HTTPMethod.GET))
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([NoteStruct].self, from: data)
    }
}
