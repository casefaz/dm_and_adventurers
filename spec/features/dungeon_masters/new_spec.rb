require 'rails_helper'

RSpec.describe 'DM Creation' do
    describe 'user story 11' do
        # As a visitor
        # When I visit the Parent Index page
        # Then I see a link to create a new Parent record, "New Parent"
        # When I click this link
        # Then I am taken to '/parents/new' where I  see a form for a new parent record
        # When I fill out the form with a new parent's attributes:
        # And I click the button "Create Parent" to submit the form
        # Then a `POST` request is sent to the '/parents' route,
        # a new parent record is created,
        # and I am redirected to the Parent Index page where I see the new Parent displayed.
        it 'links to the new page from dm index' do
            visit '/dungeon_masters'

            click_link "New Dungeon Master"
            expect(current_path).to eq('/dungeon_masters/new')
        end
    end
end