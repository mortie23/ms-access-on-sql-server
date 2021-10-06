# ms-access-on-sql-server

Basic use case for editing an SQL server database through a MS Access form and auditing each updated row for user and time

## Setup the database

On an SQL Server instance, create a database called `CRUD_ACCESS`.
Run the `setup.sql` script to create the tables and views.

![Objects](./media/01-objects.png)

Showing the sample seeded rows.

![Rows](./media/01-table-seed-rows.png)

## Create an ODBC connection to the SQL Server Database

From Windows search for ODBC (64-bit) and create a connection to you SQL Server instance.

## Setup the MS Access form

In MS Access, create a new database, and then go to New Data Source -> From Database -> From SQL Server.

![](./media/02-ms-access-sql-server.png)

Select link to the data source by creating a linked table.

![](./media/03-link.png)

Select the connection, and from the connection, select the two views (`questions_generic` and `questions_favourite`).

Then select the unique identifier of the table (in this case `question_id`)

![](./media/04-select-columns.png)

Now you should be able to see the two views and look at the records.

![](./media/05-view-rows-access.png)

## Making the from

Select one of the views and select create form

![](./media/06-create-form.png)

A blank for will be created and you can edit the field labels and titles.

![](./media/06-blank-form.png)

Now to add the functionality such that the `edit_user_id` and `edit_datetime` are populated with the answer is completed and make all the other fields not editable.

Select the answer field, and in the properties sheet, on the Event tabe, click on the elipsis (...) on `After Update`.

![](./media/07-answer-event.png)

Select the code builder.

![](./media/07-code-builder.png)

Paste the contents of the `event.vba` script into the code builder.
Then for all fields except for `answer`, in the Property Sheet, in the Data tab, set them to `Locked = Yes`

![](./media/08-locked.png)

Now if we open the form and add an answer to a question, we see the `edit_user_id` and `edit_datetime` automatically populating.

![](./media/09-auto-update.png)

Going back to SSMS, and querying the table we see the rows have been updated with the values entered in the MS Access form.

![](./media/10-ms-sql-updated.png)
