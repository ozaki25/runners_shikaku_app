require 'rubygems'
require 'mini_magick'

# Security : 3行以上も多数画面のずれも多数
# Strage   : 1行と2行のみ

class Trimming
  class << self
    @@base_path = ""

    def excute(path)
      set_base_path(path)
      security
      #strage
      #mobility
      #cloud
      #cdia
    end

    def set_base_path(path)
      @@base_path = path
      puts "base_path : #{@@base_path}"
    end

    # 1と2でずれてる
    # 1完成(3行以上は未対応)
    # 2完成(3行以上は未対応)
    def security
      category = "Security"
      (1..2).each do |count|
        i = 1
        Dir.glob(input_path(category, count)) do |input|
          size = if count == 1
                   '755x70+20+145'
                 elsif count == 2
                   if i < 15
                     '755x70+20+160'
                   elsif i >= 15 && i < 37
                     '755x70+20+140'
                   else #i >= 37
                     '755x70+25+125'
                   end
                 end
          output = output_path(category, count, i)
          trimming(input, output, size)
          i = i + 1
        end
      end
    end

    # 完成
    def strage
      category = "Strage"
      (1..2).each do |count|
        i = 1
        Dir.glob(input_path(category, count)) do |input|
          output = output_path(category, count, i)
          size = '755x75+15+120'
          trimming(input, output, size)
          i = i + 1
        end
      end
    end

    def mobility
      category = "Mobility"
      (1..2).each do |count|
        i = 1
        Dir.glob(input_path(category, count)) do |input|
          output = output_path(category, count, i)
          size = '755x75+15+120'
          trimming(input, output, size)
          i = i + 1
        end
      end
    end

    def cloud
      category = "Cloud"
      (1..2).each do |count|
        i = 1
        Dir.glob(input_path(category, count)) do |input|
          output = output_path(category, count, i)
          size = '755x75+15+120'
          trimming(input, output, size)
          i = i + 1
        end
      end
    end

    def cdia
      category = "CDIA"
      (1..2).each do |count|
        i = 1
        Dir.glob(input_path(category, count)) do |input|
          output = output_path(category, count, i)
          size = '755x75+15+120'
          trimming(input, output, size)
          i = i + 1
        end
      end
    end

    def trimming(input, output, size)
      image = MiniMagick::Image.open(input);
      image.crop(size)
      puts output
      image.write(output)
    end

    def input_path(category, count)
      "#{@@base_path}/模試/#{category}/#{count}/問題/*.png"
    end

    def output_path(category, count, i)
      "#{@@base_path}/trimming/#{category}/#{count}/問題/#{i}.png"
    end
  end
end

Trimming.excute(ARGV[0]) if $0 == __FILE__
