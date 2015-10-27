require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './models/User'
require './models/Tweet'
require './models/Relation'
require 'faker'
class Test

  def add_user(name, email, password)
    User.create(name: "#{name}", email: "#{email}", password: "#{password}", avatar: Faker::Avatar.image)
  end

  def check_user
  @u = User.first
  return @u
  end

  def add_tweet(sender_id, tweet)
    Tweet.create(sender_id: "#{sender_id}", content: "#{tweet}", created: DateTime.now)
  end

  def check_tweet
    @t = Tweet.first
    return @t
  end

  def add_follower(followee_id, follower_id)
    Relation.create(followee_id: "#{followee_id}" , follower_id: "#{follower_id}")
  end

  def check_relation
    @r = Relation.first
    return @r
  end
end
