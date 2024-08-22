*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://automationteststore.com/
${User_name}      vohuutai.001
${pass}           vohuutai.001

*** Test Cases ***
notification success
    open page
    click element    //ul[@class='nav-dash']/li[8]/a
    sleep    2
    Execute JavaScript    document.querySelector('div.col-md-12 button[title="Continue"]').click()
    sleep    2
    Element Should Be Visible    //*[@class="alert alert-success"]
    ${error_message}=    Get Text    //*[@class="alert alert-success"]
    Should Contain    ${error_message}    Success: Your notification settings has been successfully updated!
    Close browser

notification success no Newsletters
    open page
    click element    //ul[@class='nav-dash']/li[8]/a
    sleep    2
    click element    //input[@type='checkbox' and @name='settings[newsletter][email]' and @id='imFrm_settingsnewsletteremail' and @value='1' and @checked='checked']
    sleep    2
    Execute JavaScript    document.querySelector('div.col-md-12 button[title="Continue"]').click()
    sleep    2
    Element Should Be Visible    //*[@class="alert alert-success"]
    ${error_message}=    Get Text    //*[@class="alert alert-success"]
    Should Contain    ${error_message}    Success: Your notification settings has been successfully updated!
    Close browser

verify button back
    open page
    click element    //ul[@class='nav-dash']/li[8]/a
    sleep    2
    click element    //div[@class='col-md-12']//a[@title='Back']
    location should be    https://automationteststore.com/index.php?rt=account/account







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
