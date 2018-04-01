namespace :dev do

  task fetch_user: :environment do
    User.destroy_all

    url = "https://uinames.com/api/?ext&region=england"

    10.times do
      response = RestClient.get(url)
      data = JSON.parse(response.body)

      user = User.create!(
        name: data["name"],
        email: data["email"],
        password: "12345678",
        avatar: File.open(Rails.root.join("app/assets/images/img/avatar/#{rand(1..10)}.png")) 
      )

      puts "created user #{user.name}"
    end

    puts "now you have #{User.count} users data"
  end

  task fetch_post: :environment do
    Post.destroy_all

    30.times do
      post = Post.create!(
        title: FFaker::Product.product,
        photo: File.open(Rails.root.join("app/assets/images/img/post/#{rand(11..36)}.png")) ,
        url: "https://s.taobao.com/search?spm=a21wu.10013406-tw.7607074463.5.3f3e29f8U4HBBx&q=%E6%B2%99%E5%8F%91&from=sea",
        description: FFaker::Lorem.sentence,
        price: "#{rand(300..21000)}",
        user: User.all.sample,
        goal: "#{rand(4..30)}",
        due_time: FFaker::Time.datetime,
        status: [ "開團中", "已結團", "已流團" ][rand(0..2)],
        delivery: [ "直送宅配到府", "直送超商取貨", "集貨宅配到府", "集貨超商取貨" ][rand(0..3)]
      )

    end

    puts "now you have #{Post.count} posts data"
  end

  task fetch_reply: :environment do
    Reply.destroy_all

    90.times do
      reply = Reply.create!(
        user: User.all.sample,
        post: Post.all.sample,
        comment: FFaker::Lorem.sentence
      )

    end

    puts "now you have #{Reply.count} replies data"
  end

  task fetch_participate: :environment do
    Participate.destroy_all

    50.times do
      participate = Participate.create!(
        user: User.all.sample,
        post: Post.all.sample
      )

    end

    puts "now you have #{Participate.count} participates data"
  end

end

