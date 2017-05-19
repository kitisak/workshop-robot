Library    Selenium2Library

*** Variables ***
${BASEURL}     http://www.google.com
${BROWSER}    gc

*** Keywords ***
Search workflow
    [Arguments]    ${search keyword}    ${expected result}
    Fill in data    ${search keyword}
    Press Enter
    Found in result page    ${expected result}
    Go To    ${BASEURL}

Found in result page
    [Arguments]    ${expected result}
    Wait Until Page Contains    ${expected result}

Press Enter
    Press Key    name=q    \\13

Fill in data
    [Arguments]    ${search keyword}
    Input Text    name=q    ${search keyword}

Open browser to open google.com
    Open Browser    ${BASEURL}    browser=${BROWSER}
