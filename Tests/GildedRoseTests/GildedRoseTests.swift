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
}
