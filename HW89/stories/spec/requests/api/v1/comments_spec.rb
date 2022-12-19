require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do

  path '/api/v1/comments' do

    get('list comments') do
      tags 'Comments'
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

    post('create comment') do
      tags 'Comments'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :comment, in: :body, schema: {
          type: :object,
          properties: {
            body: { type: :string },
            status: { type: :string },
            article_id: { type: :integer },
            author_id: { type: :integer }
          },
          required: %w[body author_id article_id status]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        let(:body)  { Faker::Movie.quote }
        let(:author) { Author.create(name: Faker::Name.name) }
        let(:article) { Article.create(title: Faker::Movie.title, body: Faker::Movie.quote, author_id: author.id) }
        let(:comment) { { body: body, author_id: author.id, article_id: article.id } }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['body']).to eq(body)
          expect(data['article']['id']).to eq(article.id)
          expect(data['author']).to eq(author.name)
        end
      end

      response(422, 'invalid request') do
        consumes 'application/json'
        parameter name: :comment, in: :body, schema: {
          type: :object,
          properties: {
            body: { type: :string },
            status: { type: :string },
            article_id: { type: :integer },
            author_id: { type: :integer }
          },
          required: %w[body author_id article_id status]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        let(:body)  { Faker::Movie.quote }
        let(:author) { Author.create(name: Faker::Name.name) }
        let(:comment) { { body: body, author_id: author.id } }

        run_test!
      end
    end
  end

  path '/api/v1/comments/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show comment') do
      tags 'Comments'
      response(200, 'successful') do
        let(:body)  { Faker::Movie.quote }
        let(:author) { Author.create(name: Faker::Name.name) }
        let(:article) { Article.create(title: Faker::Movie.title, body: Faker::Movie.quote, author_id: author.id) }
        let(:comment) { Comment.create(body: body, author_id: author.id, article_id: article.id) }
        let(:id) { comment.id }

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

    patch('update comment') do
      tags 'Comments'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :comment, in: :body, schema: {
          type: :object,
          properties: {
            body: { type: :string },
            status: { type: :string },
            article_id: { type: :integer },
            author_id: { type: :integer }
          },
          required: %w[body author_id article_id status]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        let(:body)  { Faker::Movie.quote }
        let(:author) { Author.create(name: Faker::Name.name) }
        let(:article) { Article.create(title: Faker::Movie.title, body: Faker::Movie.quote, author_id: author.id) }
        let(:comment) { Comment.create(body: body, author_id: author.id, article_id: article.id) }
        let(:id) { comment.id }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['body']).to eq(body)
          expect(data['article']['id']).to eq(article.id)
          expect(data['author']).to eq(author.name)
        end
      end

      # response(422, 'invalid request') do
      #   consumes 'application/json'
      #   parameter name: :comment, in: :body, schema: {
      #     type: :object,
      #     properties: {
      #       body: { type: :string },
      #       status: { type: :string },
      #       article_id: { type: :integer },
      #       author_id: { type: :integer }
      #     },
      #     required: %w[body author_id article_id status]
      #   }

      #   after do |example|
      #     example.metadata[:response][:content] = {
      #       'application/json' => {
      #         example: JSON.parse(response.body, symbolize_names: true)
      #       }
      #     }
      #   end

      #   let(:body)  { Faker::Movie.quote }
      #   let(:author) { Author.create(name: Faker::Name.name) }
      #   let(:article) { Article.create(title: Faker::Movie.title, body: Faker::Movie.quote, author_id: author.id) }
      #   let(:comment) { Comment.create(body: body, author_id: author.id, article_id: article.id) }
      #   let(:id) { comment.id }
      #   run_test!
      # end
    end

    put('update comment') do
      tags 'Comments'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :comment, in: :body, schema: {
          type: :object,
          properties: {
            body: { type: :string },
            status: { type: :string },
            article_id: { type: :integer },
            author_id: { type: :integer }
          },
          required: %w[body author_id article_id status]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        let(:body)  { Faker::Movie.quote }
        let(:author) { Author.create(name: Faker::Name.name) }
        let(:article) { Article.create(title: Faker::Movie.title, body: Faker::Movie.quote, author_id: author.id) }
        let(:comment) { Comment.create(body: body, author_id: author.id, article_id: article.id) }
        let(:id) { comment.id }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['body']).to eq(body)
          expect(data['article']['id']).to eq(article.id)
          expect(data['author']).to eq(author.name)
        end
      end
    end

    delete('delete comment') do
      tags 'Comments'
      response(200, 'successful') do
        let(:body)  { Faker::Movie.quote }
        let(:author) { Author.create(name: Faker::Name.name) }
        let(:article) { Article.create(title: Faker::Movie.title, body: Faker::Movie.quote, author_id: author.id) }
        let(:comment) { Comment.create(body: body, author_id: author.id, article_id: article.id) }
        let(:id) { comment.id }

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

# Для прогона тестов:
# SWAGGER_DRY_RUN=0 RAILS_ENV=test rails rswag