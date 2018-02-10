require 'rails_helper'

RSpec.describe TokenGenerator do
  describe '#generate' do
    it 'generates a random hex token' do
      expect(described_class.generate).to match(/\h/)
    end
  end
end
