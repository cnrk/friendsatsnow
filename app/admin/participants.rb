ActiveAdmin.register Participant do
  scope :all, :default => true

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :surname
      f.input :payment_date, label: "Bezahlt am"
    end
    f.buttons
  end

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

end

# show :title => :title do
#   panel "Tasks" do
#     table_for project.tasks do |t|
#       t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
#       t.column("Title") { |task| link_to task.title, admin_task_path(task) }
#       t.column("Assigned To") { |task| task.admin_user.email }
#       t.column("Due Date") { |task| task.due_date? ? l(task.due_date, :format => :long) : '-' }
#     end
#   end
# end