# users

User.create!(
  username: "Manuel",
  email: "email@ema.il",
  password: "password",
  password_confirmation: "password",
  expert: true,
  status: true)

User.create!(
  username: "not_expert",
  email: "email2@ema.il",
  password: "password",
  password_confirmation: "password",
  expert: false,
  status: true)

99.times do |n|
  name    = Faker::Pokemon.name
  email   = "example-#{n}@manuel.uoo"
  expert  = rand(2).zero?

  case rand(3)
  when 0 then status = true   # qualified
  when 1 then status = false  # not qualified
  when 2 then status = nil    # banned
  end

  User.create!( 
    username: name, 
    email: email,
    password: "password",
    password_confirmation: "password",
    expert: expert,
    status: status)
end




# discussions

10.times do |i|
  user = User.last
  # we only want novice users that don't have discussions yet
  while user.expert? or not user.discussion.nil?
    user = User.all[rand(User.count)]
  end
  Discussion.create(title: "Discussion #{i}", user: user)
end



# campaigns

title = Faker::Lorem.sentence(5)
User.first.build_campaign(title: title,
                          purpose: "multipurpose",
                          discussion_id: 1 )

# we only want expert users that don't have campaigns yet
10.times do |i|
  user = User.last
  unless user.expert? and user.campaign.nil?
    user = User.all[rand(User.count)]
  end
  Campaign.create( title: "Campaign #{i}",
                   purpose: "multipurpose",
                   estimated_duration: false,
                   discussion_id: rand(10),
                   user: user )
end