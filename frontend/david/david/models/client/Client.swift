//
//  Client.swift
//  david
//
//  Created by Heidi Albarazi on 30.12.22.
//



import Foundation



let endpoint = "http://localhost:8000/notes"

func getAllNotes() {
    guard let url = URL(string: endpoint) else {
        print("Error: Could not create URL from endpoint")
        return
    }

    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            print("Error: \(error)")
            return
        }

        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
                print("Error: Invalid HTTP response code")
                return
        }

        if let data = data, let notes = try? JSONDecoder().decode([Note].self, from: data) {
            print(notes)
        } else {
            print("Error: Could not decode data into notes")
        }
    }

    task.resume()
}

