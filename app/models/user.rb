class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :rememberable, :validatable

  has_many :questions, dependent: :destroy
  has_many :exams, dependent: :destroy

  enum role: [:user, :admin]
end
