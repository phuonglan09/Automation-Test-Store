*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://automationteststore.com/

*** Test Cases ***
Register_Success
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    moa26680@ilebi.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    testtk.1
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    sleep    2


    ${confirmation_message}=    Get text    xpath=//h1[@class='heading1']//span[@class='maintext']
    Should Be Equal As Strings    YOUR ACCOUNT HAS BEEN CREATED!    ${confirmation_message}
    Close browser

Register_Exist_User
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    iav25122214@fosiq.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    JonyDang.06
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    sleep    5
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    This login name is not available. Try different login name!
    Close browser

Register_Exist_Email
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    mqc70564@fosiq.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    jony.dang.011112
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    sleep    5
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Error: E-Mail Address is already registered!
    Close browser

Register_No Input First Name
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=lastname    Dang
    input text    name=email    iav25142@fosiq.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    JonyDang.07
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    sleep    5
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    First Name must be between 1 and 32 characters!
    Close browser

Register_No Input Last Name
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Dang
    input text    name=email    iav25142@fosiq.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    JonyDang.07
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    sleep    5
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Last Name must be between 1 and 32 characters!
    Close browser

Register_No Input Email
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Dang
    input text    name=lastname    Dang
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    JonyDang.07
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    sleep    5
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Email Address does not appear to be valid!
    Close browser

Register_No Input Telephone
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    uin77094@fosiq.com
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    testtk.2
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    sleep    2


    ${confirmation_message}=    Get text    xpath=//h1[@class='heading1']//span[@class='maintext']
    Should Be Equal As Strings    YOUR ACCOUNT HAS BEEN CREATED!    ${confirmation_message}
    Should Be Equal As Strings    YOUR ACCOUNT HAS BEEN CREATED!    ${confirmation_message}
    close browser

Register_No Input Fax
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    zel72964@fosiq.com
    input text    name=telephone    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    testtk.3
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    sleep    2


    ${confirmation_message}=    Get text    xpath=//h1[@class='heading1']//span[@class='maintext']
    Should Be Equal As Strings    YOUR ACCOUNT HAS BEEN CREATED!    ${confirmation_message}
    Close browser

Register_No Input Company
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    fvm72947@ilebi.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    testtk.4
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    sleep    2


    ${confirmation_message}=    Get text    xpath=//h1[@class='heading1']//span[@class='maintext']
    Should Be Equal As Strings    YOUR ACCOUNT HAS BEEN CREATED!    ${confirmation_message}
    Close browser

Register_No Input adress 1
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    nqi6537123123123.1233@vogco.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    JonyDang.20
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Address 1 must be between 3 and 128 characters!
    Close browser

Register_No Input adress 2
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    zrl93871@romog.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    testtk.5
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    sleep    2


    ${confirmation_message}=    Get text    xpath=//h1[@class='heading1']//span[@class='maintext']
    Should Be Equal As Strings    YOUR ACCOUNT HAS BEEN CREATED!    ${confirmation_message}
    Close browser

Register_No Input Country
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    h12ud54416@ilebi.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    FALSE
    input text    name=postcode    50000
    input text    name=loginname    JonyDang.06.1
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Please select a country!
    sleep    3
    Close browser

Register_No Input Zip Code
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    hud5423416@ilebi.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    JonyDang.06.1
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Zip/postal code must be between 3 and 10 characters!
    sleep    3
    Close browser

Register_No region
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    hud54416@ilebi.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    3
    input text    name=postcode    50000
    input text    name=loginname    JonyDang.06.1
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Please select a region / state!
    sleep    3
    Close browser

Register_No City
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    iav25.23414@fosiq.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    JonyDang.0.123
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    City must be between 3 and 128 characters!
    sleep    3
    Close browser

Register_No Login Name
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    iav251.1212.4@fosiq.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Login name must be alphanumeric only and between 5 and 64 characters!
    sleep    3
    Close browser

Register_No Pass
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    iav251.1212.4@fosiq.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    JonyDang.06.12
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Password must be between 4 and 20 characters!
    sleep    3
    Close browser

Register_No Click Privacy Policy
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    iav251.1212.4@fosiq.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    JonyDang.06.22
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Error: You must agree to the Privacy Policy!
    sleep    3
    Close browser

Register_Password confirmation does not match password!
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    iav251.1212.4@fosiq.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    JonyDang.06.12
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.122
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Password confirmation does not match password!
    sleep    3
    Close browser

Register_input Login Name > 64 cha
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    iav251.1212.4@fosiq.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    zxczxcklzjxckljzlkxcjaifujaiosdujoiaujsdiouasioduaiosduaiosudioasud234
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Login name must be alphanumeric only and between 5 and 64 characters!
    sleep    3
    Close browser

