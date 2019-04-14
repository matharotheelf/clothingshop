# frozen_string_literal: true

RSpec.feature 'ShopItems', type: :feature do
  describe 'User sees Shop home page' do
    scenario 'Shop home page welcomes to shop' do
      visit '/'
      expect(page).to have_content('Welcome to our clothing shop!')
    end

    scenario 'Shop home shows shop items' do
      visit '/'
      expect(page).to have_content(
        'Product Name | Category | Price | Quantity in Stock'
      )
      expect(page).to have_content(
        'Almond Toe Court Shoes, Patent Black | Women’s Footwear | £99.0 | 5'
      )
      expect(page).to have_content(
        'Suede Shoes, Blue | Women’s Footwear | £42.0 | 4'
      )
      expect(page).to have_content(
        'Leather Driver Saddle Loafers, Tan | Men’s Footwear | £34.0 | 12'
      )
      expect(page).to have_content(
        'Flip Flops, Red | Men’s Footwear | £19.0 | 6'
      )
      expect(page).to have_content(
        'Flip Flops, Blue | Men’s Footwear | £19.0 | 0'
      )
      expect(page).to have_content(
        'Gold Button Cardigan, Black | Women’s Casualwear | £167.0 | 6'
      )
      expect(page).to have_content(
        'Cotton Shorts, Medium Red | Women’s Casualwear | £30.0 | 5'
      )
      expect(page).to have_content(
        'Fine Stripe Short Sleeve Shirt, Grey | Men’s Casualwear | £49.99 | 9'
      )
      expect(page).to have_content(
        'Fine Stripe Short Sleeve Shirt, Green | Men’s Casualwear | £39.99 | 3'
      )
      expect(page).to have_content(
        'Sharkskin Waistcoat, Charcoal | Men’s Formalwear | £75.0 | 2'
      )
      expect(page).to have_content(
        'Lightweight Patch Pocket Blazer, Deer | Men’s Formalwear | £175.5 | 1'
      )
      expect(page).to have_content(
        'Bird Print Dress, Black | Women’s Formalwear | £270.0 | 10'
      )
      expect(page).to have_content(
        'Mid Twist Cut­Out Dress, Pink | Women’s Formalwear | £540.0 | 5'
      )
    end
  end
end
