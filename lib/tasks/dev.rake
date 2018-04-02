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

    10.times do
      post = Post.create!(
        title: FFaker::Product.product,
        photo: File.open(Rails.root.join("app/assets/images/img/post/#{rand(11..30)}.png")) ,
        url: "https://s.taobao.com/search?spm=a21wu.10013406-tw.7607074463.5.3f3e29f8U4HBBx&q=%E6%B2%99%E5%8F%91&from=sea",
        description: FFaker::Lorem.sentence,
        price: "#{rand(300..21000)}",
        user: User.all.sample,
        goal: "#{rand(4..30)}",
        due_time: FFaker::Time.datetime,
        status: [ "已結團", "已流團" ][rand(0..1)],
        delivery: [ "直送宅配到府", "直送超商取貨", "集貨宅配到府", "集貨超商取貨" ][rand(0..3)]
      )

    end

    Participate.destroy_all

    10.times do
      participate = Participate.create!(
        user: User.all.sample,
        post: Post.all.sample
      )

    end

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
    
    30.times do
      post = Post.create!(
        title: FFaker::Product.product,
        photo: File.open(Rails.root.join("app/assets/images/img/post/#{rand(11..30)}.png")) ,
        url: "https://s.taobao.com/search?spm=a21wu.10013406-tw.7607074463.5.3f3e29f8U4HBBx&q=%E6%B2%99%E5%8F%91&from=sea",
        description: FFaker::Lorem.sentence,
        price: "#{rand(300..21000)}",
        user: User.all.sample,
        goal: "#{rand(4..30)}",
        due_time: ["2018-05-10 10:39","2018-06-03 07:10","2018-04-05 13:42","2018-04-30 08:00","2018-07-10 15:40","2018-04-27 19:43","2018-05-04 23:00","2018-04-13 14:35","2018-05-19 15:23"][rand(0..8)],
        status: "開團中",
        delivery: [ "直送宅配到府", "直送超商取貨", "集貨宅配到府", "集貨超商取貨" ][rand(0..3)]
      )

    end

    100.times do
      participate = Participate.create!(
        user: User.all.sample,
        post: Post.where(status: "開團中").all.sample
      )

    end

    puts "now you have #{Post.count} posts data"
    puts "now you have #{Participate.count} participates data"
  end

end

