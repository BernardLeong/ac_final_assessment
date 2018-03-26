class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    note = Note.find(params[:id])
    note.likes.create(user: current_user)
    redirect_to notes_path
  end

  def destroy
    note = Note.find(params[:id])
    like = Like.find_by(user: current_user, note: note)
    like.destroy
    redirect_to notes_path
  end

  private

  def likes_params
    params.require(:like).permit(:note_id, :user_id)
  end
  
end