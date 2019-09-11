# frozen_string_literal: true

# frozen_string_literal: true.

RSpec.describe Movement do
  describe 'validations' do
    subject { Movement.create(name: 'Snatch') }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
