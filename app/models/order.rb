class Order < ApplicationRecord
  after_create :reduce_product_quantities
  
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  private

  def reduce_product_quantities
    
    if self.line_items.empty?
      return
    end

    self.line_items.each do |item|
      product = item.product
      puts "product", product.inspect
      product.quantity -= item.quantity
      product.save!
    end

  end

end
