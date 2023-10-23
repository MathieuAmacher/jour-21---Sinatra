require 'gossip'
require 'bundler'
Bundler.require

class ApplicationController < Sinatra::Base
    get '/' do
        erb :index
    end

    get '/gossips' do
        erb :index2, locals: {gossips: @gossips}
    end

    get '/gossip/new' do
        erb :new_gossip
    end

    post '/gossip/new' do
        author = params['gossip_author']
        content = params['gossip_content']
        gossip = Gossip.new(author, content)
        gossip.save
        redirect '/gossips'
    end

end