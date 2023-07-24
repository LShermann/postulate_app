i = 0
    until User.count == 10 do
    Image.create!(url: Faker::Avatar.image, imageable: User.create!(email: "test#{i}@gmail", password: "123456", "password_confirmation": "123456", name: Faker::Name.name, phone: "+5698332393#{i}"))
    i += 1
end

until Job.count == 10 do
    Job.create(name: Faker::Job.title, description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false), requeriment: Faker::Job.education_level)
    end