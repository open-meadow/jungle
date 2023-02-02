require 'rails_helper'

# RSpec.describe Order, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

# cat1.products.create!({
#   name:  'Giant Tea',
#   description: "The Giant Tea is an uncommon, medium-sized plant and can be found only in some tundras. It blooms twice a year, for 3 weeks.
#   It has narrow, paired leaves, which are usually yellow-green. It also grows large flowers, which can be blue, bronze, light yellow, purple and light grey.
  
#   These plants grow in decent numbers, but it's near impossible to control and maintain their growth.
#   They can be used as an anesthetic.
  
#   As a defense mechanism the Giant Tea grow slippery leaves to prevent insects from easily eaten them.
#   They rely on animal pollination to reproduce. To promote pollination, they produce aromatic scents.",
#   image: open_asset('plante_1.jpg'),
#   quantity: 0,
#   price: 64.99
# })

# cat1.products.create!({
#   name:  'Scented Blade',
#   description: "
#   The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.
# It has thin, palmate leaves, which are usually lime green. It also grows small flowers, which can be dark blue, light gold and dark red.

# These plants grow in large groups, but it's fairly easy to control and maintain their growth.
# They can be eaten to relief a sore throat.

# As a defense mechanism the Scented Blade can collapse its flowers when it detects vibrations.
# They rely on animal pollination to reproduce. Once pollinated, they grow fairly large, delicious nuts.",
#   image: open_asset('plante_2.jpg'),
#   quantity: 18,
#   price: 24.99
# })

RSpec.describe Order, type: :model do
  describe 'After creation' do

    before :each do
      # Setup at least two products with different quantities, names, etc
      @category = Category.create!(name: 'Evergreens')

      @product1 = Product.create!(
        name:  'Giant Tea',

        description: "The Giant Tea is an uncommon, medium-sized plant and can be found only in some tundras. It blooms twice a year, for 3 weeks.
        It has narrow, paired leaves, which are usually yellow-green. It also grows large flowers, which can be blue, bronze, light yellow, purple and light grey.
        
        These plants grow in decent numbers, but it's near impossible to control and maintain their growth.
        They can be used as an anesthetic.
        
        As a defense mechanism the Giant Tea grow slippery leaves to prevent insects from easily eaten them.
        They rely on animal pollination to reproduce. To promote pollination, they produce aromatic scents.",

        image: open_asset('plante_1.jpg'),
        quantity: 0,
        price: 64.99,
        category: @category
      )

      @product2 = Product.create!(
        name:  'Scented Blade',
        description: "
          The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.
          It has thin, palmate leaves, which are usually lime green. It also grows small flowers, which can be dark blue, light gold and dark red.
        
          These plants grow in large groups, but it's fairly easy to control and maintain their growth.
          They can be eaten to relief a sore throat.
        
          As a defense mechanism the Scented Blade can collapse its flowers when it detects vibrations.
          They rely on animal pollination to reproduce. Once pollinated, they grow fairly large, delicious nuts.",
        
        image: open_asset('plante_2.jpg'),
        quantity: 18,
        price: 24.99,
        category: @category
      )
       # Setup at least one product that will NOT be in the order
       @product3 = Product.create!({
        name:  'Cliff Collard',
        description: "The Cliff Collard is a very rare, tiny plant and can be found in damp places. It blooms twice a year, for 1 week.
        It has wide, spear shaped leaves, which are usually lime green. It also grows quite large flowers, which can be silver, light brown and light red.
        
        These plants grow within short distances from each other, but it's fairly hard to control and maintain their growth.
        They can be brewed as tea.
        
        As a defense mechanism the Cliff Collard grows thick thorns.
        They rely on winds to carry their seeds away to reproduce. Once pollinated, they grow small, inedible fruits.",
        image: open_asset('plante_12.jpg'),
        quantity: 23,
        price: 79.99,
        category: @category
      })

      puts "product1 id:", @product1.id
    end

    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: "a@a.com",
        total_cents: 100,
        stripe_charge_id: 123,
      )

      @order.save!

      puts "order id:", @order.id
      # 2. build line items on @order
      # ...
      @order.line_items.create!(
        order_id: @order.id,
        product_id: @product2.id,
        quantity: 1,
        item_price_cents: 100,
        total_price_cents: 100
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      # ...
      expect(@product2.quantity).to eq(17)
    end

    # pending test 2
    xit 'does not deduct quantity from products that are not in the order' do
      # TODO: Implement based on hints in previous test
    end
  end
end
