class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbaity

  def clickbaity
    if self.title
      click_ary = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      if  !click_ary.any? { |phrase| self.title.include?(phrase)  }
        errors.add(:title, "Sorry pal, that title isn't clickbait enough")
      end
    end
  end
end
