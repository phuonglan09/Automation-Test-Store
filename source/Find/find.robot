*** Settings ***
Suite Setup       Open Browser    https://automationteststore.com/    browser=chrome
Suite Teardown    Close Browser
Library           SeleniumLibrary
Library           String

*** Variables ***
${PRODUCT_NAME}    SKINSHEEN BRONZER STICK
${PARTIAL_KEYWORD}    SKIN
${NONEXISTENT_KEYWORD}    ahdkdkf
${NO_RESULTS_MESSAGE}    There is no product that matches the search criteria.
${CATEGORY}       Makeup

*** Test Cases ***
Search Product By Exact Keyword
    [Documentation]    Truy cập vào trang Automation Test Store và tìm kiếm sản phẩm bằng từ khóa chính xác.
    [Tags]    search    product
    Input Search Keyword    ${PRODUCT_NAME}
    Verify Product Displayed

Search Product By Partial Keyword
    [Documentation]    Truy cập vào trang Automation Test Store và tìm kiếm sản phẩm bằng một phần của từ khóa.
    [Tags]    search    product
    Input Search Keyword    ${PARTIAL_KEYWORD}
    Verify Search Results Contain Partial Keyword

Search Product By Nonexistent Keyword
    [Documentation]    Truy cập vào trang Automation Test Store và tìm kiếm sản phẩm bằng từ khóa không tồn tại.
    [Tags]    search    product
    Input Search Keyword    ${NONEXISTENT_KEYWORD}
    Verify No Results Message Displayed

Search Product By Category
    [Documentation]    Truy cập vào trang Automation Test Store và tìm kiếm sản phẩm theo danh mục.
    [Tags]    search    category
    Click Element    xpath=//*[@id="filter_keyword"]
    Wait Until Page Contains Element    xpath=//*[@id="category_36"]
    Click Element    xpath=//*[@id="category_36"]
    Input Search Keyword    mascara
    Sleep    2s
    Verify Products In Category

Search Product Using Advanced Options - Search in product model
    [Documentation]    Sử dụng các tùy chọn tìm kiếm nâng cao để tìm kiếm sản phẩm.
    [Tags]    search    advanced options
    Input Search Keyword    treatment
    Verify Advanced Search Results - Search in product model

Search Product Using Advanced Options - Search in product descriptions
    [Documentation]    Sử dụng các tùy chọn tìm kiếm nâng cao để tìm kiếm sản phẩm.
    [Tags]    search    advanced options
    Input Search Keyword    treatment
    Verify Advanced Search Results - Search in product descriptions

Search Product Using Advanced Options - Search in product model and product descriptions
    [Documentation]    Sử dụng các tùy chọn tìm kiếm nâng cao để tìm kiếm sản phẩm.
    [Tags]    search    advanced options
    Input Search Keyword    treatment
    Verify Advanced Search Results - Search in product descriptions

Search Product Using Suggestions
    [Documentation]    Kiểm tra tính năng gợi ý khi nhập từ khóa vào ô tìm kiếm.
    [Tags]    search    suggestions
    Input Search Keyword    skin
    Verify Suggestions Displayed

Search Product Using Shortcut or Quick Search Button
    [Documentation]    Sử dụng phím tắt hoặc nút tìm kiếm nhanh để tìm kiếm sản phẩm và kiểm tra kết quả.
    [Tags]    search    shortcut
    Input Text    name=filter_keyword    ${PRODUCT_NAME}
    Press Key    name=filter_keyword    \\13
    Verify Product Displayed

*** Keywords ***
-------------------------------------------------

Input Search Keyword
    [Arguments]    ${KEY}
    [Documentation]    Nhập từ khóa tìm kiếm và thực hiện tìm kiếm
    Input Text    name=filter_keyword    ${KEY}
    Click Element    xpath=//*[@id="search_form"]/div/div/i

