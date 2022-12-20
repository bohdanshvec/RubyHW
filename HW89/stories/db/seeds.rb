# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do 
  name = Faker::Name.name
  Author.create(name: name)
  # author.errors.messages
end

10.times do
  title = Faker::ProgrammingLanguage.name
  body = Faker::Hipster.word
  author_id = Author.ids.sample
  Article.create(title: title, body: body, author_id: author_id)
end

10.times do
  body = Faker::Hipster.word
  author_id = Author.ids.sample
  article_id = Article.ids.sample
  Comment.create(body: body, author_id: author_id, article_id: article_id)
end

10.times do
  name = Faker::Hipster.word
  Tag.create(name: name)
end

20.times do
  Article.find(Article.ids.sample).tags << Tag.find(Tag.ids.sample)
end

10.times do
  # title = Faker::Alphanumeric.alpha(number: 3)
  likeable_type = ["Article", "Comment"].sample
  likeable_id = (likeable_type == "Article" ? Article.ids.sample : Comment.ids.sample)
  likeable = likeable_type.constantize.find(likeable_id)

  Like.create(likeable: likeable)#, title: title)
end