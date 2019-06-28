class Maker < ApplicationRecord
    has_many :colors, primary_key: "id", foreign_key: "maker_id", dependent: :destroy
    validates :maker_name, presence: true
end
