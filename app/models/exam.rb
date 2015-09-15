class Exam < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :results, dependent: :destroy
  has_many :questions, through: :results

  enum state: [:start, :testing, :unchecked, :checked]

  scope :start_or_testing, ->user_id{where(state: [0, 1], user_id: user_id)}

  before_create :create_questions

  accepts_nested_attributes_for :results

  validate :has_one_exam_test, on: :create

  private
  def create_questions
    self.questions = self.category.questions.actived.order("RANDOM()")
      .limit self.category.number_question
  end

  def has_one_exam_test
    errors.add(:base, I18n.t("you_need_complete_exam")) if
      Exam.start_or_testing(self.user_id).count > 0
  end
end
