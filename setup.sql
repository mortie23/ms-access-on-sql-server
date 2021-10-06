
drop table if exists questions;
go

-- A table listing questions and answers
-- There are two questions types which will be seperated in the view layer
create table questions (
  question_id INT IDENTITY(1, 1) UNIQUE NOT NULL
  , question_type varchar(10)
  , question varchar(100)
  , answer varchar(100) default null
  , edit_user_id varchar(30) 
  , edit_datetime datetime 
  , constraint PK_question_id primary key clustered (question_id)
)
-- Seeding table with from questions
insert into questions (question_type, question, edit_user_id, edit_datetime) values 
('generic', 'your name', null, null)
, ('generic', 'your age', null, null)
, ('favourite', 'favourite colour', null, null)
, ('favourite', 'favourite food', null, null)
, ('favourite', 'favourite sport', null, null)
go
;

-- Will be updating the table through two views 
create or alter view questions_generic as
select 
  question_id 
  , question_type
  , question
  , answer 
  , edit_user_id   
  , edit_datetime
from
  questions
where
  question_type = 'generic'
;
go

create or alter view questions_favourite as
select 
  question_id 
  , question_type
  , question
  , answer 
  , edit_user_id   
  , edit_datetime
from
  questions
where
  question_type = 'favourite'
;