class Product < ApplicationRecord
  belongs_to :subfamily
  belongs_to :supplier
  belongs_to :brand

  has_attachments :photos, maximum: 4
end
