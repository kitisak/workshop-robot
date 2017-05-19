*** Settings ***
Library    Selenium2Library
Library    Screenshot


*** Testcases ***
Fail with invalid email address
    Open register page
    Fill in personal information
    Fill in email
    Fill in password
    Choose birthday
    Choose gender
    Create account
    Should show error message

*** Keyword ***
Should show error message
    Wait Until Element Is Visible    id=reg_error_inner
    ${text}=    Get Text   id=reg_error_inner
    Log    ${text}
    Should Be Equal     ${text}    xxxx
    Should Contain    ${text}    เหมือนว่าคุณอาจป้อนที่อยู่อีเมลที่ไม่ถูกต้อง โปรดแก้ไข จากนั้นคลิกเพื่อดำเนินการต่อ
    Take Screenshot

    # Wait Until Element Contains    id=reg_error_inner    ดูเหมือนว่าคุณอาจป้อนที่อยู่อีเมลที่ไม่ถูกต้อง โปรดแก้ไข จากนั้นคลิกเพื่อดำเนินการต่อ

Create account
    Click Element   name=websubmit

Choose gender
    # Select Radio Button    sex   2
    Click Element    xpath=//*[@id="u_0_h"]
    Take Screenshot

Choose birthday
    Select From List By Value    name=birthday_day    10
    Select From List By Value    name=birthday_month    12
    Select From List By Value    name=birthday_year    1981
    Take Screenshot

Fill in password
    Input Text   name=reg_passwd__      123456
    Take Screenshot

Fill in email
    Input Text    name=reg_email__     somkiat@gmilaaa.com
    Input Text    name=reg_email_confirmation__     somkiat@gmilaaa.com
    Take Screenshot

Fill in personal information
    Input Text    name=firstname    somkiat
    Input Text    name=lastname     pui
    Take Screenshot

Open register page
    Open Browser    https://www.facebook.com/    browser=gc
    Take Screenshot
