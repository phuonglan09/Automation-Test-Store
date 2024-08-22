*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://automationteststore.com/
${User_name}      vohuutai.001
${pass}           vohuutai.001

*** Test Cases ***
Check order history
    open page
    ${quantity}=    get text    //div[@class='dash-tile dash-tile-flower clearfix']/div[@class='dash-tile-text']
    ${quantity_as_number}=    Convert To Number    ${quantity}
    Execute JavaScript    document.querySelector('a[href="https://automationteststore.com/index.php?rt=account/history"]').click()
    ${count}=    Get Element Count    //div[@class='container-fluid mt20']
    ${count}=    Convert To Number    ${count}
    Should be true    ${count}==${quantity_as_number}
    close browser

Check order history at button
    open page
    ${quantity}=    get text    //a[@data-original-title='Order history']/span[@class='badge badge-success']
    ${quantity_as_number}=    Convert To Number    ${quantity}
    Execute JavaScript    document.querySelector('a[href="https://automationteststore.com/index.php?rt=account/history"]').click()
    ${count}=    Get Element Count    //div[@class='container-fluid mt20']
    ${count}=    Convert To Number    ${count}
    Should be true    ${count}==${quantity_as_number}
    close browser

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
