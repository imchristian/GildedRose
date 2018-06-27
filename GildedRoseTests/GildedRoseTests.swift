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
    
    // Once the sell by date has passed, Quality degrades twice as fast
    func testDegrateTwiceAsFast() {
        let input = [Item(name: "Mauro Item", sellIn: 0, quality: 10)]
        let expectedOutput = [Item(name: "Mauro Item", sellIn: -1, quality: 8)]
        let actualOutput = GildedRose.updateQuality(items: input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    // The Quality of an item is never negative
    func testNeverNegativeQuality() {
        let input = [Item(name: "Mauro Item", sellIn: 0, quality: 0)]
        let expectedOutput = [Item(name: "Mauro Item", sellIn: -1, quality: 0)]
        let actualOutput = GildedRose.updateQuality(items: input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    // "Aged Brie" actually increases in Quality the older it gets
    func testAgedBrieIncreaseQuality() {
        let input = [Item(name: "Aged Brie", sellIn: 1, quality: 0)]
        let expectedOutput = [Item(name: "Aged Brie", sellIn: 0, quality: 1)]
        let actualOutput = GildedRose.updateQuality(items: input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    // The Quality of an item is never more than 50
    func testQualityNeverMoreThanFifty() {
        let input = [Item(name: "Aged Brie", sellIn: 1, quality: 50)]
        let expectedOutput = [Item(name: "Aged Brie", sellIn: 0, quality: 50)]
        let actualOutput = GildedRose.updateQuality(items: input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    // "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
    func testSulfurasNeverHasToBeSoldOrDecreaseQuality() {
        let input = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 1, quality: 10)]
        let expectedOutput = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 1, quality: 10)]
        let actualOutput = GildedRose.updateQuality(items: input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    // "Backstage passes", like aged brie, increases in Quality as it's SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
    func testBackStagePassesIncreaseByTwoBetweenTenToFiveDaysUntilConcert() {
        let input = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 10)]
        let expectedOutput = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 9, quality: 12)]
        let actualOutput = GildedRose.updateQuality(items: input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testBackStagePassesIncreaseByTwoBetweenFiveToCeroDaysUntilConcert() {
        let input = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 3, quality: 10)]
        let expectedOutput = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 2, quality: 13)]
        let actualOutput = GildedRose.updateQuality(items: input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testBackStagePassesDropToCeroWhenConcertPass() {
        let input = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 10)]
        let expectedOutput = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: -1, quality: 0)]
        let actualOutput = GildedRose.updateQuality(items: input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
}
















