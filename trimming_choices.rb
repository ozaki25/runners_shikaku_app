require 'rubygems'
require 'mini_magick'

class Trimming
  class << self
    @@base_path = ""

    def excute(path)
      set_base_path(path)
      security
      #cloud
      #mobility
      #strage
      #cdia
    end

    def set_base_path(path)
      @@base_path = path
      puts "base_path : #{@@base_path}"
    end

    # 個別対応: { 1: (6,31,40,63,72,80), 2: (15,37,39,67,89) }
    def security
      (1..2).each do |count|
        i = 1
        Dir.glob(input_path("Security", count)) do |input|
          size = if count == 1
                   '755x165+20+245'
                 elsif count == 2
                   if i < 15
                     '755x165+20+260'
                   elsif i >= 15 && i < 37
                     '755x165+25+240'
                   else #i >= 37
                     '755x165+25+225'
                   end
                 end
          output = output_path(1, count, i)
          trimming(input, output, size)
          i = i + 1
        end
      end
    end

    def cloud
      (1..2).each do |count|
        i = 1
        Dir.glob(input_path("Cloud", count)) do |input|
          output = output_path(2, count, i)
          size = '755x75+15+120'
          trimming(input, output, size)
          i = i + 1
        end
      end
    end

    def mobility
      category = 
      (1..2).each do |count|
        Dir.glob(input_path("Mobility", count)) do |input|
          output = output_path(3, count, i)
          size = '755x75+15+120'
          trimming(input, output, size)
          i = i + 1
        end
      end
    end

    # 完成
    def strage
      (1..2).each do |count|
        i = 1
        Dir.glob(input_path("Strage", count)) do |input|
          output = output_path(4, count, i)
          size = '755x75+15+120'
          trimming(input, output, size)
          i = i + 1
        end
      end
    end

    def cdia
      (1..2).each do |count|
        i = 1
        Dir.glob(input_path("CDIA", count)) do |input|
          output = output_path(5, count, i)
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

    def output_path(category_id, exam_no, i)
      #"#{@@base_path}/trimming/#{category_id}/#{exam_no}/選択肢/#{i}.png"
      "/Users/ozaki/Applications/rails_apps/runners_shikaku/public/images/categories/#{category_id}/exams/#{exam_no}/choices/#{i}.png"
    end
  end
end

Trimming.excute(ARGV[0]) if $0 == __FILE__
