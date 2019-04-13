RSpec.feature 'BasketItems', type: :feature do
  describe 'User can add and remove to and from basket' do
    scenario 'User can add items to basket' do
      visit '/'
      click_button 'Almond Toe Court Shoes, Patent Black'
      expect(page).to have_content(
        'Almond Toe Court Shoes, Patent Black', count: 2
      )
    end
    scenario 'User can delete items from basket' do
      visit '/'
      click_button 'Almond Toe Court Shoes, Patent Black'
      click_button 'Delete 1'
      expect(page).to have_content(
        'Almond Toe Court Shoes, Patent Black', count: 1
      )
    end
  end

  describe 'User can can see price of all basket items' do
    scenario 'User can see price of all basket items' do
      visit '/'
      click_button 'Almond Toe Court Shoes, Patent Black'
      click_button 'Suede Shoes, Blue'
      expect(page).to have_content(
        'Total Price: 141.0'
      )
    end
  end

  describe 'Number of item in basket can not exceed number in stock' do
    scenario 'Out of stock items can not be placed in basket' do
      visit '/'
      click_button 'Flip Flops, Blue'
      expect(page).to have_content(
        'Flip Flops, Blue', count: 1
      )
      expect(page).to have_content('Item out of stock.')
    end
  end
end
