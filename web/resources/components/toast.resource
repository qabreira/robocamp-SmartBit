*** Settings ***
Documentation                Representação do elemento toaster

Library                      Browser

*** Keywords ***
Verify Toaster
    [Arguments]              ${expected_message}

    Wait For Elements State
    ...                      css=.Toastify__toast-body div >> text=${expected_message}
    ...                      visible    5

    Sleep    2
    Take Screenshot

    Wait For Elements State
    ...                      css=.Toastify__toast-body div
    ...                      detached    10
