# coding: utf-8

User.create!( name: "admin user",
              email: "sample@email.com",
              password: "000000",
              password_confirmation: "000000",
              admin: true)

100.times do |n|
    name = Faker::Name.name
    email = "sample-#{n+1}@email.com"
    password = "000000"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
end


us = User.all

us[0..2].each do |us|
    50.times do |a|
        usid = us.id * 100
        taskname = "タスク_#{a+1+usid}"
        detailed = "タスク詳細"

        us.tasks.create!(id: a+1+usid,
                        taskname: taskname,
                        detailed: detailed,
                        created_at: Time.now,
                        updated_at: Time.now)
    end
    puts "#{us.name}の登録完了"
end

puts "testコメント（削除予定）"
