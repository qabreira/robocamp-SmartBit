*** Settings ***
Documentation            Consumindo a rota enrolments da API REST.

Library                  RequestsLibrary
Resource                 ../base.resource
Library                  DateTime

# {"start_date":"2022-12-14T03:00:00.000Z","plan_id":1,"student_id":19}

*** Keywords ***
POST New Enroll
    [Arguments]     ${token}    ${student_id}

    ${headers}      Create Dictionary    Authorization=${token}

    ${start_date}   Get Current Date

    ${enroll}       Create Dictionary
    ...             start_date=${start_date}
    ...             plan_id=1
    ...             student_id=${student_id}

    ${response}     POST               http://localhost:3333/enrollments
    ...                                json=${enroll}
    ...                                headers=${headers}
    ...                                expected_status=201