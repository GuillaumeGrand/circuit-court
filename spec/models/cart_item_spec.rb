RSpec.describe CartItem, :type => :model do

  it 'should be able to create a post' do
    @cart_item = CartItem.new(quantity: 1, product_id: 1, user_id: 1).save
    expect(@cart_item).to eq(true)
  end
end
