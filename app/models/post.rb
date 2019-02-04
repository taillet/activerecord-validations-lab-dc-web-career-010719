class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :summary, length: {maximum: 250}
    validates :content, length: {minimum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :click_bait

    def click_bait
      if self.title && !self.title.match(/Won't Believe|Secret|Top \d|Guess/)
          errors.add(:title, "Not click-baity enough.")
        end
    end

end
