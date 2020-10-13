require 'rails_helper'

RSpec.describe MultimediaFilesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/multimedia_files').to route_to('multimedia_files#index')
    end

    it 'routes to #show' do
      expect(get: '/multimedia_files/1').to route_to('multimedia_files#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/multimedia_files').to route_to('multimedia_files#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/multimedia_files/1').to route_to('multimedia_files#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/multimedia_files/1').to route_to('multimedia_files#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/multimedia_files/1').to route_to('multimedia_files#destroy', id: '1')
    end
  end
end
