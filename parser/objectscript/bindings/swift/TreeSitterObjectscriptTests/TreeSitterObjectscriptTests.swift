import XCTest
import SwiftTreeSitter
import TreeSitterObjectscript

final class TreeSitterObjectscriptTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_objectscript())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Objectscript grammar")
    }
}
