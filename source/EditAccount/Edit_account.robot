*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://automationteststore.com/
${User_name}      vohuutai.001
${pass}           vohuutai.001

*** Test Cases ***
Edit success in row
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[1]/a
    sleep    2
    input text    id=AccountFrm_firstname    Tài
    input text    id=AccountFrm_lastname    Võ Hữu
    input text    id=AccountFrm_email    vohuutai.001@gmail.com
    input text    id=AccountFrm_telephone    +84928828446
    input text    id=AccountFrm_fax    +84928828446
    click element    //button[@class='btn btn-orange pull-right lock-on-click' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-success"]
    ${error_message}=    Get Text    //*[@class="alert alert-success"]
    Should Contain    ${error_message}    Success: Your account has been successfully updated.
    Close browser

Edit success in col
    open page
    sleep    2
    Execute JavaScript    document.querySelector('a[href="https://automationteststore.com/index.php?rt=account/edit"]').click()
    sleep    2
    input text    id=AccountFrm_firstname    Tài
    input text    id=AccountFrm_lastname    Võ Hữu
    input text    id=AccountFrm_email    vohuutai.001@gmail.com
    input text    id=AccountFrm_telephone    +84928828446
    input text    id=AccountFrm_fax    +84928828446
    click element    //button[@class='btn btn-orange pull-right lock-on-click' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-success"]
    ${error_message}=    Get Text    //*[@class="alert alert-success"]
    Should Contain    ${error_message}    Success: Your account has been successfully updated.
    Close browser

Edit success in menu
    open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/edit']").click();
    sleep    2
    input text    id=AccountFrm_firstname    Tài
    input text    id=AccountFrm_lastname    Võ Hữu
    input text    id=AccountFrm_email    vohuutai.001@gmail.com
    input text    id=AccountFrm_telephone    +84928828446
    input text    id=AccountFrm_fax    +84928828446
    click element    //button[@class='btn btn-orange pull-right lock-on-click' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-success"]
    ${error_message}=    Get Text    //*[@class="alert alert-success"]
    Should Contain    ${error_message}    Success: Your account has been successfully updated.
    Close browser

Edit telephone in row with tele <3 charac
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[1]/a
    sleep    2
    input text    id=AccountFrm_telephone    84
    input text    id=AccountFrm_fax    +84928828446
    click element    //button[@class='btn btn-orange pull-right lock-on-click' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    Element Should Be Visible    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Telephone must be between 3 and 32 characters!')]
    ${error_message}=    Get Text    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Telephone must be between 3 and 32 characters!')]
    Should Contain    ${error_message}    Telephone must be between 3 and 32 characters!
    Close browser



Edit telephone in row with tele >32 charac
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[1]/a
    sleep    2
    input text    id=AccountFrm_telephone    +8492882844684928828446849288284468492882844684928828446849288284468492882844684928828446849288284468492882844684928828446849288284468492882844684928828446
    input text    id=AccountFrm_fax    +84928828446
    click element    //button[@class='btn btn-orange pull-right lock-on-click' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    Element Should Be Visible    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Telephone must be between 3 and 32 characters!')]
    ${error_message}=    Get Text    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Telephone must be between 3 and 32 characters!')]
    Should Contain    ${error_message}    Telephone must be between 3 and 32 characters!
    Close browser



Edit fax in row with tele <3 charac
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[1]/a
    sleep    2
    input text    id=AccountFrm_telephone    +84928828446
    input text    id=AccountFrm_fax    84
    click element    //button[@class='btn btn-orange pull-right lock-on-click' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-success"]
    ${error_message}=    Get Text    //*[@class="alert alert-success"]
    Should Contain    ${error_message}    Success: Your account has been successfully updated.
    Close browser






Edit telephone in col with tele <3 charac
    open page
    sleep    2
    Execute JavaScript    document.querySelector('a[href="https://automationteststore.com/index.php?rt=account/edit"]').click()
    sleep    2
    input text    id=AccountFrm_telephone    84
    input text    id=AccountFrm_fax    +84928828446
    click element    //button[@class='btn btn-orange pull-right lock-on-click' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    Element Should Be Visible    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Telephone must be between 3 and 32 characters!')]
    ${error_message}=    Get Text    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Telephone must be between 3 and 32 characters!')]
    Should Contain    ${error_message}    Telephone must be between 3 and 32 characters!
    Close browser



Edit telephone in col with tele >32 charac
    open page
    sleep    2
    Execute JavaScript    document.querySelector('a[href="https://automationteststore.com/index.php?rt=account/edit"]').click()
    sleep    2
    input text    id=AccountFrm_telephone    +8492882844684928828446849288284468492882844684928828446849288284468492882844684928828446849288284468492882844684928828446849288284468492882844684928828446
    input text    id=AccountFrm_fax    +84928828446
    click element    //button[@class='btn btn-orange pull-right lock-on-click' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    Element Should Be Visible    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Telephone must be between 3 and 32 characters!')]
    ${error_message}=    Get Text    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Telephone must be between 3 and 32 characters!')]
    Should Contain    ${error_message}    Telephone must be between 3 and 32 characters!
    Close browser



