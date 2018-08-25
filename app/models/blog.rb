class Blog < ApplicationRecord
  default_scope { order(id: :desc) }
  has_many :comments, dependent: :destroy
end