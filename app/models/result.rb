class Result < ActiveRecord::Base
  belongs_to :exam
  belongs_to :question
  belongs_to :option

  scope :corrects,->{where correct: true}
  default_scope -> {order(:id)}
end
