*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://automationteststore.com/
${User_name}      vohuutai.001
${pass}           vohuutai.001

*** Test Cases ***
Change add success
    open page
    click element    //ul[@class='nav-dash']/li[3]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address
    click element    //button[contains(@onclick, 'account/address/update')]
    sleep    2
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    click element    //button[contains(@class, 'btn-orange') and contains(@class, 'pull-right')]
    Element Should Be Visible    //*[@class="alert alert-success"]
    ${error_message}=    Get Text    //*[@class="alert alert-success"]
    Should Contain    ${error_message}    Your address has been successfully updated
    Close browser

Change add clear first name
    open page
    click element    //ul[@class='nav-dash']/li[3]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address
    click element    //button[contains(@onclick, 'account/address/update')]
    sleep    2
    Clear Element Text    name=firstname
    input text    name=lastname    Dang
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    click element    //button[contains(@class, 'btn-orange') and contains(@class, 'pull-right')]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    ${error_message}=    Get Text    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'First Name must be between 1 and 32 characters!')]
    Should Contain    ${error_message}    First Name must be between 1 and 32 characters!

Change add clear last name
    open page
    click element    //ul[@class='nav-dash']/li[3]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address
    click element    //button[contains(@onclick, 'account/address/update')]
    sleep    2
    input text    name=firstname    Jony
    Clear Element Text    name=lastname
    input text    name=company    TDTU
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    click element    //button[contains(@class, 'btn-orange') and contains(@class, 'pull-right')]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    ${error_message}=    Get Text    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Last Name must be between 1 and 32 characters!')]
    Should Contain    ${error_message}    Last Name must be between 1 and 32 characters!

    Close browser

Change add clear Company
    open page
    click element    //ul[@class='nav-dash']/li[3]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address
    click element    //button[contains(@onclick, 'account/address/update')]
    sleep    2
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    Clear Element Text    name=company
    input text    name=address_1    1 Nguyen Huu Tho
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    click element    //button[contains(@class, 'btn-orange') and contains(@class, 'pull-right')]
    Element Should Be Visible    //*[@class="alert alert-success"]
    ${error_message}=    Get Text    //*[@class="alert alert-success"]
    Should Contain    ${error_message}    Your address has been successfully updated
    Close browser

Change add clear Address 1
    open page
    click element    //ul[@class='nav-dash']/li[3]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address
    click element    //button[contains(@onclick, 'account/address/update')]
    sleep    2
    input text    name=firstname    Tai
    input text    name=lastname    Dang
    input text    name=company    TDTU
    Clear Element Text    name=address_1
    input text    name=address_2    1 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    click element    //button[contains(@class, 'btn-orange') and contains(@class, 'pull-right')]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    ${error_message}=    Get Text    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Address must be between 3 and 128 characters!')]
    Should Contain    ${error_message}    Address must be between 3 and 128 characters!

Change add clear address2
    open page
    click element    //ul[@class='nav-dash']/li[3]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address
    click element    //button[contains(@onclick, 'account/address/update')]
    sleep    2
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=company    TDT
    input text    name=address_1    1 Nguyen Huu Tho
    Clear Element Text    name=address_2
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    click element    //button[contains(@class, 'btn-orange') and contains(@class, 'pull-right')]
    Element Should Be Visible    //*[@class="alert alert-success"]
    ${error_message}=    Get Text    //*[@class="alert alert-success"]
    Should Contain    ${error_message}    Your address has been successfully updated
    Close browser

Change add clear Country
    open page
    click element    //ul[@class='nav-dash']/li[3]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address
    click element    //button[contains(@onclick, 'account/address/update')]
    sleep    2
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=company    TDT
    input text    name=address_1    1 Nguyen Huu Tho
    Clear Element Text    name=address_2
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    FALSE
    sleep    2
    input text    name=postcode    50000

    click element    //button[contains(@class, 'btn-orange') and contains(@class, 'pull-right')]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    ${error_message}=    Get Text    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Please select a country!')]
    Should Contain    ${error_message}    Please select a country!

Change add clear Region / State
    open page
    click element    //ul[@class='nav-dash']/li[3]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address
    click element    //button[contains(@onclick, 'account/address/update')]
    sleep    2
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=company    TDT
    input text    name=address_1    1 Nguyen Huu Tho
    Clear Element Text    name=address_2
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    zone_id    FALSE
    click element    //button[contains(@class, 'btn-orange') and contains(@class, 'pull-right')]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    ${error_message}=    Get Text    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Please select a region / state!')]
    Should Contain    ${error_message}    Please select a region / state!

Change add clear ZIP/Post Code
    open page
    click element    //ul[@class='nav-dash']/li[3]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address
    click element    //button[contains(@onclick, 'account/address/update')]
    sleep    2
    input text    name=firstname    Jony
    input text    name=lastname    Dang
    input text    name=company    TDT
    input text    name=address_1    1 Nguyen Huu Tho
    Clear Element Text    name=address_2
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    Clear Element Text    name=postcode
    Select From List By Value    zone_id    3780
    click element    //button[contains(@class, 'btn-orange') and contains(@class, 'pull-right')]
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    ${error_message}=    Get Text    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Zip/postal code must be between 2 and 10 characters!')]
    Should Contain    ${error_message}    Zip/postal code must be between 2 and 10 characters!

verify button back
    open page
    click element    //ul[@class='nav-dash']/li[3]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address
    click element    //button[contains(@onclick, 'account/address/update')]
    sleep    2
    click element    //a[@title='Back']
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address














verify button new address
    open page
    click element    //ul[@class='nav-dash']/li[3]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address
    click element    //a[@title='New Address']
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address/insert
















verify button new address -> add address new
    open page
    click element    //ul[@class='nav-dash']/li[3]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address


    click element    //a[@title='New Address']
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address/insert
    sleep    2
    input text    name=firstname    Vo
    input text    name=lastname    Tai
    input text    name=company    TDTU
    input text    name=address_1    2 Nguyen Huu Tho
    input text    name=address_2    2 Nguyen Dinh Chieu
    input text    name=city    Ho Chi Minh
    Select From List By Value    name=country_id    230
    sleep    2
    input text    name=postcode    50000
    Select From List By Value    name=zone_id    3780
    click element    //button[contains(@class, 'btn-orange') and contains(@class, 'pull-right')]
    Element Should Be Visible    //*[@class="alert alert-success"]
    ${error_message}=    Get Text    //*[@class="alert alert-success"]
    Should Contain    ${error_message}    Your address has been successfully inserted
    Close browser

verify delete address 2
    open page
    click element    //ul[@class='nav-dash']/li[3]/a
    sleep    2
    location should be    https://automationteststore.com/index.php?rt=account/address
    sleep    2
    click element    //button[@title='Delete']
    Element Should Be Visible    //*[@class="alert alert-success"]
    ${error_message}=    Get Text    //*[@class="alert alert-success"]
    Should Contain    ${error_message}    Your address has been successfully deleted
    Close browser
















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
