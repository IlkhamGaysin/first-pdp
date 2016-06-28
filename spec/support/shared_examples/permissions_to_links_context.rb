shared_examples "permissions to links" do
  scenario "exist by own" do
    within "##{object_name}_#{object.id}" do
      expect(page).to have_content checking_link
    end
  end

  scenario "doesn't exist by another" do
    within "##{object_name}_#{another_object.id}" do
      expect(page).not_to have_content checking_link
    end
  end
end
