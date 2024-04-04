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
    
    var isAgedBrie: Bool { name == "Aged Brie" }
    
    func updateQuality() {
        if !isAgedBrie && name != "Backstage passes to a TAFKAL80ETC concert" {
            if quality > 0 {
                if name != "Sulfuras, Hand of Ragnaros" {
                    quality = quality - 1
                }
            }
        } else {
            if quality < 50 {
                quality = quality + 1

                if name == "Backstage passes to a TAFKAL80ETC concert" {
                    if sellIn < 11 {
                        if quality < 50 {
                            quality = quality + 1
                        }
                    }

                    if sellIn < 6 {
                        if quality < 50 {
                            quality = quality + 1
                        }
                    }
                }
            }
        }

        if name != "Sulfuras, Hand of Ragnaros" {
            sellIn = sellIn - 1
        }

        if sellIn < 0 {
            if !isAgedBrie {
                if name != "Backstage passes to a TAFKAL80ETC concert" {
                    if quality > 0 {
                        if name != "Sulfuras, Hand of Ragnaros" {
                            quality = quality - 1
                        }
                    }
                } else {
                    quality = quality - quality
                }
            } else {
                if quality < 50 {
                    quality = quality + 1
                }
            }
        }
    }
}
