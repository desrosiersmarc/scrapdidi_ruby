class Product < ApplicationRecord
  belongs_to :supplier
  belongs_to :brand
  belongs_to :category
  has_many :order_items

  validates :name, :sku, presence: true
  validates :state, presence: true
  validates :supplier_id, presence: true
  validates :brand_id, presence: true
  validates :price,
            presence: true, numericality: { only_integer: true,
            message: 'Le prix doit être en centimes 190 pour 1,90€'}
  validates :weight,
            presence: true, numericality: { only_integer: true,
            message: 'Le poids doit être en grammes'}
  validates :stock,
            presence: true, numericality: { only_integer: true,
            message: 'Le stock doit être un entier'}
  validates :description, presence: true
  validates :home, presence: true
  validates :category_id, presence: true

  has_attachments :photos, maximum: 4

  default_scope { where(active: true)}
end


