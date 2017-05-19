*** Settings ***
Resource    resources/share.robot
Suite Setup    Open browser to open google.com
Suite Teardown    Close Browser

*** Testcases ***
Search not found rule
    [Template]    Search workflow
    #-------------------------------------------
    #  keyword    |    expected result  |
    #-------------------------------------------
        pythonx          not found
        robotx             not found
        somkiatx         not found