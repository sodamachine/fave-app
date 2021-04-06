class FavesController < ApplicationController

    get '/faves' do
        @faves = Fave.all
        erb :'faves/index'
    end

end