namespace :generate_token do
  desc "Generate authenticate token in database"

  task authenticate: :environment do
    auth = Authentication.create(name: "Authentication one", token: SecureRandom.hex)

    puts "Authentication successfully created"
    puts "#{auth.token}"
  end
end
