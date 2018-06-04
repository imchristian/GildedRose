import XCTest
@testable import GildedRose

class GildedRoseTests: XCTestCase {
    
    // MARK: Normal Items
    
    func testUpdateQuantityWithNormalItem() {
        let input = [Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20)]
        let expectedOutput = [Item(name: "+5 Dexterity Vest", sellIn: 9, quality: 19)]
        let actualOutput = GildedRose.updateQuality(items: input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
}
