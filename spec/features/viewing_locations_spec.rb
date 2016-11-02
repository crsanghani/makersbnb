feature 'Filtering by location' do

  before(:each) do
    Space.first_or_create(name: 'The Hole', price: '75', location: Location.first_or_create(name: :Sheffield), description: 'Haunted.')
    Space.first_or_create(name: 'Haunted Mansion', price: '1000', location: Location.first_or_create(name: :Derby), description: 'Haunted.')
    Space.first_or_create(name: 'Psych Ward', price: '50', location: Location.first_or_create(name: :Hertfordshire), description: 'Haunted.')
    Space.first_or_create(name: 'Cirque du Freak', price: '95', location: Location.first_or_create(name: :Sheffield), description: 'Haunted.')
  end

  scenario 'I can filter spaces by location' do
    visit '/locations/Sheffield'

    expect(page.status_code).to eq(200)
    within 'ul#spaces' do
      expect(page).not_to have_content('Haunted Masion')
      expect(page).not_to have_content('Psych Ward')
      expect(page).to have_content('The Hole')
      expect(page).to have_content('Cirque du Freak')
    end
  end
end
