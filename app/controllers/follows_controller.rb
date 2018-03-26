class FollowsController < ApplicationController
      def create
        Follow.create(following_id: params[:id], follower: current_user)
        @notes = Note.all.order("created_at DESC")
        @users = User.all.order("username ASC")
        if current_user
          @follows = Follow.where(follower_id: current_user.id)
        end      
        render :toggle    
      end
    
      def destroy
        follow = Follow.find_by(following_id: params[:id], follower: current_user)
        follow.destroy
        @notes = Note.all.order("created_at DESC")
        @users = User.all.order("username ASC")
        if current_user
          @follows = Follow.where(follower_id: current_user.id)
        end
        render :toggle
      end
end
