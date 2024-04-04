@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    func testFoo() throws {
        let items = [Item(name: "foo", sellIn: 0, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].name, "foo")
    }
    
    func testUpdateQuality_WhenUpdatingQuality_ThenSellInOfItemsIsLowered() {
        let items = [
            Item(name: "Item 1", sellIn: 7, quality: 5),
            Item(name: "Item 2", sellIn: 4, quality: 7)
        ]
        
        let app = GildedRose(items: items)
        app.updateQuality()
        
        XCTAssertEqual(items.map({ $0.sellIn }), [6, 3])
    }
    
    func testUpdateQuality_WhenUpdatingQuality_ThenQualityOfItemsIsLowered() {
        let items = [
            Item(name: "Item 1", sellIn: 7, quality: 5),
            Item(name: "Item 2", sellIn: 4, quality: 7)
        ]
        
        let app = GildedRose(items: items)
        app.updateQuality()
        
        XCTAssertEqual(items.map({ $0.quality }), [4, 6])
    }
    
    func testUpdateQuality_WhenSellInOfItemIsZero_AndUpdatingQuality_ThenQualityOfItemIsLoweredTwice() {
        let item = Item(name: "Item", sellIn: 0, quality: 5)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.quality, 3)
    }
    
    func testUpdateQuality_WhenSellInOfItemIsNegative_AndUpdatingQuality_ThenQualityOfItemIsLoweredTwice() {
        let item = Item(name: "Item", sellIn: -1, quality: 5)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.quality, 3)
    }
    
    func testUpdateQuality_WhenQualityOfItemIsZero_AndUpdatingQuality_ThenQualityOfItemStaysZero() {
        let item = Item(name: "Item", sellIn: 5, quality: 0)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.quality, 0)
    }
    
    func testUpdateQuality_WhenItemIsAgedBrie_AndUpdatingQuality_ThenQualityOfItemIsImproved() {
        let item = Item(name: "Aged Brie", sellIn: 5, quality: 6)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.quality, 7)
    }
}
