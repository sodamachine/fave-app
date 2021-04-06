class FavesController < ApplicationController

    get '/faves' do
        @faves = Fave.all
        erb :'faves/index'
    end

    get '/faves/new' do
        erb :'faves/new'
    end

    post '/faves' do
        fave = Fave.create(params[:fave])
        redirect 'faves/#{fave.id}'
    end

    get '/faves/:id' do
        @fave = Fave.find_by(id: params[:id])
        if !@fave
            redirect '/faves'
        end
        erb :'faves/show'
    end

    get '/faves/:id/edit' do
        @fave = Fave.find_by(id: params[:id])
        if !@fave
          redirect '/faves'
        end
        erb :'faves/edit'
    end
    
    patch '/faves/:id' do
        @fave = Fave.find_by(id: params[:id])
        @fave.update(params[:fave])
        erb :'faves/show'
      end

end