ENV['DATABASE-URL'] = 'test'
require File.expand_path('../../config/environments', __FILE__)
require 'minitest/autorun'
require 'rack/test'
#require 'app'
