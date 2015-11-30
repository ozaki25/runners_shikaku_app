class Seeds
  class << self
    def excute
      create_categories
      add_answer
    end

    def create_categories
      %w(Security Cloud Mobility Strage CDIA).each do |name|
        category = Category.create!(name: name)
        create_exams(category)
      end
    end

    def create_exams(category)
      (1..2).each do |exam_no|
        exam = category.exams.create!(time_of_category: exam_no)
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

    def answer_security
      {
        '1': {
               '1': 'a',  '2': 'd', '3': 'a,b', '4': 'c', '5': 'd', '6': 'd', '7': 'c', '8': 'c', '9': 'd', '10': 'a',
              '11': 'b', '12': 'b', '13': 'b', '14': 'c', '15': 'c', '16': 'a', '17': 'a', '18': 'a', '19': 'd', '20': 'c',
              '21': 'd', '22': 'd', '23': 'd', '24': 'a', '25': 'b', '26': 'a', '27': 'b', '28': 'b', '29': 'c', '30': 'c',
              '31': 'd', '32': 'a', '33': 'b', '34': 'a', '35': 'd', '36': 'd', '37': 'b', '38': 'c', '39': 'c', '40': 'd',
              '41': 'b', '42': 'c', '43': 'a', '44': 'a', '45': 'd', '46': 'c', '47': 'd', '48': 'd', '49': 'b', '50': 'd',
              '51': 'c', '52': 'c', '53': 'a', '54': 'a', '55': 'a', '56': 'a', '57': 'd', '58': 'd', '59': 'd', '60': 'b',
              '61': 'a', '62': 'a', '63': 'b', '64': 'a', '65': 'a', '66': 'd', '67': 'a', '68': 'c', '69': 'a', '70': 'a,b',
              '71': 'b', '72': 'b', '73': 'c', '74': 'a', '75': 'c', '76': 'a', '77': 'b', '78': 'c', '79': 'a', '80': 'c',
              '81': 'a,c', '82': 'b', '83': 'c', '84': 'd', '85': 'd', '86': 'd', '87': 'a', '88': 'b', '89': 'b', '90': 'd'
             },
       '2': {
              '1': 'b', '2': 'a', '3': 'a', '4': 'b', '5': 'd', '6': 'c', '7': 'c', '8': 'd', '9': 'c', '10': 'b',
             '11': 'a', '12': 'b', '13': 'a', '14': 'c', '15': 'c', '16': 'b', '17': 'a', '18': 'b', '19': 'c', '20': 'c',
             '21': 'a', '22': 'a', '23': 'd', '24': 'b', '25': 'a', '26': 'c', '27': 'b', '28': 'a', '29': 'c', '30': 'd',
             '31': 'b', '32': 'd', '33': 'b', '34': 'b', '35': 'a', '36': 'b', '37': 'c', '38': 'b', '39': 'c,e', '40': 'd',
             '41': 'a', '42': 'b', '43': 'a', '44': 'd', '45': 'b,c', '46': 'c', '47': 'd', '48': 'b', '49': 'd', '50': 'b',
             '51': 'b', '52': 'a', '53': 'b', '54': 'c', '55': 'd', '56': 'a', '57': 'd', '58': 'd', '59': 'a', '60': 'a',
             '61': 'd', '62': 'd', '63': 'a', '64': 'a,b', '65': 'c', '66': 'd', '67': 'b', '68': 'b', '69': 'b,d', '70': 'd',
             '71': 'd', '72': 'a', '73': 'b', '74': 'a', '75': 'd', '76': 'b,d', '77': 'a', '78': 'a,b', '79': 'b', '80': 'd',
             '81': 'c', '82': 'c', '83': 'd', '84': 'c', '85': 'c', '86': 'd', '87': 'c', '88': 'a', '89': 'c', '90': 'd'
            }
      }
    end

    def add_answer
      answer_security.each do |exam_no, answers|
        questions = Category.find_by(name: 'Security').exams[exam_no.to_s.to_i - 1].questions
        answers.each do |question_no, answer|
          questions[question_no.to_s.to_i + 1].update!(collect_no: answer.to_s)
        end
      end
    end
  end
end

Seeds.excute
