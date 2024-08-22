*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL_FB}         https://www.facebook.com
${twitter}        https://twitter.com
${linkedin}       https://uk.linkedin.com/

*** Test Cases ***
Open fb
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    click element    //a[@title='Facebook' and @class='facebook']

    Switch Window    NEW
    Wait Until Page Contains    ${URL_FB}    timeout=10s
    location should contain    ${URL_FB}
    close browser

Open twitter
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    click element    //a[@title='Twitter' and @class='twitter']

    Switch Window    NEW
    Wait Until Page Contains    ${twitter}    timeout=10s
    location should contain    ${twitter}
    close browser

Open linkedin
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    click element    //a[@title='Linkedin' and @class='linkedin']
    sleep    2


    location should contain    ${linkedin}
    close browser
