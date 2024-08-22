*** Settings ***
Suite Teardown    Close Browser
Library           SeleniumLibrary
Library           String
Library           Collections

*** Variables ***
${BROWSER}        chrome
${URL}            https://automationteststore.com/

*** Test Cases ***
Product Details
    [Documentation]    Truy cập vào trang Automation Test Store và tìm kiếm sản phẩm bằng từ khóa chính xác.
    [Tags]    search    product
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # Cuộn xuống 500px
    Scroll Page    0    500
    # Lấy danh sách sản phẩm từ trang chủ
    ${products}=    Get WebElements    css:.prdocutname
    # Lặp qua từng sản phẩm và kiểm tra thông tin chi tiết
    ${product_name}=    Get Text    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[1]/div/a
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[1]/div/a
    Verify Product Detail    ${product_name}
    Go Back
    close browser

Verify Image Product Color Selection
    Maximize Browser Window
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=product/product&path=68_69&product_id=118
    ${product_image_src} =    Get Element Attribute    xpath=//*[@id="product_details"]/div/div[1]/div[1]/a/img    src
    Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[2]
    Wait Until Element Is Visible    xpath=//*[@id="product_details"]/div/div[1]/div[1]/a/img
    ${product_image_src_new} =    Get Element Attribute    xpath=//*[@id="product_details"]/div/div[1]/div[1]/a/img    src    # Lấy đường dẫn của hình ảnh sản phẩm
    Log    Original product image src: ${product_image_src}
    Run Keyword If    '${product_image_src}' != '${product_image_src_new}'    Log    The product image changed according to the selected color.
    ...    ELSE    FAIL    Log    The product image did not change according to the selected color.
    Close Browser

Verify Image Zoom Functionality
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Go To    https://automationteststore.com/index.php?rt=product/product&path=68_69&product_id=118
    Hover Over Product Image
    Wait Until Element Is Visible    xpath=//*[@id="product_details"]/div/div[1]/div[1]/a
    ${image_src} =    Get Element Attribute    xpath=//*[@id="product_details"]/div/div[1]/div[1]/a/img    src
    Log    Image src after zoom: ${image_src}
    Run Keyword If    '${image_src}' != 'null',    Log    The product image is zoomed in correctly.
    ...    ELSE    Fail    The product image is not zoomed in correctly.
    Close Browser

Verify Color Selection When Out Of Stock
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=product/product&path=68_69&product_id=116
    Maximize Browser Window
    # Bước 3: Chọn màu sản phẩm (nếu có) khi đã hết hàng
    Click Element    xpath=//*[@id="option345"]/option[1]
    # Bước 4: Kiểm tra xem khi màu sản phẩm đã hết hàng thì không thể chọn màu
    Verify Color Selection Disabled
    Close Browser

Verify Size Selection When Out Of Stock
    Open Browser    ${URL}    ${BROWSER}
    Go To    https://automationteststore.com/index.php?rt=product/product&path=68_69&product_id=116
    Maximize Browser Window
    Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[5]
    Verify Size Selection Disabled
    Close Browser

Verify latest Products
    Open Browser    ${URL}    ${BROWSER}
    go to    https://automationteststore.com/index.php?rt=product/product&path=68_69&product_id=116
    Maximize Browser Window
    # Bước 3: Kiểm tra xem có đề xuất sản phẩm mới nhất xuất hiện trên trang chi tiết sản phẩm hay không
    Wait Until Element Is Visible    xpath=//*[@id="maincontainer"]/div/div[1]/div[1]/h2/span[contains(text(),'Latest Products')]
    ${related_products} =    Get WebElements    xpath=//*[@id="maincontainer"]/div/div[1]/div[1]/ul
    Run Keyword If    ${related_products}    Log    latest products are displayed on the product detail page.
    ...    ELSE    Fail    latest products are not displayed on the product detail page.
    Close Browser

