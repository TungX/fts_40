class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :options, dependent: :destroy
  has_many :results, dependent: :destroy
end
