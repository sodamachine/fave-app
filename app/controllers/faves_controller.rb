class FavesController < ApplicationController

    get '/faves' do
        @faves = Fave.all
        erb :'faves/index'
    end

    get '/faves/new' do
        erb :'faves/new'
    end

    post '/faves' do
        fave = Fave.create(params[:item])
        redirect 'faves/#{@fave.id}'
    end

end