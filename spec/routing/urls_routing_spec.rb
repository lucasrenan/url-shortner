require 'rails_helper'

RSpec.describe UrlsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/').to route_to('urls#index')
    end

    it 'routes to #show' do
      expect(:get => '/lALVIiy').to route_to('urls#show', :token => 'lALVIiy')
    end

    it 'routes to #create' do
      expect(:post => '/urls').to route_to('urls#create')
    end

    it 'routes to #destroy' do
      expect(:delete => '/urls/1').to route_to('urls#destroy', :id => '1')
    end

    describe 'invalid routes' do
      it 'does not route to #show' do
        expect(:get => '/123').to_not route_to('urls#show', :token => '123')
      end

      it 'does not route to #show' do
        expect(:get => '/fd9994f123').to_not route_to('urls#show', :token => 'fd9994f123')
      end
    end
  end
end
