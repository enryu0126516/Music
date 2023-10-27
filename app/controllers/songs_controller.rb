class SongsController < ApplicationController
  before_action :authenticate_user!
     def top
     end
     
     def index
      if params[:search] == nil
        @songs= Song.all
      elsif params[:search] == ''
        @songs= Song.all
      else
        #部分検索
        @songs = Song.where("title LIKE ? ",'%' + params[:search] + '%')
      end

      @rank_songs = Song.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}.first(50)

    end


     def new
        @song = Song.new
      end
    
      def create
        song = Song.new(song_params)
        song.user_id = current_user.id
        if song.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      

      private
      def song_params
        params.require(:song).permit(:name, :title, :genre, :coment, :day, :youtube_url, :question)
      end




end
