class Color < ApplicationRecord
    belongs_to :maker, foreign_key: "maker_id"
    has_many :likes, dependent: :destroy
    validates :color_name,length:{maximum:255}
    validates :color_code,length:{is:6},format:{with:/\A[0-9a-fA-F]+\z/}
    
    def like_user(id)
        likes.find_by(user_id: id)
    end
end
