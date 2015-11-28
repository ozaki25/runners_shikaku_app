class Seeds
  class << self
    def excute
      create_categories
    end

    def create_categories
      %w(Security Cloud Mobility Strage CDIA).each do |name|
        category = Category.create!(name: name)
        create_exams(category)
      end
    end

    def create_exams(category)
      (1..2).each do |exam_no|
        exam = category.exams.create!(time_of_category: category.id)
        create_questions(exam, "/images/categories/#{category.id}/exams/#{exam_no}")
      end
    end

    def create_questions(exam, base_path)
      (1..100).each do |question_no|
        question = exam.questions.create!(
          num_of_exam: question_no,
          question_path: "#{base_path}/questions/#{question_no}.png",
          choice_path: "#{base_path}/choices/#{question_no}.png",
          description_path: "#{base_path}/descriptions/#{question_no}.png",
        )
      end
    end

  end
end

Seeds.excute
