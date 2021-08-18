import XCTest
@testable import ExternalMailApp_Swift

final class ExternalMailApp_SwiftTests: XCTestCase {
    
    var emp: ExternalMailApp!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFieldCheck() {
        self.emp = ExternalMailApp(address: nil, subject: nil, body: nil)
        
        XCTAssertEqual(emp.address, "", "nilを代入したのでaddressフィールドが空文字であることを確認")
        XCTAssertEqual(emp.subject, "", "nilを代入したのでsubjectフィールドが空文字であることを確認")
        XCTAssertEqual(emp.body, "", "nilを代入したのでbodyフィールドが空文字であることを確認")
    }
    
    func testGetOpenURL() {
        let body1 = "Hello, World!\n"
        self.emp = ExternalMailApp(address: "", subject: "", body: body1)
        let url = self.emp.getOpenURL(bodyReplaceRN: false)
        
        XCTAssertEqual(URL(string: "mailto:\("")?subject=\("")&body=\(body1.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!)")!, url, "getOpenURLメソッドがパーセントエンコーディングしたURLを返すことを確認")
    }
    
    func testReplaceBodyRN() {
        let body1 = "Hello, World!\n"
        let body2 = "Hello, World!\r\n"
        self.emp = ExternalMailApp(address: "", subject: "", body: body1)
        
        XCTAssertEqual(URL(string: "mailto:\("")?subject=\("")&body=\(body1.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!)")!, self.emp.getOpenURL(bodyReplaceRN: false), "\nを\r\nに置換されていないことを確認")
        
        XCTAssertEqual(URL(string: "mailto:\("")?subject=\("")&body=\(body2.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!)")!, self.emp.getOpenURL(bodyReplaceRN: true), "\nを\r\nに置換していることを確認")
        
        self.emp = ExternalMailApp(address: "", subject: "", body: body2)
        
        XCTAssertEqual(URL(string: "mailto:\("")?subject=\("")&body=\(body2.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!)")!, self.emp.getOpenURL(bodyReplaceRN: true), "\r\nが\r\r\nのように置換されていないことを確認")
        
    }
}
