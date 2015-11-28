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
        create_questions(exam, "categories/#{category.id}/exams/#{exam_no}")
      end
    end

    def create_questions(exam, base_path)
      (1..100).each do |question_no|
        question = exam.questions.create!(
          num_of_exam: question_no,
          question_path: "/images/questions/#{base_path}/questions/#{question_no}/question/#{question_no}.png",
          description_path: "/images/descriptions/#{base_path}/questions/#{question_no}.png",
        )
        create_choices(question, "/images/questions/#{base_path}/questions/#{question_no}/choices")
      end
    end

    def create_choices(question, choice_path)
      (1..4).each do |choice_no|
        question.choices.create!(choice_path: "#{choice_path}/#{choice_no}.png", collect: false)
      end
    end
  end
end

Seeds.excute
