ActiveAdmin.register Participant do
  form :partial => "form"

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
    column do |p|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.edit'), edit_resource_path(p), :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.delete'), resource_path(p), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
    end
  end

  show do
    attributes_table :name, :surname, :email, :created_at, :payment_date, :payment_confirmed
  end

  member_action :confirm_payment do
    participant = Participant.find(params[:id])
    ConfirmationMailer.confirm_payment(participant).deliver
    participant.confirm_payment
    participant.save
    redirect_to action: :show, notice: "Zahlung wurde bestaetigt!"
  end

end
