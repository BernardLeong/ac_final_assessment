class NotesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @users = User.all
    @notes = Note.all
    if current_user
      @follows = Follow.where(follower_id: current_user.id)
    end
  end

  def new
    @note = Note.new
  end

  def create
    note = current_user.notes.new(note_params)
    note.save
    redirect_to notes_path
  end

  def destroy
    Note.find(params[:id]).destroy
    redirect_to notes_path
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update;
    note = Note.find(params[:id])
    if note.update(note_params)
      redirect_to notes_path
    else
      render :edit
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end
end
