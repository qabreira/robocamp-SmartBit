*** Settings ***
Documentation        Gerenciando a massa de testes através do banco de dados.

Library              DatabaseLibrary

*** Keywords ***
Connect To Postgres
    Connect To Database    psycopg2
    ...                    mdbtfsit
    ...                    mdbtfsit
    ...                    thwTFRI1bHE8m22jLS73hRfzBFA-gscR
    ...                    babar.db.elephantsql.com
    ...                    5432

# SELECT * FROM public.students WHERE email = 'falcao@gmail.com';
# SELECT * FROM public.enrollments WHERE student_id = 1;
# DELETE FROM public.enrollments WHERE student_id = 1;

Select Student Where Email
    [Arguments]    ${email}

    ${query}        Set Variable
    ...             SELECT * FROM public.students WHERE email = '${email}';

    ${result}       Query    ${query}

    [return]        ${result}[0]

Delete Enroll By Email
    [Arguments]    ${email}

    ${user}        Select Student Where Email    ${email}

    ${query}       Set Variable
    ...            DELETE FROM public.enrollments WHERE student_id = '${user}[0]';

    Execute Sql String    ${query}

Delete Student By Email
    [Arguments]    ${email}
    
    ${query}       Set Variable
    ...            DELETE FROM "public"."students" WHERE email = '${email}'

    Execute Sql String    ${query}


Delete Help Orders Without Answer
    
    ${query}       Set Variable
    ...            DELETE FROM "public"."help_orders";

    Execute Sql String    ${query}

    


# Helpers

Reset Student
    [Arguments]    ${email}
    
    Connect To Postgres

    Delete Student By Email    ${email}
    Disconnect From Database
    Sleep    10

Clear Help and Reset Student

    [Arguments]    ${email}

    Connect To Postgres
    Delete Help Orders Without Answer
    Delete Student By Email    ${email}
    Disconnect From Database
    Sleep    10