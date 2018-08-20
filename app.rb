require 'sinatra'
require 'sinatra/reloader'

require 'active_record'
require 'mysql2'

enable :sessions


#read DB config
ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(:development)

class User < ActiveRecord::Base
end

get '/' do
  erb :index
end

get '/info' do
  erb :info
end

get '/users' do
  @users =  User.all
  erb :users
end
