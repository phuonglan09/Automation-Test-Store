*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://automationteststore.com/
${User_name}      vohuutai.001
${pass}           vohuutai.001

*** Test Cases ***
Change Pass success in row
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[2]/a
    sleep    2
    input text    id=PasswordFrm_current_password    ${pass}
    input text    id=PasswordFrm_password    zxczxc
    input text    id=PasswordFrm_confirm    zxczxc
    click element    //button[@class='btn btn-orange pull-right' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-success"]
    ${error_message}=    Get Text    //*[@class="alert alert-success"]
    Should Contain    ${error_message}    Success: Your password has been successfully updated.
    Close browser

Change Pass success in menu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Sleep    3
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    input text    id=loginFrm_loginname    ${User_name}
    input text    id=loginFrm_password    zxczxc
    click element    //*[@id="loginFrm"]/fieldset/button
    Sleep    3
    mouse over    xpath=//a[contains(@class,'menu_account')]
    sleep    1
    Execute JavaScript    document.querySelector("a[href='https://automationteststore.com/index.php?rt=account/password']").click();
    sleep    2
    input text    id=PasswordFrm_current_password    zxczxc
    input text    id=PasswordFrm_password    ${pass}
    input text    id=PasswordFrm_confirm    ${pass}
    click element    //button[@class='btn btn-orange pull-right' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-success"]
    ${error_message}=    Get Text    //*[@class="alert alert-success"]
    Should Contain    ${error_message}    Success: Your password has been successfully updated.
    Close browser

old password wrong
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[2]/a
    sleep    2
    input text    id=PasswordFrm_current_password    zxcxxcxxcxxc
    input text    id=PasswordFrm_password    zxczxc
    input text    id=PasswordFrm_confirm    zxczxc
    click element    //button[@class='btn btn-orange pull-right' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    ${error_message}=    Get Text    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Your current password is incorrect! Please try again.')]
    Should Contain    ${error_message}    Your current password is incorrect! Please try again.
    Close browser

no input New Password
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[2]/a
    sleep    2
    input text    id=PasswordFrm_current_password    ${pass}
    click element    //button[@class='btn btn-orange pull-right' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    ${error_message}=    Get Text    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Password must be between 4 and 20 characters!')]
    Should Contain    ${error_message}    Password must be between 4 and 20 characters!
    Close browser

Password confirmation does not match password!
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[2]/a
    sleep    2
    input text    id=PasswordFrm_current_password    ${pass}
    input text    id=PasswordFrm_password    zxczxc
    input text    id=PasswordFrm_confirm    zxczxczxczxc
    click element    //button[@class='btn btn-orange pull-right' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    ${error_message}=    Get Text    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Password confirmation does not match password!')]
    Should Contain    ${error_message}    Password confirmation does not match password!
    Close browser

verify button back in change passs
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[2]/a
    sleep    2

    click element    //a[@href='https://automationteststore.com/index.php?rt=account/account']
    location should be    https://automationteststore.com/index.php?rt=account/account
    Close browser

verify after refresh
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[2]/a
    sleep    2
    input text    id=PasswordFrm_current_password    ${pass}
    input text    id=PasswordFrm_password    zxczxc
    Execute JavaScript     location.reload();
    sleep    3
    ${PasswordFrm_current_password}    Get Value    id=PasswordFrm_current_password
    ${PasswordFrm_password}    Get Value    id=PasswordFrm_password
    Should Be Equal    ${PasswordFrm_current_password}    ${EMPTY}
    Should Be Equal    ${PasswordFrm_password}    ${EMPTY}
    close browser

no input Password -> click continue
    open page
    sleep    2
    click element    //ul[@class='nav-dash']/li[2]/a
    sleep    2

    click element    //button[@class='btn btn-orange pull-right' and @title='Continue']
    Sleep    3
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Oops, there is an error with information provided!
    ${error_message}=    Get Text    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Your current password is incorrect! Please try again.')]
    Should Contain    ${error_message}    Your current password is incorrect! Please try again.
    ${error_message}=    Get Text    //div[@class='form-group has-error']//span[@class='help-block' and contains(text(), 'Password must be between 4 and 20 characters!')]
    Should Contain    ${error_message}    Password must be between 4 and 20 characters!
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
