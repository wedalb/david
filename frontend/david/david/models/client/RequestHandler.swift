//
//  RequestHandler.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//

import Foundation
import Logging

struct RequestHandler{

    let url = "131.159.195.43:8080/48.137507736738335/11.575502142518554"

    let session = URLSession.shared
    static let shared = RequestHandler()
    
    
    func getURL () -> URL {
        return URL(string: url)!
    }
    
    /// A function that gives us all notes
    func fetchNotes() async throws -> [NoteStruct] {
        let (data, _) = try await session.data(from: getURL())
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([NoteStruct].self, from: data)
    }
    
    
    
    func fetchData<T : Decodable>() async throws -> [T] {
        let (data, _) = try await session.data(from: getURL())
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([T].self, from: data)
    }
}
