require "rubygems"
gem "minitest"
require "minitest/autorun"
require "./test_app"

describe "basic functions of nT" do
  before do
  @a = Test.new
  User.destroy_all
  Tweet.destroy_all
  Relation.destroy_all
  @a.add_user('Ben', 'duh', 'test')
  @a.add_tweet(19, 'Hello this is a tweet test.')
  @a.add_follower(10, 12)
end
  it "should add a user" do

    User.find_by(name: 'Ben').name.must_equal('Ben')
  end
  it "should check user exits" do
    assert_instance_of(User, @a.check_user, nil)
end

it "should add a tweet" do

  Tweet.find_by(sender_id: 19).content.must_equal('Hello this is a tweet test.')
end
it "should check tweet exits" do
  assert_instance_of(Tweet, @a.check_tweet, nil)
end

it "should add a follower for a user" do

  Relation.find_by(followee_id: 10).follower_id.must_equal(12)
end
it "should check user exits" do
  assert_instance_of(Relation, @a.check_relation, nil)
end
end
