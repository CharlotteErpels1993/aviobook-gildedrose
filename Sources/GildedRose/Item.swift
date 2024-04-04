public class Item {
    public var name: String
    public var sellIn: Int
    public var quality: Int

    public init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
}

extension Item: CustomStringConvertible {
    public var description: String {
        name + ", " + String(sellIn) + ", " + String(quality)
    }
}

private extension Item {

    var areBackstagePasses: Bool { name == "Backstage passes to a TAFKAL80ETC concert" }
    var canQualityChange: Bool { quality > 0 && quality < 50 && !isSulfuras }
    var isAgedBrie: Bool { name == "Aged Brie" }
    var isConjured: Bool { name == "Conjured Mana Cake" }
    var isExpired: Bool { sellIn < 0 }
    var isSulfuras: Bool { name == "Sulfuras, Hand of Ragnaros" }
    var qualityIncreasesInTime: Bool { isAgedBrie || areBackstagePasses }
    
    func calculateQualityModifier() -> Int {
        var modifier = 0

        if qualityIncreasesInTime {
            modifier += 1
            
            if areBackstagePasses {
                modifier += calculateBackstagePassesQualityModifier()
            }
        } else {
            modifier -= 1
        }
        
        if isExpired {
            modifier *= 2
        }
        
        if isConjured {
            modifier *= 2
        }
        
        return modifier
    }
    
    func calculateBackstagePassesQualityModifier() -> Int {
        guard sellIn < 10 else { return 0 }
        return sellIn < 5 ? 2 : 1
    }
    
    func lowerSellInIfPossible() {
        guard !isSulfuras else { return }
        sellIn -= 1
    }
}

extension Item {
    
    func updateQuality() {
        lowerSellInIfPossible()
        
        guard canQualityChange else { return }
        
        if areBackstagePasses && isExpired {
            quality = 0
            return
        }
        
        let qualityModifier = calculateQualityModifier()
        quality += qualityModifier
    }
}
