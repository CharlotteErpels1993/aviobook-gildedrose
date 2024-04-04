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
    
    func testUpdateQuality_WhenUpdatingQuality_ThenQualityOfItemIsNotHigherThan50() {
        let item = Item(name: "Aged Brie", sellIn: 5, quality: 50)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.quality, 50)
    }
    
    func testUpdateQuality_WhenItemIsSulfuras_AndUpdatingQuality_ThenSellInOfItemDoesNotChange() {
        let item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 5, quality: 30)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, 5)
    }
    
    func testUpdateQuality_WhenItemIsSulfuras_AndUpdatingQuality_ThenQualityOfItemDoesNotChange() {
        let item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 5, quality: 30)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.quality, 30)
    }
    
    func testUpdateQuality_WhenItemIsBackstagePasses_AndItemSellInIsIn11Days_AndUpdatingQuality_ThenQualityOfItemIsIncreasedBy1() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 11, quality: 5)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.quality, 6)
    }
    
    func testUpdateQuality_WhenItemIsBackstagePasses_AndItemSellInIsIn10Days_AndUpdatingQuality_ThenQualityOfItemIsIncreasedBy2() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 5)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.quality, 7)
    }
    
    func testUpdateQuality_WhenItemIsBackstagePasses_AndItemSellInIsIn9Days_AndUpdatingQuality_ThenQualityOfItemIsIncreasedBy2() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 9, quality: 5)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.quality, 7)
    }
    
    func testUpdateQuality_WhenItemIsBackstagePasses_AndItemSellInIsIn6Days_AndUpdatingQuality_ThenQualityOfItemIsIncreasedBy2() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 6, quality: 5)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.quality, 7)
    }
    
    func testUpdateQuality_WhenItemIsBackstagePasses_AndItemSellInIsIn5Days_AndUpdatingQuality_ThenQualityOfItemIsIncreasedBy3() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 5)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.quality, 8)
    }
    
    func testUpdateQuality_WhenItemIsBackstagePasses_AndItemSellInIsIn4Days_AndUpdatingQuality_ThenQualityOfItemIsIncreasedBy3() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 4, quality: 5)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.quality, 8)
    }
    
    func testUpdateQuality_WhenItemIsBackstagePasses_AndItemSellInIsNow_AndUpdatingQuality_ThenQualityOfItemIs0() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 5)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.quality, 0)
    }
    
    func testUpdateQuality_WhenItemIsConjured_AndSellInIsPositive_AndUpdatingQualityIsLoweredBy2() {
        let item = Item(name: "Conjured Mana Cake", sellIn: 5, quality: 9)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.quality, 7)
    }
    
    func testUpdateQuality_WhenItemIsConjured_AndSellInIsZero_AndUpdatingQualityIsLoweredBy4() {
        let item = Item(name: "Conjured Mana Cake", sellIn: 0, quality: 9)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.quality, 5)
    }
}
