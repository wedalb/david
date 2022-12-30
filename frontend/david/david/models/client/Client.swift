//
//  Client.swift
//  david
//
//  Created by Heidi Albarazi on 30.12.22.
//



import Foundation



let endpoint = "http://localhost:8000/notes"

func getAllNotes(completion: @escaping ([Note]?) -> Void) {
    guard let url = URL(string: endpoint) else {
        print("Error: Could not create URL from endpoint")
        completion(nil)
        return
    }

    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            print("Error: \(error)")
            completion(nil)
            return
        }

        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
                print("Error: Invalid HTTP response code")
                completion(nil)
                return
        }

        if let data = data, let notes = try? JSONDecoder().decode([Note].self, from: data) {
            completion(notes)
        } else {
            print("Error: Could not decode data into notes")
            completion(nil)
        }
    }

    task.resume()
}

