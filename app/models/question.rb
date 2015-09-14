class Question < ActiveRecord::Base
  max_paginates_per 50

  enum state: [:waiting, :actived]

  belongs_to :user
  belongs_to :category
  has_many :options, dependent: :destroy
  has_many :results, dependent: :destroy

  accepts_nested_attributes_for :options, allow_destroy: true,
    reject_if: proc {|option| option[:content].blank?}

  validates :content, presence: true, length: {maximum: 255}

  validate :must_has_one_correct_option

  private
  def must_has_one_correct_option
    errors.add(:base, I18n.t("must_be_option_correct")) unless
      self.options.select{|option| option.correct}.size == 1
  end
end
