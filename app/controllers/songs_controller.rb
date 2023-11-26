class SongsController < ApplicationController
  before_action :authenticate_user!
     def top
     end
     
     def index
      @Songs = Song.all.order(created_at: :desc)
        if params[:search] == nil
            @songs= Song.all.order(created_at: :desc)
         elsif params[:search] == ''
            @songs= Song.all
         else
            @songs= Song.where("title LIKE ? OR name LIKE ? OR genre LIKE ?",'%' + params[:search] + '%','%' + params[:search] + '%' ,'%' + params[:search] + '%')
         end
         @rank_songs = Song.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
         @songs = @songs.page(params[:page]).per(6)
         @rank_songs = Kaminari.paginate_array(@rank_songs).page(params[:page]).per(10)

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

      def destroy
        song = Song.find(params[:id])
        song.destroy
        redirect_to action: :index
      end

      

      private
      def song_params
        params.require(:song).permit(:name, :title, :genre, :coment, :day, :youtube_url, :question, :body)
      end




    end
