*** Settings ***

Documentation        Arquivo principal

Library              AppiumLibrary
Library              JSONLibrary

Resource             ./screens/login.resource
Resource             ./screens/components/popup.resource
Resource             ./screens/components/footer.resource
Resource             ./screens/help.resource

Resource             services/sessions.resource
Resource             services/students.resource
Resource             services/enrollments.resource

Resource             database.resource

*** Keywords ***

Start app

    Open Application
    ...    http://localhost:4723/wd/hub
    ...    alias=Smartbit
    ...    automationName=UiAutomator2
    ...    platformName=Android
    ...    deviceName=Android Simulator
    ...    app=${EXECDIR}/mobile/app/smartbit-beta.apk
    ...    udid=emulator-5554
    ...    autoGrantPermissions=true

    Wait Until Page Contains    Informe seu código de acesso


Finish app

    Capture Page Screenshot
    Close Application


# Helpers

Get Fixture
    [Arguments]    ${fixture_file}

    ${fixture}     Load Json From File
    ...            ${EXECDIR}/mobile/resources/fixtures/${fixture_file}.json
    ...            encoding=UTF-8

    [Return]       ${fixture}