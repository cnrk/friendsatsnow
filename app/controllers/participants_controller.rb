class ParticipantsController < ApplicationController

  # GET /participants/new
  def new
    @participant = Participant.new

    respond_to do |format|
      format.js
    end
  end

  # POST /participants
  def create
    @participant = Participant.new(params[:participant])

    respond_to do |format|
      if @participant.save  
        format.js { redirect_to @participant }
      else
        format.js { render action: "new" }
      end
    end
  end

  # GET /participants/id
  def show
    @participant = Participant.find(params[:id])
    ConfirmationMailer.confirm_signup(@participant).deliver
    
    respond_to do |format|
      format.js
    end
  end

end
