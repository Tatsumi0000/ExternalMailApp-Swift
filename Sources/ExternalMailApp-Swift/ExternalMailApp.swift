//
//  File.swift
//
//  Created by Tatsumi0000 on 2021/08/07.
//

import Foundation

struct ExternalMailApp {
    var text = "Hello, World!"
    
    let email: String
    let subject: String
    let body: String
    
    /// initializer
    /// - Parameters:
    ///   - email: To email
    ///   - subject: Email title
    ///   - body: Body
    ///   - bodyReplaceRN: Which setting replace line breaks(/n with /r/n) in body text
    init(email: String, subject: String, body: String, bodyReplaceRN: Bool = false) {
        self.email = email
        self.subject = subject
        self.body = body
    }
    
    /// Replace line breaks(/n with /r/n) in body text
    /// - Parameter body: The string to be replaced
    /// - Returns: Replaced String
    func replaceBody(body: String) -> String {
        return body.replacingOccurrences(of: "\n", with: "\r\n")
    }

}
