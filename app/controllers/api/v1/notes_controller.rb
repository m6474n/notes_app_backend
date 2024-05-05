class Api::V1::NotesController < ApplicationController
  def index
    notes = Note.all
    render json: notes , status: 200
  end

  def show
    note = Note.find_by(id: params[:id])

    if note
    render json: note, status: 200
    else
      render json: {
        error: "Note not found!"
      }
    end
  end

  def create
    note = Note.new(
      title: note_params[:title],
      body: note_params[:body]
    )
    if note.save
        render json: note, status: 200
    else
      render json: {
        error: "Something went wrong, Try again later."
      }
    end
  end

  def update
    note = Note.find_by(id: params[:id])

    if note
      # note.update(title:params[title: note_params[:title], body: note_params[:body]])
      note.update(title: note_params[:title], body: note_params[:body])
      render json: "Note updated successfully"
    
    else
      render json: {
        error:  "Something went wrong!"
      }
    end
  end
  def destroy
    note = Note.find_by(id: params[:id])

    if note
      note.destroy
      render json: "Note deleted successfully"
    else
      render json: {
        error: "Something went wrong"
      }
    end
  end
  private
  def note_params
    params.require(:note).permit([
      :title, :body
    ])
  end
end
