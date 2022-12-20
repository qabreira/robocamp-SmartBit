*** Settings ***
Documentation                O início de tudo

Resource                     ./components/navbar.resource
Resource                     ./components/toast.resource
Resource                     ./components/notifications.resource
Resource                     ./pages/enroll.resource
Resource                     ./pages/login.resource
Resource                     ./database.resource
Resource                     ./services/sessions.resource
Resource                     ./services/students.resource
Library                      JSONLibrary

*** Keywords ***
# Helpers
Do Login
    [Arguments]        &{user}
    Go To Login Page
    Fill Credentials            ${user.email}    ${user.password}
    Submit Credentials
    User Should Be Logged In    ${user.name}

Get Fixture
    [Arguments]        ${file_fixture}

    ${fixture}               Load Json From File
    ...                      ${EXECDIR}/web/resources/fixtures/${file_fixture}.json
    ...                      encoding=UTF-8

    [Return]                 ${fixture}