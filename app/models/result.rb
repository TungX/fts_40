class Result < ActiveRecord::Base
  belongs_to :examp
  belongs_to :question
  belongs_to :option
end
