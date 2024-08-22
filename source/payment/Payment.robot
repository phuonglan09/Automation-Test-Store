*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://automationteststore.com/
${User_name}      vohuutai.001
${pass}           vohuutai.001

*** Test Cases ***
Payment success
    open page
    ${pro_name}=    get text    //a[@class='prdocutname' and @title='Skinsheen Bronzer Stick']
    ${price_productname}=    get text    //div[@class='thumbnail']//div[@class='oneprice']
    click element    //div[@class='thumbnail']//a[@class='productcart' and @title='Add to Cart']
    click element    //a[@class='top menu_checkout' and contains(.//span, 'Checkout')]
    sleep    2
    ${pro_name_2}=    get text    //table[@class='table confirm_products']//td[a[contains(@class, 'checkout_heading')]]
    ${price_2}=    get text    //table[@class='table confirm_products']//td[text()='$29.50']
    Page Should Contain    ${pro_name_2}    ${pro_name}
    should be equal    ${price_2}    ${price_productname}
    click button    //button[@id='checkout_btn']
    sleep    5
    ${txt}=    get text    //span[@class='maintext']
    log    ${txt}
    should be equal    ${txt}    YOUR ORDER HAS BEEN PROCESSED!
    close browser

check Payment success
    open page
    ${pro_name}=    get text    //a[@class='prdocutname' and @title='Skinsheen Bronzer Stick']
    ${price_productname}=    get text    //div[@class='thumbnail']//div[@class='oneprice']
    click element    //div[@class='thumbnail']//a[@class='productcart' and @title='Add to Cart']
    click element    //a[@class='top menu_checkout' and contains(.//span, 'Checkout')]
    sleep    2
    ${pro_name_2}=    get text    //table[@class='table confirm_products']//td[a[contains(@class, 'checkout_heading')]]
    ${price_2}=    get text    //table[@class='table confirm_products']//td[text()='$29.50']
    Page Should Contain    ${pro_name_2}    ${pro_name}
    should be equal    ${price_2}    ${price_productname}
    click button    //button[@id='checkout_btn']
    sleep    5
    ${txt}=    get text    //span[@class='maintext']
    log    ${txt}
    should be equal    ${txt}    YOUR ORDER HAS BEEN PROCESSED!
    click element    //div[@id='maincontainer']//a[text()='invoice page'] \ \
    sleep    2
    ${txt_1}=    get text    xpath=//td[b[contains(text(),'Order ID')]]
    log    ${txt_1}

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
    click element    //a[@class='logo' and @href='https://automationteststore.com/']
    sleep    2
    Scroll Element Into View    //a[@class='prdocutname']
    sleep    3
