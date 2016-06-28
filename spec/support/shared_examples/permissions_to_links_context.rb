shared_examples "permissions to links" do
  it "exist by own" do
    within "##{object_name}_#{object.id}" do
      is_expected.to have_content checking_link
    end
  end

  it "doesn't exist by another" do
    within "##{object_name}_#{another_object.id}" do
      is_expected.not_to have_content checking_link
    end
  end
end
