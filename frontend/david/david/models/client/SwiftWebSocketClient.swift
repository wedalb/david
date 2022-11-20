//
//  SwiftWebSocketClient.swift
//  david
//
//  Created by Heidi Albarazi on 20.11.22.
//

import Foundation
import SwiftWebSockets

final class SwiftWebSocketClient: NSObject {
    
    var request = URLRequest(url: URL(string: "http://http://131.159.195.43:8080/48.137507736738335/11.575502142518554"))
    
    request.timeoutInterval = 5
    socket = WebSocket(request: request)
    socket.delegate = self
    socket.connect()
}
