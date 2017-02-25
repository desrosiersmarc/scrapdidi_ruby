class Product < ApplicationRecord
  # belongs_to :subfamily
  belongs_to :supplier
  belongs_to :brand
  belongs_to :category

  has_attachments :photos, maximum: 4
end
