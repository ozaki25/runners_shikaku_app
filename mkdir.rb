puts 'toge'

(1..100).each do |i|
  (1..5).each do |j|
    (1..2).each do |k|
      `mkdir ~/Applications/rails_apps/runners_shikaku/public/images/questions/categories/#{j}/exams/#{k}/questions/#{i}/question`
      `mkdir ~/Applications/rails_apps/runners_shikaku/public/images/questions/categories/#{j}/exams/#{k}/questions/#{i}/choices`
      puts 'togetoge'
    end
  end
end
