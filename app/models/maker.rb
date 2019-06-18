class Maker < ApplicationRecord
    has_many :color, dependent: :destroy
end
