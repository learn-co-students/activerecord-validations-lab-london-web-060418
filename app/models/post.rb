class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { minimum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-fiction), message: "%{value} is not a valid category" }
  validates :clickability


  def clickability

    array = ["Won't Believe", "Secret", "Top", "Guess"]

    if self.title

      if !array.any? {|item| self.title.include?(item)}
        errors.add(:title, "You can do better!")
        return false
      end

    else
      false
    end

  end





end
