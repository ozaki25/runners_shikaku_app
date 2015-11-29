class QuestionsController < ApplicationController
  before_action :set_question, only: %i(next show edit update destroy)
  before_action :set_exam

  def next
    next_question = @exam.questions.where(num_of_exam: @question.num_of_exam + 1).first
    render json: { question: next_question}
  end

  def index
    @questions = @exam.questions
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private
  def set_question
    @question = Question.find(params[:id] || params[:question_id])
  end

  def set_exam
    @exam = Exam.find(params[:exam_id])
  end

  def question_params
    params.require(:question).permit(:num_of_exam, :question_path, :choice_path, :description_path, :exam)
  end
end
