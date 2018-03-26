class NotesController < ApplicationController
  before_action :authenticate_user! 

  def index
    @users = User.all
    @notes = Note.all
  end

  def new
    @note = Note.new
  end
  
  def show
    @note = Note.find(params[:id])
  end
  
  def edit
    @note = Note.find(params[:id])
  end
  
  def create
    @note = current_user.notes.create!(note_params)
    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to notes_path
    else
      flash.now[:alert] ="Profile failed to create"
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id]).destroy
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end
end
