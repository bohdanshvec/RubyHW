require 'swagger_helper'

RSpec.describe 'api/v1/articles', type: :request do

  path '/' do

    get('list articles') do
      tags 'Articles'
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
  end

  path '/api/v1/articles' do
    get('list articles') do
      tags 'Articles'
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

    post('create article') do
      tags 'Articles'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :article, in: :body, schema: {
          type: :object,
          properties: {
            title: { type: :string },
            body: { type: :string },
            status: { type: :string },
            author_id: { type: :integer }
          },
          required: %w[title body author_id status]
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        let(:title) { Faker::Movie.title }
        let(:body)  { Faker::Movie.quote }
        let(:author) { Author.create(name: Faker::Name.name) }
        let(:article) { { title: title, body: body, author_id: author.id } }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['title']).to eq(title)
          expect(data['body']).to eq(body)
          expect(data['author']).to eq(author.name)
        end
      end

      # response(422, 'invalid request') do
      #   consumes 'application/json'
      #   parameter name: :article, in: :body, schema: {
      #     type: :object,
      #     properties: {
      #       title: { type: :string },
      #       body: { type: :string },
      #       status: { type: :string },
      #       author_id: { type: :integer }
      #     },
      #     required: %w[title body author_id status]
      #   }
      #   after do |example|
      #     example.metadata[:response][:content] = {
      #       'application/json' => {
      #         example: JSON.parse(response.body, symbolize_names: true)
      #       }
      #     }
      #   end
      #   let(:title) { Faker::Movie.title }
      #   let(:body)  { Faker::Movie.quote }
      #   let(:author) { Author.create(name: Faker::Name.name) }
      #   let(:article) { { title: title, body: body, author_id: author.id } }

      #   run_test!
      # end
    end
  end

  path '/api/v1/articles/{id}' do
    # You'll want to customize the parameter types...
    parameter name: :id, in: :path, type: :string, description: 'id'

    get('show article') do
      tags 'Articles'
      response(200, 'successful') do
        let(:title) { Faker::Movie.title }
        let(:body)  { Faker::Movie.quote }
        let(:author) { Author.create(name: Faker::Name.name) }
        let(:article) { Article.create(title: title, body: body, author_id: author.id) }
        let(:id) { article.id }
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

    patch('update article') do
      tags 'Articles'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :article, in: :body, schema: {
          type: :object,
          properties: {
            title: { type: :string },
            body: { type: :string },
            status: { type: :string },
            author_id: { type: :integer }
          },
          required: %w[title body author_id status]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        let(:title) { Faker::Movie.title }
        let(:body)  { Faker::Movie.quote }
        let(:author) { Author.create(name: Faker::Name.name) }
        let(:article) { Article.create(title: title, body: body, author_id: author.id) }
        let(:id) { article.id }

        run_test! do |response|
        data = JSON.parse(response.body)
        expect(data['title']).to eq(title)
        expect(data['body']).to eq(body)
        expect(data['author']).to eq(author.name)
        end
      end
    end

    put('update article') do
      tags 'Articles'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :article, in: :body, schema: {
          type: :object,
          properties: {
            title: { type: :string },
            body: { type: :string },
            status: { type: :string },
            author_id: { type: :integer }
          },
          required: %w[title body author_id status]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        let(:title) { Faker::Movie.title }
        let(:body)  { Faker::Movie.quote }
        let(:author) { Author.create(name: Faker::Name.name) }
        let(:article) { Article.create(title: title, body: body, author_id: author.id) }
        let(:id) { article.id }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['title']).to eq(title)
          expect(data['body']).to eq(body)
          expect(data['author']).to eq(author.name)
        end
      end
    end

    delete('delete article') do
      tags 'Articles'
      response(200, 'successful') do
        let(:title) { Faker::Movie.title }
        let(:body)  { Faker::Movie.quote }
        let(:author) { Author.create(name: Faker::Name.name) }
        let(:article) { Article.create(title: title, body: body, author_id: author.id) }
        let(:id) { article.id }

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

  path '/api/v1/articles/{article_id}/tags/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'article_id', in: :path, type: :string, description: 'article_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    post('tag_add article') do
      tags 'Articles'
      response(200, 'successful') do
        let(:title) { Faker::Movie.title }
        let(:body)  { Faker::Movie.quote }
        let(:author) { Author.create(name: Faker::Name.name) }
        let(:article) { Article.create(title: title, body: body, author_id: author.id) }
        let(:article_id) { article.id }
        let(:tag) { Tag.create(name: Faker::Alphanumeric.alpha(number: 3)) }
        let(:id) { tag.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! do |response|
          text = "Tag '#{tag.name}' added in Article #{article.title}"
          data = JSON.parse(response.body)
          expect(data['data']).to eq(text)
        end
      end
    end
  end
end

# Для прогона тестов:
# SWAGGER_DRY_RUN=0 RAILS_ENV=test rails rswag