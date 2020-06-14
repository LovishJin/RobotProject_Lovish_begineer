*** Settings ***
Suite Setup       Log To Console    Test suite started
Suite Teardown    Log To Console    Test suite completed
Library           SeleniumLibrary

*** Variables ***
${url}            https://opensource-demo.orangehrmlive.com/    # url of website
${name}           Lovish
@{CREDENTIALS}    Admin    admin123    # Credntials
&{LOGIN}          username=Admin    password=admin123

*** Test Cases ***
TC1
    [Tags]    TC1
    Open Browser    ${url}    gc
    Input Text    id=txtUsername    ${CREDENTIALS}[0]
    Input Text    id=txtPassword    &{LOGIN}[password]
    Click Button    name=Submit
    Close Browser
    Log To Console    %{username} is working on %{os}

TC2
    [Tags]    TC2
    [Setup]    Log To Console    TC2 stRTED
    Open Browser    ${url}    gc
    Login
    Close Browser
    Set Tags    smoketest
    [Teardown]    Log To Console    TC2 finished

*** Keywords ***
Login
    Input Text     id=txtUsername    ${CREDENTIALS}[0]
    Input Password    id=txtPassword    &{LOGIN}[password]
    Click Button    name=Submit
