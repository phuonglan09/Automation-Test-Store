*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://automationteststore.com/
${User_name}      vohuutai.001
${pass}           vohuutai.001

*** Test Cases ***
Logout 1 in account success
    Open page
    sleep    2
    click element    //li/a[@href='https://automationteststore.com/index.php?rt=account/logout' and @data-original-title='Logoff']/i[@class='fa fa-unlock']
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/logout
    close browser

Logout 2 in account success
    Open page
    sleep    2
    Execute JavaScript    document.evaluate("//a[contains(text(),'Logoff')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/logout
    close browser

Logout 3 in menu success
    Open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/logout']").click();
    Sleep    2
    Location Should Be    https://automationteststore.com/index.php?rt=account/logout
    Close Browser

hover button logout
    open page
    sleep    2
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[data-original-title='Logoff'] i")).color
    Mouse Over    xpath=//a[@data-original-title='Logoff']
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[data-original-title='Logoff'] i")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    close browser

hover Logout 3 in menu
    Open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/logout'] i")).color
    Mouse Over    //ul[@id='customer_menu_top']//a[contains(text(), 'Not TAI? Logoff')]
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/logout'] i")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    close browser

hover Logout 2 in account
    Open page
    sleep    2


    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/logout'] i")).color
    Mouse Over    //div[@class='column_right col-md-3 col-xs-12 mt20']//a[contains(text(), 'Logoff')]
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/logout'] i")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}

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
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