Verify Category List Display
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # Tạo list chứa các giá trị mong đợi của danh mục sản phẩm
    ${expected_categories}    Create List    HOME    APPAREL & ACCESSORIES    MAKEUP    SKINCARE    FRAGRANCE    MEN    HAIR CARE    BOOKS
    # Lấy văn bản từ phần tử danh mục sản phẩm
    ${categories}    Get WebElements    xpath=//*[@id="categorymenu"]/nav/ul/li/a
    # Kiểm tra từng danh mục sản phẩm với các giá trị mong đợi
    FOR    ${category}    IN    @{categories}
        ${category_text}    Get Text    ${category}
        Should Contain    ${expected_categories}    ${category_text}
        ...    Log    Category '${category_text}' is displayed correctly.
        ...    ELSE    Fail    Category '${category_text}' is not displayed correctly or fully.
    END
    close browser

Verify Category Expand and Collapse
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # Bước 2: Nhấp vào từng danh mục để mở rộng/xổ xuống và xác nhận danh mục con được hiển thị chính xác
    @{main_categories}    Get WebElements    xpath=//*[@id="categorymenu"]/nav/ul/li/a
    FOR    ${main_category}    IN    @{main_categories}
        Mouse Over    ${main_category}
        ${sub_categories}    Get WebElements    xpath=//*[@id="main_menu"]/li
        Run Keyword If    '${sub_categories}' != '[]'    Log    Subcategories of ${main_category.text} are displayed correctly.
        ...    ELSE    Fail    Subcategories of ${main_category.text} are not displayed or incorrect.
    END
    Close Browser

Verify Category Navigation
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[1]/a
    ${header}=    get text    xpath=//*[@id="block_frame_featured_1769"]/h1
    Should Contain    ${header}    FEATURED
    # Lặp qua các danh mục khác để kiểm tra chuyển hướng đúng
    FOR    ${index}    IN RANGE    2    8
        Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[${index}]/a
        ${category_name}    Get Text    xpath=//*[@id="categorymenu"]/nav/ul/li[${index}]/a
        ${header}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/h1/span[1]
        Should Contain    ${category_name}    ${header}
        Go Back
    END
    close browser

Verify Empty Category Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # Bước 2: Nhấp vào một danh mục không có sản phẩm
    go to    https://automationteststore.com/index.php?rt=product/search&keyword=df&category_id=0
    # Bước 3: Xác nhận rằng trang kết quả hiển thị không có sản phẩm nào và thông báo rõ ràng
    ${no_products_message}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]
    Should Contain    ${no_products_message}    There is no product
    Close Browser

Verify Product Sorting by Date Old to New
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[3]/a
    Click element    xpath=//*[@id="sort"]
    Click Element    xpath=//*[@id="sort"]/option[1]
    ${products}=    Get WebElements    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]
    # Lặp qua từng sản phẩm và kiểm tra
    FOR    ${product}    IN    @{products}
        ${product_text}=    Get Text    ${product}
        Should Contain    'date'    ${product_text}
    END
    Close Browser

Verify Product Sorting by Date New to Old
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[3]/a
    Click element    xpath=//*[@id="sort"]
    Click Element    xpath=//*[@id="sort"]/option[8]
    ${products}=    Get WebElements    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]
    # Lặp qua từng sản phẩm và kiểm tra
    FOR    ${product}    IN    @{products}
        ${product_text}=    Get Text    ${product}
        Should Contain    'date'    ${product_text}
    END
    Close Browser

Verify Product Sorting by Name A to Z
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[3]/a
    Click element    xpath=//*[@id="sort"]
    Click Element    xpath=//*[@id="sort"]/option[2]
    ${product_names}    Get WebElements    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]
    ${sorted_product_names}    Create List
    FOR    ${product_name}    IN    @{product_names}
        Append To List    ${sorted_product_names}    ${product_name.text}
    END
    ${sorted}    Evaluate    ${sorted_product_names} == sorted(${sorted_product_names})
    Should Be True    ${sorted}    Product names are sorted correctly
    close browser

