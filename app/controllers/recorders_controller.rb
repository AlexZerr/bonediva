class RecordersController < ApplicationController

  def new
def upload_file
  filename = params[:filename]

  audio = request.raw_post
  File.open(filename, 'w+b'){|file| file.puts audio}

  respond_to do | format |
   format.json { render json: { status: 202 } }
  end
end
  end
end
