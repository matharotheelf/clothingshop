RSpec.feature 'Vouchers', type: :feature do
  describe 'Voucher system works' do
    scenario 'User can see vouchers' do
      visit '/'
      expect(page).to have_content('Vouchers')
      expect(page).to have_content('£5 pound off')
      expect(page).to have_content('£10.00 off when you spend over £50.00')
      expect(page).to have_content('£15.00 off when you have bought at least one footwear item and spent over £75.00')
    end

    scenario 'User can add £5 pound off voucher and see reduced price' do
      visit '/'
      click_button 'Almond Toe Court Shoes, Patent Black'
      click_button '£5 pound off'
      expect(page).to have_content('Reduced Price: £94.0')
    end

    scenario 'User can add £10 pound off voucher and see reduced price' do
      visit '/'
      click_button 'Almond Toe Court Shoes, Patent Black'
      click_button '£10.00 off when you spend over £50.00'
      expect(page).to have_content('Reduced Price: £89.0')
    end

    scenario 'User can add £15 pound off voucher and see reduced price' do
      visit '/'
      click_button 'Almond Toe Court Shoes, Patent Black'
      click_button '£15.00 off when you have bought at least one footwear item and spent over £75.00'
      expect(page).to have_content('Reduced Price: £84.0')
    end
  end
end
