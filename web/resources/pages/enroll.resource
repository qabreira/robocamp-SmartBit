*** Settings ***
Documentation    Representação dos elementos do Formulário de Matrícula

Library     Browser

*** Keywords ***
Go To Enrolls
    Click    css=a[href="/matriculas"]

Go To Enroll Form
    Click    css=a[href="/matriculas/new"]

Fill Enroll Student
    [Arguments]    ${student}

    Click          css=div >> text=Digite o nome do aluno...

    Fill Text      xpath=//div[contains(text(),"nome do aluno")]/..//input
    ...            ${student} 

    Click          css=div[class$="option"] >> text=${student}

Fill Enroll Plan
    [Arguments]    ${plan}

    Click          css=div >> text=Selecione...

    Click          css=div[class$="option"] >> text=${plan}

Fill Enroll Start Date
    Focus          css=input[name="start_date"]
    Keyboard Key    press    1
    Keyboard Key    press    5
    Keyboard Key    press    1
    Keyboard Key    press    1
    Keyboard Key    press    2
    Keyboard Key    press    0
    Keyboard Key    press    2
    Keyboard Key    press    2

Submit Enroll Form
    Click          css=button[type="submit"] >> text=Salvar