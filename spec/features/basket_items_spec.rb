RSpec.feature 'Basket', type: :feature do
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
end
