# frozen_string_literal: true

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      # item name is not brie nor is it a backstage pass to , nor is it Sulfuras,
      # the qiality is decreased by -1 as long as its quality is more than zero
      if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
          decrease_quality
      else
        # if it is the Brie, backstage pass pr Sulurass, and the quality is less than < 50
        # item quality increases by +1
        increase_quality
        if item.name == 'Backstage passes to a TAFKAL80ETC concert'
          increase_quality if item.sell_in < 11
          increase_quality if item.sell_in < 6
        end

      end
      update_age
      if item.sell_in.negative?
        if item.name != 'Aged Brie'
          if item.name != 'Backstage passes to a TAFKAL80ETC concert'
            if item.quality.positive?
              decrease_quality
            end
          else
            erase_quality
          end
        else
          increase_quality
        end
      end
    end
  end

  def update_age
    @items.each do |item|
      item.sell_in -= 1 if item.name != 'Sulfuras, Hand of Ragnaros'
    end
  end

  def increase_quality
    # the quality will only be increasing if the quality is under 50
    @items.each do |item|
      item.quality += 1 if item.quality < 50
    end
  end

  def decrease_quality
    # the quality will only be decreasing if the quality is positive
    @items.each do |item|
      item.quality -= 1 if item.quality.positive? && item.name != 'Sulfuras, Hand of Ragnaros'
    end
  end

  def erase_quality
    @items.each do |item|
      item.quality -= item.quality
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
