require 'pry'

class SongsController < ApplicationController
	def index
		@songs = Song.all
		# binding.pry
	end

	def show
		@song = Song.find(params[:id])
		@genre = @song.genre
		@artist = @song.artist_name
	end

	def new
		@song = Song.new
	end

	def create

		@song = Song.new(song_params)
		# binding.pry	
		if !@song.valid?
			render :new
		else
			@song.save
			redirect_to song_path(@song)
		end
	end

	def edit
		@song = Song.find(params[:id])	
	end

	def update
		@song = Song.find(params[:id])
		@song.update(song_params)
		if !@song.update(song_params)
    	  render :edit
    	else
    	redirect_to song_path(@song)
    	end
	end

	def destroy
		@song = Song.find(params[:id])
		@song.destroy
		redirect_to songs_path
	end


	private

	def song_params
  		params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
	end

end