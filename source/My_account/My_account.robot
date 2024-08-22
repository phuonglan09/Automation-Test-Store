*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://automationteststore.com/
${User_name}      vohuutai.001
${pass}           vohuutai.001

*** Test Cases ***
Verify link edit account details
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[1]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/edit
    close browser

Verify link change password
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[2]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/password
    close browser

Verify link Manage Address Book
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[3]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address
    close browser

Verify link My wish list
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[4]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/wishlist
    close browser

Verify link order history
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[5]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/history
    close browser

Verify link Transaction history
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[6]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/transactions
    close browser

Verify link Downloads
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[7]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/download
    close browser

Verify link Notifications
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[8]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/notification
    close browser

Verify hover edit account details
    open page
    sleep    2
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("ul.nav-dash > li:nth-of-type(1) > a")).color
    Mouse Over    //ul[@class='nav-dash']/li[1]/a
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("ul.nav-dash > li:nth-of-type(1) > a")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    close browser








Verify hover Change password
    open page
    sleep    2
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("ul.nav-dash > li:nth-of-type(2) > a")).color
    Mouse Over    //ul[@class='nav-dash']/li[2]/a
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("ul.nav-dash > li:nth-of-type(2) > a")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    close browser








Verify hover Manage Address Book
    open page
    sleep    2
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("ul.nav-dash > li:nth-of-type(3) > a")).color
    Mouse Over    //ul[@class='nav-dash']/li[3]/a
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("ul.nav-dash > li:nth-of-type(3) > a")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    close browser








Verify hover My wish list
    open page
    sleep    2
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("ul.nav-dash > li:nth-of-type(4) > a")).color
    Mouse Over    //ul[@class='nav-dash']/li[4]/a
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("ul.nav-dash > li:nth-of-type(4) > a")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    close browser








Verify hover Order history
    open page
    sleep    2
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("ul.nav-dash > li:nth-of-type(5) > a")).color
    Mouse Over    //ul[@class='nav-dash']/li[5]/a
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("ul.nav-dash > li:nth-of-type(5) > a")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    close browser








Verify hover Transaction
    open page
    sleep    2
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("ul.nav-dash > li:nth-of-type(6) > a")).color
    Mouse Over    //ul[@class='nav-dash']/li[6]/a
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("ul.nav-dash > li:nth-of-type(6) > a")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    close browser








Verify hover Downloads
    open page
    sleep    2
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("ul.nav-dash > li:nth-of-type(7) > a")).color
    Mouse Over    //ul[@class='nav-dash']/li[7]/a
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("ul.nav-dash > li:nth-of-type(7) > a")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    close browser








Verify hover Notifications
    open page
    sleep    2
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("ul.nav-dash > li:nth-of-type(8) > a")).color
    Mouse Over    //ul[@class='nav-dash']/li[8]/a
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("ul.nav-dash > li:nth-of-type(8) > a")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    close browser








Verify link Manage Address Book number2
    open page
    sleep    2
    click element    //div[@class='dash-tiles row']/div[1]//i[@class='fa fa-cog']
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address
    close browser

Verify link order history number2
    open page
    sleep    2
    click element    //div[@class='dash-tiles row']/div[2]//i[@class='fa fa-cog']
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/history
    close browser

Verify link Downloads number2
    open page
    sleep    2
    click element    //div[@class='dash-tiles row']/div[3]//i[@class='fa fa-cog']
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/download
    close browser

Verify link Transaction history number2
    open page
    sleep    2
    click element    //div[@class='dash-tiles row']/div[4]//i[@class='fa fa-cog']
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/transactions
    close browser

Verify link My wish list in col my account
    Open page
    sleep    2
    Execute JavaScript    document.querySelector('a[href="https://automationteststore.com/index.php?rt=account/wishlist"]').click()
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/wishlist
    close browser

Verify link edit account details in col my account
    Open page
    sleep    2
    Execute JavaScript    document.querySelector('a[href="https://automationteststore.com/index.php?rt=account/edit"]').click()
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/edit
    close browser

Verify link change pass in col my account
    Open page
    sleep    2
    Execute JavaScript    document.querySelector('a[href="https://automationteststore.com/index.php?rt=account/password"]').click()
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/password
    close browser

