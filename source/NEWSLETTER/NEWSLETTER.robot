*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
send NEWSLETTER
    open browser    https://automationteststore.com/    Chrome
    sleep    2
    Scroll Element Into View    //input[@id='appendedInputButton']
    sleep    3
    input text    id=appendedInputButton    pme59121212776@romog.com
    click button    //button[text()='Subscribe']
    sleep    2
    input text    id=SubscriberFrm_firstname    Tai
    input text    id=SubscriberFrm_lastname    Vo
    sleep    10
    click button    //button[@title='Continue']
    ${var_1}    get text    //p[text()='Success: Your newsletter subscription has been successfully created!']
    should be equal    ${var_1}    Success: Your newsletter subscription has been successfully created!
    close browser

send NEWSLETTER no firt name
    open browser    https://automationteststore.com/    Chrome
    sleep    2
    Scroll Element Into View    //input[@id='appendedInputButton']
    sleep    3
    input text    id=appendedInputButton    pme59776@romog.com
    click button    //button[text()='Subscribe']
    sleep    2
    input text    id=SubscriberFrm_lastname    Vo
    sleep    10
    click button    //button[@title='Continue']
    ${var_1}    get text    //span[text()='First Name must be between 1 and 32 characters!']
    should be equal    ${var_1}    First Name must be between 1 and 32 characters!
    close browser

send NEWSLETTER no last name
    open browser    https://automationteststore.com/    Chrome
    sleep    2
    Scroll Element Into View    //input[@id='appendedInputButton']
    sleep    3
    input text    id=appendedInputButton    pme59776@romog.com
    click button    //button[text()='Subscribe']
    sleep    2
    input text    id=SubscriberFrm_firstname    Vo
    sleep    10
    click button    //button[@title='Continue']
    ${var_1}    get text    //span[text()='Last Name must be between 1 and 32 characters!']
    should be equal    ${var_1}    Last Name must be between 1 and 32 characters!
    close browser