Register_Input Pass > 20 cha
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    iav251.1212.4@fosiq.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    JonyDang.06.12
    input text    name=password    zxczxcklzjxckljzlkxcjaifujaiosdu
    input text    name=confirm    zxczxcklzjxckljzlkxcjaifujaiosdu
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Password must be between 4 and 20 characters!
    sleep    3
    Close browser

Register_inpit City > 128 cha
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    iav25.23414@fosiq.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    zxczxcklzjxckljzlkxcjaifujaiosduasdkjklasdjlkasjdlkajsdlkajslkdjalksjdlkaxcjlzxncmalsjkdfhazjxkcljaslkdj39asdklfjlaksdjfkljadlkjasdkj
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    JonyDang.0.123
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    City must be between 3 and 128 characters!
    sleep    3
    Close browser

Register Input Zip Code > 10 cha
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    iav25112.23.1324@fosiq.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000000000000000zxczxc
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    JonyDang.0.66.1
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Zip/postal code must be between 3 and 10 characters!
    sleep    3
    Close browser

Register Input adress 1 > 128 cha
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    iav2234.2514@fosiq.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    zxczxcklzjxckljzlkxcjaifujaiosduasdkjklasdjlkasjdlkajsdlkajslkdjalksjdlkaxcjlzxncmalsjkdfhazjxkcljaslkdj39asdklfjlaksdjfkljadlkjasdkj
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    JonyDang.20
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Address 1 must be between 3 and 128 characters!
    Close browser

Register_ Input Email no valid
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=email    iav25142
    input text    name=firstname    Dang
    input text    name=lastname    Dang
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    JonyDang.07
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    sleep    5
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Email Address does not appear to be valid!
    Close browser

Register_ Input Last Name > 32 cha
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=lastname    ashjfkljjkcjaklsdfklcmnlaaklsdlkasdjlaksdjklasd
    input text    name=firstname    Dang
    input text    name=email    iav25142@fosiq.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    JonyDang.07
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    sleep    5
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Last Name must be between 1 and 32 characters!
    Close browser

Register_Input First Name > 32 cha
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    ashjfkljjkcjaklsdfklcmnlaaklsdlkasdjlaksdjklasd
    input text    name=lastname    Dang
    input text    name=email    iav25142@fosiq.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    JonyDang.07
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter1"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    sleep    5
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    First Name must be between 1 and 32 characters!
    Close browser

Register_Click No Newsletter
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=email    saj15795@romog.com
    input text    name=telephone    +84928828446
    input text    name=fax    +84928828446
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    input text    name=loginname    testtk.6
    input text    name=password    JonyDang.1
    input text    name=confirm    JonyDang.1
    Click element    //*[@id="AccountFrm_newsletter0"]
    Click element    //*[@id="AccountFrm_agree"]
    Click element    //*[@class="btn btn-orange pull-right lock-on-click"]
    sleep    2


    ${confirmation_message}=    Get text    xpath=//h1[@class='heading1']//span[@class='maintext']
    Should Be Equal As Strings    YOUR ACCOUNT HAS BEEN CREATED!    ${confirmation_message}
    Close browser

Verify hover continue in register
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    Scroll Element Into View    //*[@class="btn btn-orange pull-right lock-on-click"]
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector('.btn.btn-orange.pull-right.lock-on-click')).backgroundColor
    Mouse Over    //*[@class="btn btn-orange pull-right lock-on-click"]
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector('.btn.btn-orange.pull-right.lock-on-click')).backgroundColor
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    sleep    3
    Close browser

Verify hover privacy policy in register
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    Scroll Element Into View    //*[@class="btn btn-orange pull-right lock-on-click"]
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector('label.col-md-6 a')).color
    sleep    2
    Mouse Over    xpath=//label[contains(@class, 'col-md-6')]/a[contains(text(), 'Privacy Policy')]
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector('label.col-md-6 a')).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    sleep    3
    Close browser

Verify hover login page in register
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    3
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector('a[href="https://automationteststore.com/index.php?rt=account/login"]')).color;
    sleep    2
    Mouse Over    //a[@href='https://automationteststore.com/index.php?rt=account/login']
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector('a[href="https://automationteststore.com/index.php?rt=account/login"]')).color;
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    Close browser

Verify link login page in register
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="accountFrm"]/fieldset/button
    sleep    2
    Click element    //a[@href='https://automationteststore.com/index.php?rt=account/login']
    Location should be    https://automationteststore.com/index.php?rt=account/login
    Close browser

Verify hover continue
    open browser    https://automationteststore.com/    Chrome
    Maximize Browser Window
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    ${color_before_hover}=    Execute JavaScript    return getComputedStyle(document.querySelector('button.btn.btn-orange.pull-right')).color
    Mouse Over    //*[@class="btn btn-orange pull-right"]
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return getComputedStyle(document.querySelector('button.btn.btn-orange.pull-right')).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    sleep    3
    Close browser
