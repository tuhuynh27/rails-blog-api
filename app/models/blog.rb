class Blog < ApplicationRecord
  has_many :comments, dependent: :destroy
end