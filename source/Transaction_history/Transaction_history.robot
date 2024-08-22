*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://automationteststore.com/
${User_name}      vohuutai.001
${pass}           vohuutai.001

*** Test Cases ***
Check transaction history
    open page
    ${var_1}=    get text    //div[@class='dash-tile-text' and text()='$0.00']
    click element    //ul[@class='nav-dash']/li[6]/a
    sleep    2
    ${var_2}=    get text    //td/span[@class='bold totalamout' and normalize-space(text())='$0.00']
    should be equal    ${var_1}    ${var_2}

Check transaction at my account
    open page
    ${var_1}=    get text    //div[@class='dash-tile-text' and text()='$0.00']
    ${var_2}=    get text    //span[@class='badge badge-success' and normalize-space(text())='$0.00']
    should be equal    ${var_1}    ${var_2}



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
