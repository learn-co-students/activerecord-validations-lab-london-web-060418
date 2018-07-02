class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait

      def clickbait
        if self.title
          clickbait_arr = ["Won't Believe", "Secret", "Top[number]", "Guess"]
          if !clickbait_arr.any? { |subs| self.title.include? subs }
            errors.add(:title, "Not clickbaity enough")
            return false
          end
        else
          false
        end
      end




end
