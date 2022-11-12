require "rails_helper"

RSpec.describe User, :type => :model do
  context "Relations" do
    it { should have_many(:tickets) }
  end
end