Verify Product Displayed
    [Documentation]    Kiểm tra xem sản phẩm mong muốn có hiển thị trong kết quả tìm kiếm và thông tin chính xác
    Wait Until Page Contains Element    xpath=//*[@id="product_details"]/div/div[2]/div/div/h1/span    timeout=10
    ${product_name}=    Get Text    xpath=//*[@id="product_details"]/div/div[2]/div/div/h1/span
    Should Be Equal As Strings    ${product_name}    ${PRODUCT_NAME}
    ${product_price}=    Get Text    xpath=//*[@id="product_details"]/div/div[2]/div/div/div[1]/div/div
    Should Not Be Empty    ${product_price}
    ${product_image}=    Get Element Attribute    xpath=//*[@id="product_details"]/div/div[1]/div[1]/a/img    src
    Should Contain    ${product_image}    /image/
    ${product_description}=    Get Text    xpath=//*[@id="description"]/p
    Should Not Be Empty    ${product_description}

Verify Search Results Contain Partial Keyword
    [Documentation]    Xác minh kết quả tìm kiếm chứa các sản phẩm liên quan đến từ khóa.
    ${results}=    Get WebElements    xpath=//div[@class='fixed_wrapper']//a[contains(@title, 'Skin') or contains(text(), 'Skin')]
    ${result_count}=    Get Length    ${results}
    Run Keyword If    ${result_count}==0    Verify No Results Message Displayed
    FOR    ${index}    IN RANGE    ${result_count}
        ${product}=    Get Text    xpath=(//div[@class='fixed_wrapper']//a[contains(@title, 'Skin') or contains(text(), '${PARTIAL_KEYWORD}')])[${index+1}]
        Log    Product found: ${product}
        Should Contain    ${product}    ${PARTIAL_KEYWORD}
    END

Verify No Results Message Displayed
    [Documentation]    Kiểm tra xem thông báo không có sản phẩm nào khớp với từ khóa tìm kiếm được hiển thị
    Wait Until Page Contains    ${NO_RESULTS_MESSAGE}    timeout=10
    Element Should Contain    xpath=//div[@class='contentpanel']    ${NO_RESULTS_MESSAGE}

Verify Products In Category
    ${results}=    Get WebElements    xpath=//div[@class='fixed_wrapper']//a[contains(@title, 'Mascara') or contains(text(), 'Mascara')]
    ${result_count}=    Get Length    ${results}
    Run Keyword If    ${result_count}==0    Verify No Results Message Displayed
    FOR    ${index}    IN RANGE    ${result_count}
        ${product}=    Get Text    xpath=(//div[@class='fixed_wrapper']//a[contains(@title, 'Mascara') or contains(text(), 'Mascara')])[${index+1}]
        Log    Product found: ${product}
        Should Contain    ${product}    MASCARA
    END

---------------

Verify Advanced Search Results - Search in product model
    Click Element    xpath=//*[@id="model"]
    Click Button    //*[@id="search_button"]
    ${results}=    Get WebElements    xpath=//div[@class='fixed_wrapper']//a[contains(@title, 'Treatment') or contains(text(), 'Treatment')]
    ${result_count}=    Get Length    ${results}
    Run Keyword If    ${result_count}==0    Verify No Results Message Displayed
    FOR    ${index}    IN RANGE    ${result_count}
        ${product}=    Get Text    xpath=(//div[@class='fixed_wrapper']//a[contains(@title, 'Treatment') or contains(text(), 'Treatment')])[${index+1}]
        Log    Product found: ${product}
        Should Contain    ${product}    TREATMENT
    END

Verify Advanced Search Results - Search in product descriptions
    Click Element    xpath=//*[@id="description"]
    Click Button    //*[@id="search_button"]
    ${results}=    Get WebElements    xpath=//div[@class='fixed_wrapper']//a[contains(@title, '') or contains(text(), '')]
    Log    ${results}
    ${result_count}=    Get Length    ${results}
    Run Keyword If    ${result_count}==0    Verify No Results Message Displayed
    FOR    ${index}    IN RANGE    ${result_count}
        Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[${result_count}]/div[2]/a/img
        Scroll Element Into View    //*[@id="productdesc"]
        ${product_detail}=    Get Text    xpath=//*[@id="description"]
        ${product_detail_lower}=    Convert To Lower Case    ${product_detail}
        Should Contain    ${product_detail_lower}    treatment
        Go Back
    END

Verify Suggestions Displayed
    [Documentation]    Kiểm tra xem có gợi ý nào xuất hiện không.
    Sleep    3s
    ${suggestions}=    Get WebElements    SKINSHEEN BRONZER STICK
    Should Not Be Empty    ${suggestions}    Suggestions should be displayed when a partial keyword is entered

-------------
