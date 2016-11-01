feature 'Creating spaces' do

  scenario 'I can create a new space' do
    visit '/spaces/new'
    fill_in 'name',   with: 'Valley View'
    fill_in 'location', with: 'Sheffield'
    fill_in 'price', with: '100'
    click_button 'Create space'

    expect(current_path).to eq '/spaces'

    within 'ul#spaces' do
      expect(page).to have_content('Valley View')
      expect(page).to have_content('Sheffield')
      expect(page).to have_content('100')
    end
  end
end
