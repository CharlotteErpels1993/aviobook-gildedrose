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

extension Item {
    
    var areBackstagePasses: Bool { name == "Backstage passes to a TAFKAL80ETC concert" }
    var canQualityChange: Bool { quality > 0 && quality < 50 && !isSulfuras }
    var isAgedBrie: Bool { name == "Aged Brie" }
    var isSulfuras: Bool { name == "Sulfuras, Hand of Ragnaros" }
    var qualityIncreasesInTime: Bool { isAgedBrie || areBackstagePasses }
    
    func updateQuality() {
        if canQualityChange {
            if qualityIncreasesInTime {
                quality += 1
                
                if areBackstagePasses {
                    if sellIn < 11 {
                        quality += 1
                    }

                    if sellIn < 6 {
                        quality += 1
                    }
                }
            } else {
                quality -= 1
            }
        }

        if !isSulfuras {
            sellIn -= 1
        }

        if sellIn < 0 {
            if !isAgedBrie {
                if !areBackstagePasses && canQualityChange {
                    quality -= 1
                } else {
                    quality = 0
                }
            } else if canQualityChange {
                quality += 1
            }
        }
    }
}
