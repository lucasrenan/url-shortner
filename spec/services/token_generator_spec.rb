require 'rails_helper'

RSpec.describe TokenGenerator do
  describe '#generate' do
    context 'with url' do
      it 'generates a base62 token' do
        url = 'http://lucasrenan.com'

        expect(described_class.generate(url)).to eq('QUWbnkj')
        expect(described_class.generate(url).length).to eq(7)
      end

      context 'when calling generate multiple times' do
        let(:url) { 'https://google.com' }

        it 'generates the same token' do
          10.times {
            expect(described_class.generate(url)).to eq('U3o7efE')
          }
        end
      end
    end

    context 'without url' do
      it 'does not generate a token' do
        expect(described_class.generate('')).to be_nil
        expect(described_class.generate(nil)).to be_nil
      end
    end
  end
end
