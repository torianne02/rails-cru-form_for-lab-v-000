class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
    @artist = Artist.find(@song.artist_id)
    @genre = Genre.find(@song.genre_id)
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(artist_params(:name, :artist_id, :genre_id))
    redirect_to artist_path(@artist)
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params(:name, :bio))
    redirect_to artist_path(@artist)
  end

  def artist_params(*args)
    params.require(:artist).permit(*args)
  end
end
