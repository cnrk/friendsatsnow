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
        ConfirmationMailer.confirm_signup(@participant).deliver
        format.js { redirect_to @participant }
      else
        format.js { render action: "new" }
      end
      b = []
      b.to_enum
    end
  end

  # GET /participants/id
  def show
    @participant = Participant.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

end
