User.create!(
  name:  "Yin Long",
  chat_work: "Yin Long",
  email: "blue.rose.hut@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: :admin
)

prng = Random.new
10.times do
  Category.create!(
    name: Faker::Name.title,
    description: Faker::Lorem.sentence,
    time_limit: prng.rand(20)+1 ,
    number_question: prng.rand(20)+1)
end

categories = Category.all
user = User.first
categories.each do |category|
  30.times do
    question = user.questions.new(
      content: Faker::Lorem.sentence,
      state: :actived,
      category: category)
    question.options.new(
      content: Faker::Lorem.sentence(3),
      correct: true)
    prng.rand(5).times do
      question.options.new(
      content: Faker::Lorem.sentence(3))
    question.save
    end
  end
end
