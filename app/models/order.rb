class Order < ApplicationRecord
  after_create :reduce_product_quantities
  
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  private

  def reduce_product_quantities
    puts "self line items: ", self.line_items.inspect
    puts "is_empty?", self.line_items.empty?
    if self.line_items.empty?
      return
    end

    self.line_items each do |item|
      product = item.product
      product.quantity -= item.quantity
      product.save!
    end

  end

end
