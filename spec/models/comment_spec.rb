require "rails_helper"

describe Comment do
  it { is_expected.to validate_presence_of :text }
  it { should belong_to(:article) }
  it { should belong_to(:user) }
end
