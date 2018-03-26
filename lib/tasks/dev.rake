namespace :dev do

  task fetch_user: :environment do

    url = "https://uinames.com/api/?ext&region=germany"

    10.times do
      response = RestClient.get(url)
      data = JSON.parse(response.body)

      user = User.create!(
        name: data["name"],
        email: data["email"],
        password: "12345678",
        avatar: data["avatar"] 
      )

      puts "created user #{user.name}"
    end

    puts "now you have #{User.count} users data"
  end

end
