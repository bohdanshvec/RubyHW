require 'swagger_helper'

RSpec.describe 'api/v1/authors', type: :request do

  path '/api/v1/authors' do

    get('list authors') do
      tags 'Authors'
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

    post('create author') do
      tags 'Authors'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :author, in: :body, schema: {
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

        let(:name) { Faker::Name.name }
        let(:author) { { name: name } }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['name']).to eq(name)
        end
      end
    end
  end

  path '/api/v1/authors/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    delete('delete author') do
      tags 'Authors'
      response(200, 'successful') do
        
        # after do |example|
        #   example.metadata[:response][:content] = {
        #     'application/json' => {
        #       example: JSON.parse(response.body, symbolize_names: true)
        #     }
        #   }
        # end

        let(:author) { Author.create(name: Faker::Name.name) }
        let(:id) { author.id }

        run_test!
      end
    end
  end
end
