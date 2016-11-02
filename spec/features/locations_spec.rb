feature 'Adding location' do

  scenario 'I can add a single location to a new space' do
    visit '/spaces/new'
    fill_in 'name',   with: 'Valley View'
    fill_in 'location', with: 'Sheffield'
    fill_in 'price', with: '100'

    click_button 'Create space'
    space = Space.first
    expect(space.location.name).to eq('Sheffield')
  end

end
