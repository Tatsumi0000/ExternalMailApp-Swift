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
    var body: String = ""
    
    /// initializer
    /// - Parameters:
    ///   - email: To email
    ///   - subject: Email title
    ///   - body: Body
    init(email: String, subject: String, body: String) {
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
    
    //TODO: 次にやることリスト
    /// - 1. エスケープ処理をするメソッドの追加
    /// - 2. エスケープ処理した文字列をURLに合体するメソッドの追加
    /// - 3.
    ///
    ///
    
    /// <#Description#>
    /// - Parameter ReplaceBodyRN: Which setting replace line breaks(/n with /r/n) in body text
    func generateOpenURL(ReplaceBodyRN: Bool = false) {
        let body = ReplaceBodyRN ? self.replaceBody(body: self.body) : self.body
    }
    
    func getOpenURL(bodyReplaceRN: Bool = false) -> URL {
        return URL()
    }
}