Verify Product Sorting by Name z to a
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[3]/a
    Click element    xpath=//*[@id="sort"]
    Click Element    xpath=//*[@id="sort"]/option[3]
    ${product_names}    Get WebElements    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]
    ${sorted_product_names}    Create List
    FOR    ${product_name}    IN    @{product_names}
        Append To List    ${sorted_product_names}    ${product_name.text}
        Log    ${sorted_product_names}
    END
    ${sorted}    Evaluate    ${sorted_product_names} == sorted(${sorted_product_names})
    Should Be True    ${sorted}    Product names are sorted correctly from Z to A
    close browser

Verify Product Sorting by Price Low to High
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[3]/a
    Click Element    xpath=//*[@id="sort"]
    Click Element    xpath=//*[@id="sort"]/option[4]
    Scroll Page    0    500
    Wait Until Element Is Visible    xpath=//*[@class="oneprice"]
    ${product_prices}    Get WebElements    xpath=//*[@class="oneprice"]
    ${sorted_product_prices}    Create List
    FOR    ${price}    IN    @{product_prices}
        ${price_text}    Set Variable    ${price.text}
        Exit For Loop If    '${price_text}'== ''
        ${price_text}    Remove String    ${price_text}    $
        ${price_text}    Convert To Number    ${price_text}
        Append To List    ${sorted_product_prices}    ${price_text}
    END
    ${sorted}    Evaluate    ${sorted_product_prices} == sorted(${sorted_product_prices})
    Should Be True    ${sorted}    Sản phẩm được sắp xếp đúng theo giá từ thấp đến cao
    close browser

Verify Product Sorting by Price High to Low
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[3]/a
    Click Element    xpath=//*[@id="sort"]
    Click Element    xpath=//*[@id="sort"]/option[5]
    Scroll Page    0    500
    Wait Until Element Is Visible    xpath=//*[@class="oneprice"]
    ${product_prices}    Get WebElements    xpath=//*[@class="oneprice"]
    ${sorted_product_prices}    Create List
    FOR    ${price}    IN    @{product_prices}
        ${price_text}    Set Variable    ${price.text}
        Exit For Loop If    '${price_text}'== ''
        ${price_text}    Remove String    ${price_text}    $
        ${price_text}    Convert To Number    ${price_text}
        Append To List    ${sorted_product_prices}    ${price_text}
    END
    Reverse List    ${sorted_product_prices}    # Sắp xếp từ cao xuống thấp
    ${sorted}    Evaluate    ${sorted_product_prices} == sorted(${sorted_product_prices})
    Should Be True    ${sorted}    Sản phẩm được sắp xếp đúng theo giá từ cao đến thấp
    close browser

Verify Product Sorting by Rating Highest
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # Bước 2: Chọn một danh mục và sử dụng tính năng sắp xếp theo Rating Highest
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[5]/a
    Click Element    xpath=//*[@id="sort"]
    Click Element    xpath=//*[@id="sort"]/option[5]
    Sleep    2s
    # Bước 3: Hover chuột vào mỗi sản phẩm để hiển thị số sao và thu thập thông tin
    ${product_elements}    Get WebElements    xpath=//*[@class="thumbnail"]
    ${product_ratings}    Create List    # Danh sách chứa số sao của mỗi sản phẩm
    ${product_infos}    Create List    # Danh sách chứa thông tin về mỗi sản phẩm
    ${count}    Set Variable    0
    FOR    ${product}    IN    @{product_elements}
        ${count}    Convert To Integer    ${count}
        Exit For Loop If    '${count}'== '9'
        Mouse over    ${product}    # Hover chuột vào sản phẩm
        ${rating_element}    Get Element Attribute    xpath=//*[@class="rating"]    alt
        Exit For Loop If    '${product}'== ''
        Append To List    ${product_ratings}    ${rating_element}    # Lưu số sao vào danh sách
        ${product_info}    Get Text    ${product}    # Lấy thông tin về sản phẩm
        Append To List    ${product_infos}    ${product_info}    # Lưu thông tin về sản phẩm vào danh sách
        ${count}    Set Variable    ${count + 1}
    END
    ${sorted}    Evaluate    ${product_ratings} == sorted(${product_ratings})
    Should Be True    ${sorted}    Sản phẩm được sắp xếp đúng theo đánh giá cao nhất
    Close Browser

