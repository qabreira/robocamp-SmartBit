*** Settings ***
Documentation                O início de tudo

Resource                     ./components/navbar.resource
Resource                     ./components/toast.resource
Resource                     ./pages/enroll.resource
Resource                     ./pages/login.resource

*** Keywords ***
# Helpers
Do Login
    [Arguments]        ${user}
    Go To Login Page
    Fill Credentials            ${user}[email]    ${user}[pass]
    Submit Credentials
    User Should Be Logged In    ${user}[name]