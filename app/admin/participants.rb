ActiveAdmin.register Participant do

  filter :name
  filter :surname
  filter :email
  filter :payment_date

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :surname
      f.input :email
      f.input :payment_date
    end
    f.buttons
  end

  index do
    column :name
    column :surname
    column :email
    column "Angemeldet am", :created_at
    column "Bezahlt", :paid do |p|
      status_tag (p.paid? ? "Ja" : "Nein"), (p.paid? ? :ok : :error)
    end
    column "Bezahlt am", :payment_date
    default_actions
  end

  show do
    attributes_table :name, :surname, :email, :created_at, :payment_date
  end

end