Verify Product Sorting by Rating Lowest
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # Bước 2: Chọn một danh mục và sử dụng tính năng sắp xếp theo Rating Lowest
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[5]/a
    Click Element    xpath=//*[@id="sort"]
    Click Element    xpath=//*[@id="sort"]/option[6]
    Sleep    2s
    # Bước 3: Hover chuột vào mỗi sản phẩm để hiển thị số sao và thu thập thông tin
    ${product_elements}    Get WebElements    xpath=//*[@class="thumbnail"]
    ${product_ratings}    Create List    # Danh sách chứa số sao của mỗi sản phẩm
    ${product_infos}    Create List    # Danh sách chứa thông tin về mỗi sản phẩm
    ${count}    Set Variable    0
    FOR    ${product}    IN    @{product_elements}
        ${count}    Convert To Integer    ${count}
        Exit For Loop If    '${count}'== '9'
        Mouse over    ${product}    # Hover chuột vào sản phẩm
        ${rating_element}    Get Element Attribute    xpath=//*[@class="rating"]    alt
        Exit For Loop If    '${product}'== ''
        Append To List    ${product_ratings}    ${rating_element}    # Lưu số sao vào danh sách
        ${product_info}    Get Text    ${product}    # Lấy thông tin về sản phẩm
        Append To List    ${product_infos}    ${product_info}    # Lưu thông tin về sản phẩm vào danh sách
        ${count}    Set Variable    ${count + 1}
    END
    ${sorted}    Evaluate    ${product_ratings} == sorted(${product_ratings}, reverse=False)
    Should Be True    ${sorted}    Sản phẩm được sắp xếp đúng theo đánh giá thấp nhất
    Close Browser

Check the paging feature
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    input text    name=filter_keyword    e
    Press Keys    name=filter_keyword    ENTER
    Sleep    2
    ${var_1}    get text    //a[@class='prdocutname']
    Scroll Element Into View    id=limit
    Select From List By Value    id=limit    20
    sleep    2
    ${text}    get text    xpath=//ul[@class='pagination']/li[4]/a
    ${text_1}    Convert to number    ${text}
    click element    xpath=//ul[@class='pagination']/li[2]/a
    sleep    2
    ${var_2}    get text    //a[@class='prdocutname']
    Should not be equal    ${var_2}    ${var_1}
    should be true    ${text_1}==4
    close browser

Check UIUX page List
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    click element    xpath=//*[@id="categorymenu"]/nav/ul/li[3]/a
    sleep    2
    click element    id=list

    ${display_style} =    Execute JavaScript    return window.getComputedStyle(document.querySelector('.thumbnails.grid.row.list-inline')).getPropertyValue('display');
    Run Keyword If    '${display_style}' == 'none'    Log    The element is hidden.
    close browser

Check UIUX page Grid
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    click element    xpath=//*[@id="categorymenu"]/nav/ul/li[3]/a
    sleep    2
    click element    id=list
    click element    id=grid
    ${display_style} =    Execute JavaScript    return window.getComputedStyle(document.querySelector('.thumbnails.list.row')).getPropertyValue('display');
    Run Keyword If    '${display_style}' == 'none'    Log    The element is hidden.
    close browser

Check Euro
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    mouse over    //div[@class='block_6']
    sleep    2
    click element    //div[@class='block_6']//ul[@class='nav language pull-left']//a[contains(text(), 'Euro')]
    sleep    3
    Scroll Element Into View    class=oneprice
    ${pic}    get text    //div[@class='price']//div[@class='oneprice']
    Should Contain    ${pic}    €
    close browser

