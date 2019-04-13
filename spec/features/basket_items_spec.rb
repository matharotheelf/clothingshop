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

    scenario 'Adding item to basket decreases stock by 1' do
      visit '/'
      click_button 'Almond Toe Court Shoes, Patent Black'
      expect(page).to have_content(
        'Almond Toe Court Shoes, Patent Black | Women’s Footwear | £99.0 | 4'
      )
    end

    scenario 'Deleting item from basket increases stock by 1' do
      visit '/'
      click_button 'Almond Toe Court Shoes, Patent Black'
      click_button 'Delete 1'
      expect(page).to have_content(
        'Almond Toe Court Shoes, Patent Black | Women’s Footwear | £99.0 | 5'
      )
    end
  end

  describe 'Deleting item from basket removes all vouchers' do
    scenario '10 pound voucher removed when item deleted from basket' do
      visit '/'
      click_button 'Almond Toe Court Shoes, Patent Black'
      click_button 'Flip Flops, Red'
      click_button '£10.00 off when you spend over £50.00'
      click_button 'Delete 1'
      expect(page).to have_content(
        'Vouchers removed when item deleted from basket.'
      )
      expect(page).to have_content('Reduced Price: £19.0')
    end

    scenario '15 pound voucher removed when item deleted from basket' do
      visit '/'
      click_button 'Almond Toe Court Shoes, Patent Black'
      click_button 'Flip Flops, Red'
      click_button '£15.00 off when you have bought at least one footwear item and spent over £75.00'
      click_button 'Delete 1'
      expect(page).to have_content(
        'Vouchers removed when item deleted from basket.'
      )
      expect(page).to have_content('Reduced Price: £19.0')
    end
  end
end
