class Article < ApplicationRecord

  include Visible
  
    belongs_to :category
    has_one_attached :image

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    has_many :comments, dependent: :destroy
    validates :category_id, presence: true

    after_initialize :set_default_views_count, if: :new_record?

    
    def set_default_views_count
      self.views_count ||= 0
    end

end