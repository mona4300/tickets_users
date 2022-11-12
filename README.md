# README

First we need to add some users.
Then add some tickets. Each ticket will check if the user has enabled the reminders. and check the current ticket due date and at which date it sould be sent. Note this behaviour run inside a background jobs.

Then create another job for this date at the selected user time and zone if the job not exists. this new job will send the notifications if the user still have tickets on the target due_date. 

We track created jobs on each due date on another model called TicketsReminders

If we changed any reminders options at user then we overwrite all exists jobs and create another ones. Each sender job should check the latest job ID on TicketsReminders record if they are not the same, then the job has been overwritten and it will stop.

The same happens with the Tickets changes (due_date or assignee). but in this case the code will create a sender job for the current due date only if it is not exist.

you need to install redis and run the redis server before creating anything

As an improvment we may add another daily scheduler to clean outdated TicketsReminders records