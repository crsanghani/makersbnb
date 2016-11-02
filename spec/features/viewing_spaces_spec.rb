feature 'Viewing spaces' do

  scenario 'I can see existing spaces on the spaces page' do
    Space.create(name: 'Luxury Box',
                price: 500,
                location: Location.create(name: :London),
                description: 'A lovely little cabin filled with spiders')

    visit '/spaces'

    expect(page.status_code).to eq 200

    within 'ul#spaces' do
      expect(page).to have_content('Luxury Box')
      expect(page).to have_content('500')
      expect(page).to have_content('London')
      expect(page).to have_content('A lovely little cabin filled with spiders')
    end
  end
end
