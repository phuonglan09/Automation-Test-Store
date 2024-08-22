*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://automationteststore.com/
${User_name}      vohuutai.001
${pass}           vohuutai.001

*** Test Cases ***
Add product at my wish list
    open page
    click element    //div[@class='navbar-header header-logo']
    sleep    2
    Scroll Element Into View    //div[@class='thumbnails list-inline']/div[@class='col-md-3 col-sm-6 col-xs-12'][1]
    click element    //a[@class='prdocutname']
    sleep    2
    Execute JavaScript    document.querySelector('a.wishlist_add.btn.btn-large').click();
    sleep    2
    ${name_product}=    get text    //h1[@class='productname']/span[@class='bgnone']
    ${price_product}=    get text    //div[@class='productfilneprice']
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    2
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/wishlist']").click();
    sleep    2
    ${name_product_1}=    get text    //td[@class='align_left']/a[contains(text(), 'Skinsheen Bronzer Stick')]
    ${price_product_1}=    get text    //td[@class='align_right']/div[@class='oneprice']
    should be equal    ${name_product}    ${name_product_1}
    should be equal    ${price_product}    ${price_product_1}
    close browser

delee product at my wish list
    open page
    click element    //div[@class='navbar-header header-logo']
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    2
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/wishlist']").click();
    sleep    2
    click element    //td[@class='align_center']/a[contains(@onclick, "wishlist_remove")]
    sleep    2
    Element Should Not Be Visible    //tr[@class='wishlist_50']
    close browser












delete my wish list in product details
    open page
    click element    //div[@class='navbar-header header-logo']
    sleep    2
    Scroll Element Into View    //div[@class='thumbnails list-inline']/div[@class='col-md-3 col-sm-6 col-xs-12'][1]
    click element    //a[@class='prdocutname']
    sleep    2
    Execute JavaScript    document.querySelector('a.wishlist_add.btn.btn-large').click();
    sleep    2
    ${name_product}=    get text    //h1[@class='productname']/span[@class='bgnone']
    ${price_product}=    get text    //div[@class='productfilneprice']
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    2
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/wishlist']").click();
    sleep    2
    ${name_product_1}=    get text    //td[@class='align_left']/a[contains(text(), 'Skinsheen Bronzer Stick')]
    ${price_product_1}=    get text    //td[@class='align_right']/div[@class='oneprice']
    should be equal    ${name_product}    ${name_product_1}
    should be equal    ${price_product}    ${price_product_1}
    click element    //div[@class='navbar-header header-logo']
    sleep    2
    Scroll Element Into View    //div[@class='thumbnails list-inline']/div[@class='col-md-3 col-sm-6 col-xs-12'][1]
    click element    //a[@class='prdocutname']
    sleep    2
    click element    //a[@class='wishlist_remove btn btn-large']
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    2
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/wishlist']").click();
    sleep    2
    Element Should Not Be Visible    //tr[@class='wishlist_50']
    close browser


Verify button conitnue Shoppig
    open page
    click element    //div[@class='navbar-header header-logo']
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    2
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/wishlist']").click();
    sleep    2
    click element    //div[@class='col-md-4 mt20 mb20']/a
    sleep    2
    Location should be    https://automationteststore.com/
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