Edit fax in col with tele <3 charac
    open page
    sleep    2
    Execute JavaScript    document.querySelector('a[href="https://automationteststore.com/index.php?rt=account/edit"]').click()
    sleep    2
    input text    id=AccountFrm_telephone    +84928828446
    input text    id=AccountFrm_fax    84
    click element    //button[@class='btn btn-orange pull-right lock-on-click' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-success"]
    ${error_message}=    Get Text    //*[@class="alert alert-success"]
    Should Contain    ${error_message}    Success: Your account has been successfully updated.
    Close browser






Edit telephone in menu with tele <3 charac
    open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/edit']").click();
    sleep    2
    input text    id=AccountFrm_telephone    84
    input text    id=AccountFrm_fax    +84928828446
    click element    //button[@class='btn btn-orange pull-right lock-on-click' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    Element Should Be Visible    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Telephone must be between 3 and 32 characters!')]
    ${error_message}=    Get Text    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Telephone must be between 3 and 32 characters!')]
    Should Contain    ${error_message}    Telephone must be between 3 and 32 characters!
    Close browser

Edit telephone in menu with tele >32 charac
    open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/edit']").click();
    sleep    2
    input text    id=AccountFrm_telephone    +8492882844684928828446849288284468492882844684928828446849288284468492882844684928828446849288284468492882844684928828446849288284468492882844684928828446
    input text    id=AccountFrm_fax    +84928828446
    click element    //button[@class='btn btn-orange pull-right lock-on-click' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    Element Should Be Visible    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Telephone must be between 3 and 32 characters!')]
    ${error_message}=    Get Text    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Telephone must be between 3 and 32 characters!')]
    Should Contain    ${error_message}    Telephone must be between 3 and 32 characters!
    Close browser

Edit fax in menu with tele <3 charac
    open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/edit']").click();
    sleep    2
    input text    id=AccountFrm_telephone    +84928828446
    input text    id=AccountFrm_fax    84
    click element    //button[@class='btn btn-orange pull-right lock-on-click' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-success"]
    ${error_message}=    Get Text    //*[@class="alert alert-success"]
    Should Contain    ${error_message}    Success: Your account has been successfully updated.
    Close browser




Edit First name \ < 1 Charac
    open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/edit']").click();
    sleep    2
    Clear Element Text    id=AccountFrm_firstname

    click element    //button[@class='btn btn-orange pull-right lock-on-click' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    Element Should Be Visible    //span[@class='help-block' and contains(text(), 'First Name must be between 1 and 32 characters!')]
    ${error_message}=    Get Text    //span[@class='help-block' and contains(text(), 'First Name must be between 1 and 32 characters!')]
    Should Contain    ${error_message}    First Name must be between 1 and 32 characters!
    close browser

Edit First name > 32 Charac
    open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/edit']").click();
    sleep    2
    input text    id=AccountFrm_firstname    MY ACCOUNT INFORMATIONMY ACCOUNT INFORMATIONMY ACCOUNT INFORMATIONMY ACCOUNT INFORMATION

    click element    //button[@class='btn btn-orange pull-right lock-on-click' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    Element Should Be Visible    //span[@class='help-block' and contains(text(), 'First Name must be between 1 and 32 characters!')]
    ${error_message}=    Get Text    //span[@class='help-block' and contains(text(), 'First Name must be between 1 and 32 characters!')]
    Should Contain    ${error_message}    First Name must be between 1 and 32 characters!
    close browser

Edit Last name < 1 Charac
    open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/edit']").click();
    sleep    2
    Clear Element Text    id=AccountFrm_lastname

    click element    //button[@class='btn btn-orange pull-right lock-on-click' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    Element Should Be Visible    //span[@class='help-block' and contains(text(), 'Last Name must be between 1 and 32 characters!')]
    ${error_message}=    Get Text    //span[@class='help-block' and contains(text(), 'Last Name must be between 1 and 32 characters!')]
    Should Contain    ${error_message}    Last Name must be between 1 and 32 characters!
    close browser

Edit Last name > 32 Charac
    open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/edit']").click();
    sleep    2
    input text    id=AccountFrm_lastname    MY ACCOUNT INFORMATIONMY ACCOUNT INFORMATIONMY ACCOUNT INFORMATIONMY ACCOUNT INFORMATION

    click element    //button[@class='btn btn-orange pull-right lock-on-click' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    Element Should Be Visible    //span[@class='help-block' and contains(text(), 'Last Name must be between 1 and 32 characters!')]
    ${error_message}=    Get Text    //span[@class='help-block' and contains(text(), 'Last Name must be between 1 and 32 characters!')]
    Should Contain    ${error_message}    Last Name must be between 1 and 32 characters!
    close browser

Edit Email no valid
    open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/edit']").click();
    sleep    2
    input text    id=AccountFrm_email    votai12003

    click element    //button[@class='btn btn-orange pull-right lock-on-click' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    Element Should Be Visible    //span[@class='help-block' and contains(text(), 'E-Mail Address does not appear to be valid!')]
    ${error_message}=    Get Text    //span[@class='help-block' and contains(text(), 'E-Mail Address does not appear to be valid!')]
    Should Contain    ${error_message}    E-Mail Address does not appear to be valid!
    close browser

Verify click back
    open page
    sleep    2
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/edit']").click();
    sleep    2
    click element    //a[@class='btn btn-default mr10' and @title='Back']
    location should be    https://automationteststore.com/index.php?rt=account/account
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