Check Pound
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    mouse over    //div[@class='block_6']
    sleep    2
    click element    //div[@class='block_6']//ul[@class='nav language pull-left']//a[contains(text(), 'Pound Sterling')]
    sleep    3
    Scroll Element Into View    class=oneprice
    ${pic}    get text    //div[@class='price']//div[@class='oneprice']
    Should Contain    ${pic}    £
    close browser

Check USD
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    mouse over    //div[@class='block_6']
    sleep    2
    click element    //div[@class='block_6']//ul[@class='nav language pull-left']//a[contains(text(), 'US Dollar')]
    sleep    3
    Scroll Element Into View    class=oneprice
    ${pic}    get text    //div[@class='price']//div[@class='oneprice']
    Should Contain    ${pic}    $
    close browser

*** Keywords ***
-----------------------------------------------------

Verify Product Detail
    [Arguments]    ${expected_name}
    [Documentation]    Kiểm tra thông tin chi tiết của sản phẩm
    # Kiểm tra tên sản phẩm
    ${actual_name}=    Get Text    xpath=//*[@id="product_details"]/div/div[2]/div/div/h1/span
    ${actual_name_upper}=    Convert To Upper Case    ${actual_name}
    Should Be Equal As Strings    ${actual_name_upper}    ${expected_name}
    # Kiểm tra giá sản phẩm
    ${price}=    Get Text    xpath=//*[@id="product_details"]/div/div[2]/div/div/div[1]/div/div
    Should Not Be Empty    ${price}
    # Kiểm tra số lượng sản phẩm
    ${value}=    Get Element Attribute    xpath=//*[@id="product_quantity"]    value
    Should Not Be Empty    ${value}
    # Kiểm tra mô tả sản phẩm
    ${description}=    Get Text    //*[@id="description"]/p
    Should Not Be Empty    ${description}
    # Kiểm tra hình ảnh sản phẩm
    ${image}=    Get Element Attribute    xpath=//*[@id="product_details"]/div/div[1]/div[2]/a/img    src
    Should Not Be Empty    ${image}
    #Kiểm tra tiền có trùng khớp
    ${price_bot}=    Get Text    xpath=//*[@id="product"]/fieldset/div[2]/label/span
    Run Keyword If    '${price}' != '${price_bot}'    Log    The product price matches.
    ...    ELSE    Fail    The product price does not matches.

Scroll Page
    [Arguments]    ${x_offset}    ${y_offset}
    Execute Javascript    window.scrollBy(${x_offset}, ${y_offset})

Select Product Color
    [Arguments]    ${color_element}
    Click Element    ${color_element}

Hover Over Product Image
    [Documentation]    Di chuột vào hình ảnh sản phẩm để kích hoạt chức năng zoom
    [Tags]    product    zoom
    Mouse Over    xpath=//*[@id="product_details"]/div/div[1]/div[1]/a/img

Verify Color Selection Disabled
    [Documentation]    Kiểm tra xem khi màu sản phẩm đã hết hàng thì không thể chọn màu
    [Tags]    color    out-of-stock
    # Kiểm tra xem phần tử màu đã hết hàng có khả dụng để click không
    ${is_disabled} =    Run Keyword And Return Status    Element Should Be Disabled    xpath=//*[@id="option345"]/option[1]
    Run Keyword If    ${is_disabled}    Log    The color selection is disabled when the product is out of stock.
    ...    ELSE    Fail    The color selection is still enabled when the product is out of stock.

Verify Size Selection Disabled
    [Documentation]    Kiểm tra xem khi size sản phẩm đã hết hàng thì không thể chọn size
    [Tags]    color    out-of-stock
    ${is_disabled} =    Run Keyword And Return Status    Element Should Be Disabled    xpath=//*[@id="option344751"]
    Run Keyword If    ${is_disabled}    Log    The size selection is disabled when the product is out of stock.
    ...    ELSE    Fail    The size selection is still enabled when the product is out of stock.
