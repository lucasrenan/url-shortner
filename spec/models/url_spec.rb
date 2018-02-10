require 'rails_helper'

RSpec.describe Url, type: :model do
  let(:original_url) { 'http://lucasrenan.com' }

  describe 'before validation'do
    it 'sets the unique token' do
      url = described_class.new(original_url: original_url)

      expect(url.valid?).to be(true)
      expect(url.token).to_not be_blank
      expect(url.save).to be(true)
    end
  end
end
