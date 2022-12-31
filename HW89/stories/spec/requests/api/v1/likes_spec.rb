require 'swagger_helper'

RSpec.describe 'api/v1/likes', type: :request do

  let(:title) { Faker::Movie.title }
  let(:body)  { Faker::Movie.quote }
  let(:author) { Author.create(name: Faker::Name.name) }
  let(:article) { Article.create(title: title, body: body, author_id: author.id) }
  let(:like) { Like.create(author_id: author.id, likeable_type: 'Article', likeable_id: article.id) }
  let(:likeable) { like.likeable_type.constantize.find(like.likeable_id)}

  path '/api/v1/likes' do

    get('list likes') do
      tags 'Likes'
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

    post('create like') do
      tags 'Likes'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :like, in: :body, schema: {
          type: :object,
          properties: {
            author_id: { type: :integer },
            likeable_type: { type: :string },
            likeable_id: { type: :integer }
          },
          required: %w[author_id likeable_type likeable_id]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end


        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['likeable_id']).to eq(article.id)
          expect(data['likeable_type']).to eq(like.likeable_type)
          expect(data['author_id']).to eq(author.id)
          end
      end
    end
  end
end
