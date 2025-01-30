class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  before_save :set_prices

  validates :quantity, numericality: { greater_than: 0 }

  private

  def set_prices
    self.unit_price = product.price
    self.total_price = unit_price * quantity
  end
end
