//
//  File.swift
//
//  Created by Tatsumi0000 on 2021/08/07.
//

import Foundation

struct ExternalMailApp {
    var text = "Hello, World!"
    
    let address: String
    let subject: String
    var body: String
    
    /// initializer
    /// - Parameters:
    ///   - address: To email
    ///   - subject: Email title
    ///   - body: Body
    init(address: String?, subject: String?, body: String?) {
        self.address = address?.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? ""
        self.subject = subject?.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? ""
        self.body = body ?? ""
    }
    
    /// Replace line breaks(/n with /r/n) in body text
    /// - Parameter body: The string to be replaced
    /// - Returns: Replaced String
    private func replaceBodyRN(body: String) -> String {
        let pattern = "\\n"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let replacedBody = regex.stringByReplacingMatches(in: body, options: [], range: NSRange(0..<body.count), withTemplate: "\r\n")
        return replacedBody
    }
    
    /// get mail open URL
    /// - Parameter replaceBodyRN: Which setting replace line breaks(/n with /r/n) in body text
    public func getOpenURL(bodyReplaceRN: Bool) -> URL {
        let body: String
        if bodyReplaceRN {
            body = self.replaceBodyRN(body: self.body).addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
            return URL(string: "mailto:\(self.address)?subject=\(self.subject)&body=\(body)")!
        }
        body = self.body.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
        return URL(string: "mailto:\(self.address)?subject=\(self.subject)&body=\(body)")!
    }
}
