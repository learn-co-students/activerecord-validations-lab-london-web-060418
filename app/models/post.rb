class ClickBaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.include?("Won't Believe") || value.include?("Top") || value.include?("Guess") || value.include?("Secret")
      record.errors[attribute] = "Not enough click-bait"
    end unless value == nil
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true, click_bait: true
  validates :summary, length: { maximum: 250 }
  validates :content, length: { minimum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
end
