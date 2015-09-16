class Category < ActiveRecord::Base
  max_paginates_per 50

  has_many :questions, dependent: :destroy
  has_many :exams, dependent: :destroy

  validates :name, presence: true, length: {maximum: 50},
    uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: {maximum: 255}
  validates :time_limit, presence: true, numericality:{only_integer: true, greater_than: 0}
  validates :number_question, presence: true, numericality:{only_integer: true, greater_than: 0}
end
