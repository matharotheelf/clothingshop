class ShopItemsController < ApplicationController
  def index
    if ShopItem.first.nil?
      ShopItem.create(product_name: 'Almond Toe Court Shoes, Patent Black',
                      category: 'Women’s Footwear',
                      price: 99,
                      quantity_in_stock: 5)
      ShopItem.create(product_name: 'Suede Shoes, Blue',
                      category: 'Women’s Footwear',
                      price: 42,
                      quantity_in_stock: 4)
      ShopItem.create(product_name: 'Leather Driver Saddle Loafers, Tan',
                      category: 'Men’s Footwear',
                      price: 34,
                      quantity_in_stock: 12)
      ShopItem.create(product_name: 'Flip Flops, Red',
                      category: 'Men’s Footwear',
                      price: 19,
                      quantity_in_stock: 6)
      ShopItem.create(product_name: 'Flip Flops, Blue',
                      category: 'Men’s Footwear',
                      price: 19,
                      quantity_in_stock: 0)
      ShopItem.create(product_name: 'Gold Button Cardigan, Black',
                      category: 'Women’s Casualwear',
                      price: 167,
                      quantity_in_stock: 6)
      ShopItem.create(product_name: 'Cotton Shorts, Medium Red',
                      category: 'Women’s Casualwear',
                      price: 30,
                      quantity_in_stock: 5)
      ShopItem.create(product_name: 'Fine Stripe Short Sleeve Shirt, Grey',
                      category: 'Men’s Casualwear',
                      price: 49.99,
                      quantity_in_stock: 9)
      ShopItem.create(product_name: 'Fine Stripe Short Sleeve Shirt, Green',
                      category: 'Men’s Casualwear',
                      price: 39.99,
                      quantity_in_stock: 3)
      ShopItem.create(product_name: 'Sharkskin Waistcoat, Charcoal',
                      category: 'Men’s Formalwear',
                      price: 75,
                      quantity_in_stock: 2)
      ShopItem.create(product_name: 'Lightweight Patch Pocket Blazer, Deer',
                      category: 'Men’s Formalwear',
                      price: 175.5,
                      quantity_in_stock: 1)
      ShopItem.create(product_name: 'Bird Print Dress, Black',
                      category: 'Women’s Formalwear',
                      price: 270,
                      quantity_in_stock: 10)
      ShopItem.create(product_name: 'Mid Twist Cut­Out Dress, Pink',
                      category: 'Women’s Formalwear',
                      price: 540,
                      quantity_in_stock: 5)
    end
    @shop_items = ShopItem.all
    @basket_items = BasketItem.all
  end
end
