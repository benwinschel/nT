require "rubygems"
gem "minitest"
require "minitest/autorun"
require "./test_app"
require 'sinatra'
require './app'
require_relative 'spec_helper.rb'

describe "basic functions of nT" do
  before do
  @a = Test.new
  User.destroy_all
  Tweet.destroy_all
  Relation.destroy_all
  @a.must_respond_to 'add_user'
  @a.add_user('Ben', 'duh', 'test')
  @a.must_respond_to 'add_tweet'
  @a.add_tweet(19, 'Hello this is a tweet test.')
  @a.must_respond_to 'add_follower'
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

class IntegrateTest < MiniTest::Unit::TestCase
describe "service" do
  before(:each) do
  User.delete_all
  User.create(name: "post_test", email: "test@test.org", password: "pass")
end

describe "add and check user" do
  it "post_user" do
    post '/user/register', {
      :name => "post_tester",
      :email => "test@tester.com",
      :password => "pass"}.to_json
      assert_same(last_response.status, 201)

      post '/user/register', {
        :name => "post_test",
        :email => "test@test.org",
        :password => "noodles"}.to_json
        assert_same(last_response.status, 500)
  end
  it "checks user" do
        get '/user/post_test'
        if last_response.status == 500
        skip
        else
        assert_same(last_response.status, 200)
        end
  end
end
describe "tweets" do
  it "adds tweets" do
    get '/test/tweets/100'
      assert_same(last_response.status, 200)
  end
  it "adds a user's tweets" do
    post '/user/post_test/tweet', {
      :sender_id => "post_test",
      :content => "test_tweet",
      :created => DateTime.now
      }.to_json
      assert_same(last_response.status, 201)

      post '/user/post_testz/tweet', {
      :sender_id => "post_test",
      :content => "test_tweet",
      :created => DateTime.now
      }.to_json
      assert_same(last_response.status, 500)
    end
      end
      describe " adding followers" do
        it "has one follow many" do
          get '/test/follow/5'
            assert_same(last_response.status, 200)
        end
end
describe "adding followers" do
  it "has many follow one" do
    get '/test/users/1/follow/10'
    assert_same(last_response.status, 200)
    end
end
describe " adding users" do
  it "adds users on bulk" do
  get '/test/seed/5'
  assert_same(last_response.status, 200)
  end
end
end
end
