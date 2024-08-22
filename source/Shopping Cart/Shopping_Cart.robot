*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn
Library           RequestsLibrary
Library           String

*** Variables ***
${BROWSER}        Edge
${URL}            https://automationteststore.com/
${URL_CART}       https://automationteststore.com/index.php?rt=checkout/cart
${URL_APPAREL}    https://automationteststore.com/index.php?rt=product/category&path=68
${URL_MAKEUP}     https://automationteststore.com/index.php?rt=product/category&path=36
${URL_SKINCARE}    https://automationteststore.com/index.php?rt=product/category&path=43
${URL_FRAGRANCE}    https://automationteststore.com/index.php?rt=product/category&path=49
${URL_MEN}        https://automationteststore.com/index.php?rt=product/category&path=58
${URL_HAIRCARE}    https://automationteststore.com/index.php?rt=product/category&path=52
${URL_BOOKS}      https://automationteststore.com/index.php?rt=product/category&path=65

*** Test Cases ***
Update Quantity Success
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Add Products
    Go To    ${URL_CART}
    ${original_quantity}=    Get Value    id=cart_quantity62
    Input Text    id=cart_quantity62    5
    Click Button    id=cart_update
    ${new_quantity}=    Get Value    id=cart_quantity62
    Should Not Be Equal As Strings    ${original_quantity}    ${new_quantity}
    Close Browser

Update Quantity With Negative Value
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Add Products
    Go To    ${URL_CART}
    ${original_quantity}=    Get Value    id=cart_quantity62
    Input Text    id=cart_quantity62    -2
    Click Button    id=cart_update
    ${is_element_present}=    Run Keyword And Return Status    Element Should Be Visible    id=cart_quantity62
    Log    Element with ID 'cart_quantity62' is present: ${is_element_present}
    Close Browser

Delete Product
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Add Products
    Go To    ${URL_CART}
    ${continue_links}=    Get WebElements    class=btn.btn-sm.btn-default
    WHILE    ${continue_links}
        Click Element    class=btn.btn-sm.btn-default
        ${continue_links}=    Get WebElements    class=btn.btn-sm.btn-default
    END
    Page Should Contain    Your shopping cart is empty!
    Close Browser

Hover Button Update
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Go To    ${URL_SKINCARE}
    Click Link    xpath://a[contains(@class,'productcart')]
    Go To    ${URL_CART}
    ${shortlinks_div_element}=    Get WebElement    css=button#cart_update
    Mouse Over    ${shortlinks_div_element}
    sleep    2s
    Close Browser

Hover Button Checkout
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Go To    ${URL_SKINCARE}
    Click Link    xpath://a[contains(@class,'productcart')]
    Go To    ${URL_CART}
    ${shortlinks_div_element}=    Get WebElement    css=a#cart_checkout1
    Mouse Over    ${shortlinks_div_element}
    sleep    2s
    Close Browser

Check Button Update and Checkout Is Exists Without Product
    Open Browser    ${URL_CART}    ${BROWSER}
    Maximize Browser Window
    ${cart_update_button_exists}=    Run Keyword And Return Status    Page Should Contain Element    id=cart_update
    ${cart_checkout_link_exists}=    Run Keyword And Return Status    Page Should Contain Element    id=cart_checkout1
    Log    Cart update button exists: ${cart_update_button_exists}
    Log    Cart checkout link exists: ${cart_checkout_link_exists}
    Close Browser

Caculate Price Products
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Add Products
    Go To    ${URL_CART}
    @{td_elements}=    Get WebElements    xpath=//td[@class='align_right']
    @{input_elements}=    Get WebElements    xpath=//input[@class='form-control short']
    ${total}=    Set Variable    0
    ${length}=    Get Length    ${input_elements}
    ${length}=    Evaluate    ${length} - 1
    FOR    ${index}    IN RANGE    ${length}
        ${index2}    Evaluate    ${index}+${index}
        ${td_value}=    Get Text    ${td_elements}[${index2}]
        ${input_value}=    Get Value    ${input_elements}[${index}]
        ${td_value}=    Remove String    ${td_value}    $
        ${input_value_int}=    Convert To Integer    ${input_value}
        ${td_value_int}=    Convert To Number    ${td_value}
        ${total}=    Evaluate    ${total} + (${td_value_int} * ${input_value_int})
    END
    ${page_height}=    Execute Javascript    return document.body.scrollHeight;
    Execute Javascript    window.scrollTo(0, ${page_height});
    sleep    2s
    #${price_actual}=    Get Text    span[@class='bold ']
    #${clean_price}=    Remove String    ${price_actual}    $
    #${integer_price_actual}=    Convert To Integer    ${clean_price}
    #Should Be True    ${total} == ${integer_price_actual}
    ${formatted_value}=    Convert To String    ${total}
    ${formatted_value}=    Evaluate    f'{float(${formatted_value}):.2f}'
    ${formatted_value}=    Replace String    ${formatted_value}    .    ,
    ${formatted_value}=    Set Variable    $${formatted_value}
    #Page Should Contain    ${formatted_value}
    Close Browser

Caculate Price Total
    Open Browser    ${URL}    ${BROWSER}
    Add Products
    Go To    ${URL_CART}
    ${sub_total}=    Get Text    xpath=//span[@class='bold' and not(contains(@class,'totalamout'))]
    ${shipping_rate}=    Get Text    xpath=//span[@class='bold' and not(contains(@class,'totalamout'))]
    ${total_amount}=    Get Text    xpath=//span[@class='bold totalamout']
    # Convert các giá trị thành số thực
    ${sub_total_float}=    Convert To Number    ${sub_total}
    ${shipping_rate_float}=    Convert To Number    ${shipping_rate}
    ${total_amount_float}=    Convert To Number    ${total_amount}
    # Kiểm tra tổng của sub-total và shipping rate có bằng với total amount
    Should Be Equal As Numbers    ${sub_total_float}+${shipping_rate_float}    ${total_amount_float}
    Log    Tổng sub-total và shipping rate: ${sub_total_float}+${shipping_rate_float} = ${total_amount_float}

*** Keywords ***
Add Products
    Go To    ${URL_APPAREL}
    Click Link    xpath://a[contains(@class,'productcart')]
    Click Element    id=option344748
    Click Link    class=cart
    Go To    ${URL_MAKEUP}
    Click Link    xpath://a[contains(@class,'productcart')]
    Click Link    class=cart
    Go To    ${URL_SKINCARE}
    Click Link    xpath://a[contains(@class,'productcart')]
    Go To    ${URL_FRAGRANCE}
    Click Link    xpath://a[contains(@class,'productcart')]
    Go To    ${URL_MEN}
    Click Link    xpath://a[contains(@class,'productcart')]
    Click Link    class=cart
    Go To    ${URL_HAIRCARE}
    Click Link    xpath://a[contains(@class,'productcart')]
    Click Link    class=cart
    Go To    ${URL_BOOKS}
    Click Link    xpath://a[contains(@class,'productcart')]

Get Edge Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver
    [Return]    ${options}
