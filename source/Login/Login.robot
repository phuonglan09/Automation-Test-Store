*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://automationteststore.com/
${User_name}      vohuutai.001
${pass}           vohuutai.001

*** Test Cases ***
Login Success
    Open browser    ${URL}    Chrome
    Sleep    3
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    input text    id=loginFrm_loginname    ${User_name}
    input text    id=loginFrm_password    ${pass}
    click element    //*[@id="loginFrm"]/fieldset/button
    Sleep    5
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Close Browser

Login No User
    Open browser    ${URL}    Chrome
    Sleep    3
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    input text    id=loginFrm_password    ${pass}
    click element    //*[@id="loginFrm"]/fieldset/button
    Sleep    5
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Error: Incorrect login or password provided.
    Close Browser

Login No Pass
    Open browser    ${URL}    Chrome
    Sleep    3
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    input text    id=loginFrm_loginname    ${User_name}
    click element    //*[@id="loginFrm"]/fieldset/button
    Sleep    5
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Error: Incorrect login or password provided.
    Close Browser

Login with user no exist
    Open browser    ${URL}    Chrome
    Sleep    3
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    input text    id=loginFrm_loginname    zxczxc.1
    input text    id=loginFrm_password    zxczxc.1
    click element    //*[@id="loginFrm"]/fieldset/button
    Sleep    5
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Error: Incorrect login or password provided.
    Close Browser

Verify clear after refresh
    Open browser    ${URL}    Chrome
    Sleep    3
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    input text    id=loginFrm_loginname    ${User_name}
    input text    id=loginFrm_password    ${pass}
    sleep    3
    Execute JavaScript    location.reload(true)
    Wait Until Element Is Visible    id=loginFrm_loginname    timeout=10s
    sleep    3
    ${username_value}    Get Value    id=loginFrm_loginname
    ${password_value}    Get Value    id=loginFrm_password
    Should Be Equal    ${username_value}    ${EMPTY}
    Should Be Equal    ${password_value}    ${EMPTY}
    Close browser

Verify password Case Sensitivity
    Open browser    ${URL}    Chrome
    Sleep    3
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    input text    id=loginFrm_loginname    ${User_name}
    input text    id=loginFrm_password    Vohuutai.001
    click element    //*[@id="loginFrm"]/fieldset/button
    Sleep    5
    Element Should Be Visible    //*[@class="alert alert-error alert-danger"]
    ${error_message}=    Get Text    //*[@class="alert alert-error alert-danger"]
    Should Contain    ${error_message}    Error: Incorrect login or password provided.
    Close browser

Verify Click Forgot Login
    Open browser    ${URL}    Chrome
    Sleep    3
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //a[contains(@href, 'account/forgotten/loginname')]
    sleep    3
    Location Should be    https://automationteststore.com/index.php?rt=account/forgotten/loginname
    Close Browser

Verify Click Forgot Password
    Open browser    ${URL}    Chrome
    Sleep    3
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //a[contains(@href, 'account/forgotten/password')]
    sleep    3
    Location Should be    https://automationteststore.com/index.php?rt=account/forgotten/password
    Close Browser

Get account from forgot account
    Open browser    ${URL}    Chrome
    Sleep    3
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    2
    Click element    //a[contains(@href, 'account/forgotten/loginname')]
    sleep    2
    input text    id=forgottenFrm_lastname    Dang
    input text    id=forgottenFrm_email    moa26680@ilebi.com
    Click element    //button[contains(@title, 'Continue')]
    Sleep    2
    Element Should Be Visible    //*[@class="alert alert-success"]
    ${error_message}=    Get Text    //*[@class="alert alert-success"]
    Should Contain    ${error_message}    Success: Your login name reminder has been sent to your e-mail address.
    Close browser

Forgot password
    Open browser    ${URL}    Chrome
    Sleep    3
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    2
    Click element    //a[contains(@href, 'account/forgotten/password')]
    sleep    2
    input text    id=forgottenFrm_loginname    testtk.1
    input text    id=forgottenFrm_email    moa26680@ilebi.com
    Click element    //button[contains(@title, 'Continue')]
    Sleep    2
    Element Should Be Visible    //*[@class="alert alert-success"]
    ${error_message}=    Get Text    //*[@class="alert alert-success"]
    Should Contain    ${error_message}    Success: Password reset link has been sent to your e-mail address.
    Close browser

Verify Hover Forgot Pass
    Open browser    ${URL}    Chrome
    Sleep    3
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href*='account/forgotten/password']")).color
    Mouse Over    //a[contains(@href, 'account/forgotten/password')]
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href*='account/forgotten/password']")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    Close Browser

Verify Hover Forgot Login
    Open browser    ${URL}    Chrome
    Sleep    3
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href*='account/forgotten/loginname']")).color
    Mouse Over    //a[contains(@href, 'account/forgotten/loginname')]
    sleep    3
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("a[href*='account/forgotten/loginname']")).color
    Should Not Be Equal    ${color_before_hover}    ${color_after_hover}
    Close Browser

Verify back in Forgot Login
    Open browser    ${URL}    Chrome
    Sleep    3
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //a[contains(@href, 'account/forgotten/loginname')]
    sleep    3
    Click element    //a[@class='btn btn-default mr10' and @title='Back']
    Location Should be    https://automationteststore.com/index.php?rt=account/login
    Close Browser

Verify back in Forgot Password
    Open browser    ${URL}    Chrome
    Sleep    3
    Click element    //*[@id="customer_menu_top"]/li/a
    sleep    3
    Click element    //a[contains(@href, 'account/forgotten/password')]
    sleep    3
    Click element    //a[@class='btn btn-default mr10' and @title='Back']
    Location Should be    https://automationteststore.com/index.php?rt=account/login
    Close Browser
