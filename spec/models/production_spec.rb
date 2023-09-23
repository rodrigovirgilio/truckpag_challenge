require "rails_helper"

RSpec.describe Product, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:imported_t) }
  end
end
