# Friends@Snow

This is a small rails app to organize a ski trip with friends.

- Friends can sign up for the event and will get a confirmation email.
- The administrator can edit/delete and update signed up friends in the administration backend.
- As soon as a friend has payed for the event, the administrator can confirm the payment,
which will send out a confirmation email.

- Built with active_admin.

# Getting started

- rename env.sample to .env
- add your Gmail credentials
- add a secret token (run ```rake secret``` for inspiration)
- run the tests ```bundle exec rake test```
- start the application with ```foreman start```

