*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://automationteststore.com/
${User_name}      vohuutai.001
${pass}           vohuutai.001

*** Test Cases ***
Check Downloads at my account
    open page
    ${var_1}=    get text    //div[@class='dash-tile-text' and normalize-space(text())='0']
    ${var_2}=    get text    //span[@class='badge badge-success' and normalize-space(text())='0']
    should be equal    ${var_1}    ${var_2}

verify button continue
    open page
    click element    //ul[@class='nav-dash']/li[7]/a
    sleep    2
    click element    //div[@class='contentpanel']//a[@title='Continue']
    location should be    https://automationteststore.com/index.php?rt=account/account

*** Keywords ***
Open Page
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Sleep    3
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    input text    id=loginFrm_loginname    ${User_name}
    input text    id=loginFrm_password    ${pass}
    click element    //*[@id="loginFrm"]/fieldset/button
    Sleep    3
