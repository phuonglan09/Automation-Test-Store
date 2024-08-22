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
Add Product Success
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Link    xpath://a[contains(@class,'productcart')]
    ${expected_text1}=    Get Element Attribute    xpath://a[@title='Skinsheen Bronzer Stick']    title
    Go To    ${URL_SKINCARE}
    Click Link    xpath://a[contains(@class,'productcart')]
    ${expected_text2}    Set Variable    Absolue Eye Precious Cells
    Go To    ${URL_CART}
    ${expected_price}    Set Variable    $118.50
    Page Should Contain    ${expected_text1}
    Page Should Contain    ${expected_text2}
    Page Should Contain    ${expected_price}
    Close Browser

Add Many Product Success
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Add Products
    sleep    3s
    Close Browser

Add Product Contact
    Open Browser    ${URL_MAKEUP}    ${BROWSER}
    Maximize Browser Window
    Click Link    xpath://a[contains(@class,'call_to_order')]
    Input Text    id=ContactUsFrm_first_name    Tuan
    Input Text    id=ContactUsFrm_email    phamtuan111203@gmail.com
    Input Text    id=ContactUsFrm_enquiry    need 2 items
    Click Button    css=button.lock-on-click
    Location Should Be    https://automationteststore.com/index.php?rt=content/contact/success
    Close Browser

Add Product Sold Out
    Open Browser    https://automationteststore.com/index.php?rt=product/product&product_id=51    ${BROWSER}
    Maximize Browser Window
    Page Should Contain    Out of Stock
    Close Browser

Add Product Contact With Wrong First Name
    Open Browser    ${URL_MAKEUP}    ${BROWSER}
    Maximize Browser Window
    Click Link    xpath://a[contains(@class,'call_to_order')]
    Input Text    id=ContactUsFrm_first_name    Tu
    Input Text    id=ContactUsFrm_email    phamtuan111203@gmail.com
    Input Text    id=ContactUsFrm_enquiry    need 2 items
    Click Button    css=button.lock-on-click
    page Should Contain    Name must be between 3 and 32 characters!
    Close Browser

Add Product Contact With Wrong Email
    Open Browser    ${URL_MAKEUP}    ${BROWSER}
    Maximize Browser Window
    Click Link    xpath://a[contains(@class,'call_to_order')]
    Input Text    id=ContactUsFrm_first_name    Tuan
    Input Text    id=ContactUsFrm_email    phamtuan111203
    Input Text    id=ContactUsFrm_enquiry    need 2 items
    Click Button    css=button.lock-on-click
    page Should Contain    E-Mail Address does not appear to be valid!
    Close Browser

Add Product With Quantity >0
    Open Browser    https://automationteststore.com/index.php?rt=product/product&product_id=50    ${BROWSER}
    Maximize Browser Window
    Input Text    id=product_quantity    3
    Click Link    xpath://a[contains(@class,'cart')]
    ${quantity} =    Get Element Attribute    id=cart_quantity50    value
    ${integer_value}=    Convert To Integer    ${quantity}
    Should Be True    ${integer_value} == 3
    Close Browser

Add Product With Quantity <=0
    Open Browser    https://automationteststore.com/index.php?rt=product/product&product_id=50    ${BROWSER}
    Maximize Browser Window
    Input Text    id=product_quantity    -1
    Click Link    xpath://a[contains(@class,'cart')]
    Page Should Contain    Your shopping cart is empty!
    Close Browser

Hover Button ATC In HomePage
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    ${shortlinks_div_element}=    Get WebElement    css=a.productcart
    Mouse Over    ${shortlinks_div_element}
    sleep    2s
    Close Browser

Hover Button ATC In Detail Product
    Open Browser    https://automationteststore.com/index.php?rt=product/product&product_id=50    ${BROWSER}
    Maximize Browser Window
    ${shortlinks_div_element}=    Get WebElement    css=a.cart
    Mouse Over    ${shortlinks_div_element}
    sleep    2s
    Close Browser

Shopping Cart Reponsive
    Open Browser    ${URL_APPAREL}    ${BROWSER}
    Maximize Browser Window
    Click Link    xpath://a[contains(@class,'productcart')]
    Click Element    id=option344748
    Click Link    class=cart
    Go To    ${URL_MAKEUP}
    Click Link    xpath://a[contains(@class,'productcart')]
    Click Link    class=cart
    Go To    ${URL_SKINCARE}
    Click Link    xpath://a[contains(@class,'productcart')]
    Go To    ${URL_CART}
    ### ------------- ###
    Set Window Size    320    480    # view of phone
    Capture Page Screenshot    Mobile_Cart.png
    Set Window Size    768    1024    # view of tablet
    Capture Page Screenshot    Tablet_Cart.png
    Maximize Browser Window    # view of laptop
    Capture Page Screenshot    Desktop_Cart.png
    Close Browser

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
