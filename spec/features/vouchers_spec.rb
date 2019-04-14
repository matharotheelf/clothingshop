RSpec.feature 'Vouchers', type: :feature do
  describe 'Voucher system works' do
    scenario 'User can see vouchers' do
      visit '/'
      expect(page).to have_content('Vouchers')
      expect(page).to have_content('Do not apply vouchers until you know your basket is correct. Deleting an item removes all vouchers!')
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

    scenario 'Reduced Price is never less than zero' do
      visit '/'
      click_button '£5 pound off'
      expect(page).to have_content('Reduced Price: £0')
    end

    scenario 'Can not incorrectly apply 10 pound off voucher' do
      visit '/'
      click_button 'Suede Shoes, Blue'
      click_button '£10.00 off when you spend over £50.00'
      expect(page).to have_content('You can not currently use that voucher.')
      expect(page).to have_content('Reduced Price: £42')
    end

    scenario 'Can not apply 15 pound off voucher if under 75 pound spent' do
      visit '/'
      click_button 'Fine Stripe Short Sleeve Shirt, Green'
      click_button '£15.00 off when you have bought at least one footwear item and spent over £75.00'
      expect(page).to have_content('You can not currently use that voucher.')
      expect(page).to have_content('Reduced Price: £39.99')
    end

    scenario 'Can not apply 15 pound off voucher if under no shoes bought' do
      visit '/'
      click_button 'Bird Print Dress, Black'
      click_button '£15.00 off when you have bought at least one footwear item and spent over £75.00'
      expect(page).to have_content('You can not currently use that voucher.')
      expect(page).to have_content('Reduced Price: £270')
    end
  end
end
