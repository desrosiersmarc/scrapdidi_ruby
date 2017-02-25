class Product < ApplicationRecord
  # belongs_to :subfamily
  belongs_to :supplier
  belongs_to :brand
  belongs_to :category

  validates :name, :sku, presence: true
  validates :state, presence: true
  validates :supplier_id, presence: true
  validates :brand_id, presence: true
  validates :price, presence: true
  validates :weight, presence: true
  validates :stock, presence: true
  validates :description, presence: true
  validates :home, presence: true, inclusion: {in: %w(yes no),
            message: "%{value} n'est pas valide"}
  validates :category_id, presence: true

  has_attachments :photos, maximum: 4
end


