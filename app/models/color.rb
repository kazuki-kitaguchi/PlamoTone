class Color < ApplicationRecord
    has_one :maker, dependent: :destroy
    has_one :kind, dependent: :destroy
    validates :name,length:{maximum:255}
    validates :code,length:{is:6},format:{with:/\A[0-9a-fA-F]+\z/}
end
