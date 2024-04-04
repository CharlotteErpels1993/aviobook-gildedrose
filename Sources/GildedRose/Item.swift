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
    var isExpired: Bool { sellIn < 0 }
    var isSulfuras: Bool { name == "Sulfuras, Hand of Ragnaros" }
    var qualityIncreasesInTime: Bool { isAgedBrie || areBackstagePasses }
    
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
        
        if qualityIncreasesInTime {
            quality += 1
            
            if areBackstagePasses {
                if sellIn < 10 {
                    quality += 1
                }

                if sellIn < 5 {
                    quality += 1
                }
            }
        } else {
            quality -= 1
        }

        if isExpired {
            if !isAgedBrie {
                if !areBackstagePasses {
                    quality -= 1
                }
            } else {
                quality += 1
            }
        }
    }
}
