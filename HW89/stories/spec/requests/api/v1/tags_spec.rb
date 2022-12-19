require 'swagger_helper'

RSpec.describe 'api/v1/tags', type: :request do

  path '/api/v1/tags' do

    get('list tags') do
      tags 'Tags'
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! 
      end
    end

    post('create tag') do
      tags 'Tags'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :tag, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string }
          },
          required: %w[name]
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        let(:name) { Faker::Hipster.word }
        let(:tag) { { name: name } }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['name']).to eq(name)
        end
      end
    end
  end

  path '/api/v1/tags/{id}' do
  #   # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    delete('delete tag') do
      tags 'Tags'
      response(200, 'successful') do
        let(:name) { Faker::Hipster.word }
        let(:tag) { Tag.create(name: name) }
        let(:id) { tag.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
