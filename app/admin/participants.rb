ActiveAdmin.register Participant do

  filter :name
  filter :surname
  filter :email
  filter :payment_date

  index do
    column :name
    column :surname
    column "Angemeldet am", :created_at
    column "Bezahlt", :paid do |p|
      status_tag (p.paid? ? "Ja" : "Nein"), (p.paid? ? :ok : :error)
    end
    column "Bezahlt am", :payment_date
    default_actions
  end

 form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :surname
      f.input :email
    end
    f.inputs "Zahlung" do
      f.input :payment_date, as: :date_picker
      f.input :payment_confirmed
    end
    f.actions
  end

  member_action :confirm_payment do
    participant = Participant.find(params[:id])
    ConfirmationMailer.confirm_payment(participant).deliver
    participant.confirm_payment
    participant.save
    redirect_to action: :show, notice: "Zahlung wurde bestaetigt!"
  end

  action_item :only => :edit do
    link_to "Zahlung bestaetigen", controller: "participants", action: "confirm_payment", confirm: "Zahlung bestaetigen?" unless participant.paid?
  end
end
