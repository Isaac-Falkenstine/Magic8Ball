require 'rails_helper'

RSpec.describe Advice, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:body) }
  end

  describe "Relations" do
    it { is_expected.to belong_to(:user) }
  end
end
