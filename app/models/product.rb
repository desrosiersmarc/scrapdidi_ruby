class Product < ApplicationRecord
  belongs_to :subfamily
  belongs_to :supplier
  belongs_to :brand
end