Verify link manage address book in col my account
    Open page
    sleep    2
    Execute JavaScript    document.querySelector('a[href="https://automationteststore.com/index.php?rt=account/address"]').click()
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address
    close browser

Verify link order history in col my account
    Open page
    sleep    2
    Execute JavaScript    document.querySelector('a[href="https://automationteststore.com/index.php?rt=account/history"]').click()
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/history
    close browser

Verify link transaction history in col my account
    Open page
    sleep    2
    Execute JavaScript    document.querySelector('a[href="https://automationteststore.com/index.php?rt=account/transactions"]').click()
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/transactions
    close browser

Verify link download in col my account
    Open page
    sleep    2
    Execute JavaScript    document.querySelector('a[href="https://automationteststore.com/index.php?rt=account/download"]').click()
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/download
    close browser

Verify link notification in col my account
    Open page
    sleep    2
    Execute JavaScript    document.querySelector('a[href="https://automationteststore.com/index.php?rt=account/notification"]').click()
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/notification
    close browser

Verify link My wish list in menu
    Open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/wishlist']").click();
    Sleep    2
    Location Should Be    https://automationteststore.com/index.php?rt=account/wishlist
    Close Browser

Verify link Edit account details in menu
    Open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/edit']").click();
    Sleep    2
    Location Should Be    https://automationteststore.com/index.php?rt=account/edit
    Close Browser

Verify link Change password in menu
    Open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/password']").click();
    Sleep    2
    Location Should Be    https://automationteststore.com/index.php?rt=account/password
    Close Browser

Verify link Manage Address Book in menu
    Open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/address']").click();
    Sleep    2
    Location Should Be    https://automationteststore.com/index.php?rt=account/address
    Close Browser

Verify link Order history in menu
    Open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/history']").click();
    Sleep    2
    Location Should Be    https://automationteststore.com/index.php?rt=account/history
    Close Browser

Verify link Transaction history in menu
    Open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/transactions']").click();
    Sleep    2
    Location Should Be    https://automationteststore.com/index.php?rt=account/transactions
    Close Browser

Verify link Downloads in menu
    Open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/download']").click();
    Sleep    2
    Location Should Be    https://automationteststore.com/index.php?rt=account/download
    Close Browser

Verify link Notifications in menu
    Open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/notification']").click();
    Sleep    2
    Location Should Be    https://automationteststore.com/index.php?rt=account/notification
    Close Browser

Verify hover edit account details in menu
    open page

    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/edit'] i")).color
    Mouse Over    //ul[@id='customer_menu_top']//a[contains(text(), 'Edit account details')]
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/edit'] i")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    close browser





Verify hover Change password in menu
    open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/password'] i")).color
    Mouse Over    //ul[@id='customer_menu_top']//a[contains(text(), 'Change password')]
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/password'] i")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    close browser






Verify hover My wish list in menu
    open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/wishlist'] i")).color
    Mouse Over    //ul[@id='customer_menu_top']//a[contains(text(), 'My wish list')]
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/wishlist'] i")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    close browser






Verify hover Order history in menu
    open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/history'] i")).color
    Mouse Over    //ul[@id='customer_menu_top']//a[contains(text(), 'Order history')]
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/history'] i")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    close browser






Verify hover Transaction in menu
    open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/transactions'] i")).color
    Mouse Over    //ul[@id='customer_menu_top']//a[contains(text(), 'Transaction history')]
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/transactions'] i")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    close browser






Verify hover Downloads in menu
    open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/download'] i")).color
    Mouse Over    //ul[@id='customer_menu_top']//a[contains(text(), 'Downloads')]
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/download'] i")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    close browser






Verify hover Notifications in menu
    open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/notification'] i")).color
    Mouse Over    //ul[@id='customer_menu_top']//a[contains(text(), 'Notifications')]
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/notification'] i")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    close browser






Verify hover Manage Address Book in menu
    open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/address'] i")).color
    Mouse Over    //ul[@id='customer_menu_top']//a[contains(text(), 'Manage Address Book')]
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/address'] i")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
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
    Location Should Be    https://automationteststore.com/index.php?rt=account/account

