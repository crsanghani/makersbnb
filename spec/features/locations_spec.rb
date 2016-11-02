feature 'Adding location' do

  scenario 'I can add a single location to a new space' do
    visit '/spaces/new'
    fill_in 'name',   with: 'Valley View'
    fill_in 'location', with: 'Sheffield'
    fill_in 'price', with: '100'
    fill_in 'description', with: 'Come see the four toilets of the apocalypse'

    click_button 'List your space'
    space = Space.first
    expect(space.location.name).to eq('Sheffield')
  end

end
