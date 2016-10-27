class FiguresController < ApplicationController

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures/:id' do
    @figure = Figure.create(params["figure"])

    if params["title"]["name"]!= ""
      @figure.titles << Title.create(params["title"])
    end

    if params["landmark"]["name"] != ""
      @landmark = Landmark.create(params["landmark"])
      @figure.landmarks << @landmark
    end

    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params["id"])
    erb :'figures/show'
  end


  get '/figures/:id/edit' do
    @figure = Figure.find(params["id"])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params["id"])
    @figure.update(params["figure"])

    if params["title"]["name"]!= ""
      @figure.titles << Title.create(params["title"])
    end

    if params["landmark"]["name"] != ""
      @landmark = Landmark.create(params["landmark"])
      @figure.landmarks << @landmark
    end

    @figure.save

    redirect "/figures/#{@figure.id}"
  end
end
