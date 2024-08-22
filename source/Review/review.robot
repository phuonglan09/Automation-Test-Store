*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           String

*** Variables ***
${LOGIN_URL}      https://automationteststore.com/
${BROWSER}        Chrome
${USERNAME}       lanlan
${PASSWORD}       123456
${REVIEW_NAME}    Nguyễn Thị Phương Lan
${REVIEW_TEXT}    Sản phẩm chất lượng, sẽ ủng hộ lại!

*** Test Cases ***
Tc1: Kiểm Tra Tính Hợp Lệ Của Đánh Giá
    [Documentation]    Đảm bảo người dùng đánh giá hợp lệ
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Login To AutomationTestStore
    Select A Product    https://automationteststore.com/index.php?rt=product/product&product_id=51
    Submit A Review
    Page Should Contain    Thank you for your review
    Close Browser

Tc2: Kiểm tra đánh giá không hợp lệ - không chọn số sao
    [Documentation]    Xác minh thông báo lỗi nếu người dùng không chọn số sao
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Login To AutomationTestStore
    Select A Product    https://automationteststore.com/index.php?rt=product/product&product_id=51
    Submit A Review Not Rating
    Page Should Contain    Please select a review rating!
    Close Browser

Tc3: Kiểm tra đánh giá không hợp lệ - tên dưới 3 kí tự
    [Documentation]    Xác minh thông báo lỗi nếu tên người dùng không hợp lệ
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Login To AutomationTestStore
    Select A Product    https://automationteststore.com/index.php?rt=product/product&product_id=51
    Submit A Review With Invalid name - 2 characters
    Page Should Contain    Review Name must be between 3 and 25 characters!
    Close Browser

Tc4: Kiểm tra đánh giá không hợp lệ - tên vượt quá 25 kí tự
    [Documentation]    Xác minh thông báo lỗi nếu tên người dùng không hợp lệ
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Login To AutomationTestStore
    Select A Product    https://automationteststore.com/index.php?rt=product/product&product_id=51
    Submit A Review With Invalid name - 26 characters
    Page Should Contain    Review Name must be between 3 and 25 characters!
    Close Browser

Tc5: Kiểm tra đánh giá không hợp lệ - tên chứa kí tự đặc biệt
    [Documentation]    Xác minh thông báo lỗi nếu tên người dùng không hợp lệ
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Login To AutomationTestStore
    Select A Product    https://automationteststore.com/index.php?rt=product/product&product_id=51
    Submit A Review With Invalid name - special characters
    Page Should Contain    Review Name invalid!
    Close Browser

Tc6: Kiểm tra đánh giá không hợp lệ - đánh giá dưới 25 kí tự
    [Documentation]    Xác minh thông báo lỗi nếu nội dung đánh giá không hợp lệ
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Login To AutomationTestStore
    Select A Product    https://automationteststore.com/index.php?rt=product/product&product_id=51
    Submit A Review With Invalid ReviewText - 24 characters
    Page Should Contain    Review Text must be between 25 and 1000 characters!
    Close Browser

Tc7: Kiểm tra đánh giá không hợp lệ - đánh giá quá 1000 kí tự
    [Documentation]    Xác minh thông báo lỗi nếu nội dung đánh giá không hợp lệ
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Login To AutomationTestStore
    Select A Product    https://automationteststore.com/index.php?rt=product/product&product_id=51
    Submit A Review With Invalid ReviewText - 1003 characters
    Page Should Contain    Review Text must be between 25 and 1000 characters!
    Close Browser

Tc8: Kiểm tra đánh giá hợp lệ - đánh giá chứa kí tự đặc biệt
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Login To AutomationTestStore
    Select A Product    https://automationteststore.com/index.php?rt=product/product&product_id=51
    Submit A Review With Invalid ReviewText - special characters
    Page Should Contain    Thank you for your review
    Close Browser

Tc9: Kiểm tra đánh giá không hợp lệ - capcha không hợp lệ
    [Documentation]    Xác minh thông báo lỗi nếu capcha không chính xác
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Login To AutomationTestStore
    Select A Product    https://automationteststore.com/index.php?rt=product/product&product_id=51
    Submit A Review With Invalid Capcha
    Page Should Contain    Human verification has failed! Please try again
    Close Browser

Tc10: Kiểm tra xác thực người dùng đánh giá sản phẩm
    [Documentation]    Người dùng không thể đánh giá sản phẩm khi chưa đăng nhập thành công
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Select A Product    https://automationteststore.com/index.php?rt=product/product&product_id=51
    Submit A Review
    Location Should Contain    /login
    Close Browser

Tc11:Kiểm tra số lượng đánh giá tăng lên sau khi đăng
    [Documentation]    Đảm bảo số lượng đánh giá tăng lên ngay sau khi được đăng
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Select A Product    https://automationteststore.com/index.php?rt=product/product&product_id=51
    ${initial_review_count}=    Get Review Count
    Submit A Review
    ${new_review_count}=    Get Review Count
    Verify Review Count Increases    ${initial_review_count}    ${new_review_count}
    Close Browser

Tc12:Kiểm tra hiển thị đánh giá vừa đăng
    [Documentation]    Đảm bảo đánh giá mới xuất hiện chính xác ngay sau khi được đăng
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Select A Product    https://automationteststore.com/index.php?rt=product/product&product_id=51
    Submit A Review
    Page Should Contain    ${REVIEW_TEXT}
    Close Browser

Tc13:Kiểm tra hiển thị đánh giá của người dùng trước
    [Documentation]    Đảm bảo đánh giá của người dùng trước được hiển thị
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Select A Product    https://automationteststore.com/index.php?rt=product/product&path=65_66&product_id=111
    Submit A Review
    Page Should Not Contain    There are no reviews
    Close Browser

Tc14:Kiểm tra tính bảo mật của đánh giá – không thể chỉnh sửa đánh giá của người khác
    [Documentation]    Đảm bảo đánh giá của một người dùng không thể chỉnh sửa bởi người dùng khác.
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Select A Product    https://automationteststore.com/index.php?rt=product/product&path=65_66&product_id=111
    Scroll Element Into View    xpath=//*[@id="myTab"]/li[2]/a
    Page Should Not Contain Element    //*[@id="current_reviews"]/div[1]//button[contains(text(), 'Edit')]
    Close Browser

Tc15:Kiểm tra tính bảo mật của đánh giá – có thể chỉnh sửa đánh giá của mình
    [Documentation]    Đảm bảo đánh giá của một người dùng không thể chỉnh sửa bởi người dùng khác.
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Select A Product    https://automationteststore.com/index.php?rt=product/product&path=65_66&product_id=111
    Scroll Element Into View    xpath=//*[@id="myTab"]/li[2]/a
    ${author_name}=    Get Text    xpath=//*[@id="current_reviews"]/div[1]/b
    Run Keyword If    '${author_name}' == '${REVIEW_NAME}'    Page Should Contain Element    //*[@id="current_reviews"]/div[1]//button[contains(text(), 'Edit')]
    Run Keyword If    '${author_name}' != '${REVIEW_NAME}'    Page Should Not Contain Element    //*[@id="current_reviews"]/div[1]//button[contains(text(), 'Edit')]
    Close Browser

Tc16: Kiểm tra một người dùng có thể đăng nhiều đánh giá cho cùng một sản phẩm
    [Documentation]    Đảm bảo mỗi người dùng chỉ đăng được 1 đánh giá.
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Select A Product    https://automationteststore.com/index.php?rt=product/product&path=65_66&product_id=111
    Submit A Review
    Submit A Review
    Page Should Contain    can only rate once
    Close Browser

Tc17: Kiểm tra tính năng báo cáo đánh giá
    [Documentation]    Đảm bảo tính năng báo cáo đánh giá nào không hợp lệ hoạt động
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Select A Product    https://automationteststore.com/index.php?rt=product/product&path=65_66&product_id=111
    Scroll Element Into View    xpath=//*[@id="myTab"]/li[2]/a
    ${author_name}=    Get Text    xpath=//*[@id="current_reviews"]/div[1]/b
    Run Keyword If    '${author_name}' != '${REVIEW_NAME}'    Page Should Contain Element    //*[@id="current_reviews"]/div[1]//button[contains(text(), 'Report')]
    Close Browser

*** Keywords ***
Login To AutomationTestStore
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    id=loginFrm_loginname    ${USERNAME}
    Input Text    id=loginFrm_password    ${PASSWORD}
    Click Element    xpath=//*[@id="loginFrm"]/fieldset/button
    Click Element    xpath=/html/body/div/header/div[1]/div/div[1]/a/img

Select A Product
    [Arguments]    ${PRODUCT_URL}
    Go To    ${PRODUCT_URL}

Submit A Review
    Scroll Element Into View    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="rating2"]
    Input Text    id=name    ${REVIEW_NAME}
    Input Text    id=text    ${REVIEW_TEXT}
    Wait For CAPTCHA Input
    Click Button    css=button[title='Submit']
    Sleep    3s
    Wait Until Page Contains    Thank you for your review. It has been submitted to the webmaster for approval

Submit A Review Not Rating
    Scroll Element Into View    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="myTab"]/li[2]/a
    Input Text    id=name    ${REVIEW_NAME}
    Input Text    id=text    ${REVIEW_TEXT}
    Wait For CAPTCHA Input
    Click Button    css=button[title='Submit']
    Sleep    3s
    Wait Until Page Contains    Please select a review rating!

---------------------REVIEW NAME---------------

Submit A Review With Invalid name - 2 characters
    Scroll Element Into View    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="rating1"]
    Input Text    id=name    hi
    Input Text    id=text    ${REVIEW_TEXT}
    Wait For CAPTCHA Input
    Click Button    css=button[title='Submit']
    Sleep    3s
    Wait Until Page Contains    Review Name must be between 3 and 25 characters!

Submit A Review With Invalid name - 26 characters
    Scroll Element Into View    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="rating1"]
    Input Text    id=name    ádfghjklqwerty1234567890as
    Input Text    id=text    ${REVIEW_TEXT}
    Wait For CAPTCHA Input
    Click Button    css=button[title='Submit']
    Sleep    3s
    Wait Until Page Contains    Review Name must be between 3 and 25 characters!

Submit A Review With Invalid name - special characters
    Scroll Element Into View    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="rating1"]
    Input Text    id=name    Nguyen Phương Lan!@#$%^&*())
    Input Text    id=text    ${REVIEW_TEXT}
    Wait For CAPTCHA Input
    Click Button    css=button[title='Submit']
    Sleep    3s
    Wait Until Page Contains    Review Name invalid!

---------------------REVIEW TEXT---------------

Submit A Review With Invalid ReviewText - 24 characters
    Scroll Element Into View    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="rating1"]
    Input Text    id=name    ${REVIEW_NAME}
    Input Text    id=text    Tuyệt vời, rất đáng giá
    Wait For CAPTCHA Input
    Click Button    css=button[title='Submit']
    Sleep    3s
    Wait Until Page Contains    Review Text must be between 25 and 1000 characters!

Submit A Review With Invalid ReviewText - 1003 characters
    Scroll Element Into View    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="rating1"]
    Input Text    id=name    ${REVIEW_NAME}
    Input Text    id=text    Rất hài lòng với sản phẩm này! Thiết kế đẹp mắt và sang trọng, phù hợp với nhiều không gian sống. Chất lượng hoàn thiện rất tốt, các chi tiết được gia công tỉ mỉ và chắc chắn. Chức năng của sản phẩm hoạt động hiệu quả, dễ dàng sử dụng và tiện lợi trong nhiều tình huống. Thời gian sử dụng pin lâu dài, sạc nhanh và không bị nóng máy. Hệ thống điều khiển thông minh, dễ dàng kết nối với các thiết bị khác. Đặc biệt, giá cả rất hợp lý so với chất lượng. Dịch vụ chăm sóc khách hàng tận tình, chu đáo, luôn sẵn sàng hỗ trợ khi cần thiết. Giao hàng nhanh chóng, đóng gói cẩn thận, không bị hư hại trong quá trình vận chuyển. Sẽ tiếp tục ủng hộ và giới thiệu cho bạn bè, người thân về sản phẩm này. Đây thực sự là một lựa chọn tuyệt vời cho những ai đang tìm kiếm sự kết hợp giữa thẩm mỹ và tính năng ưu việt. Rất đáng giá để sở hữu và trải nghiệm. Giao hàng nhanh chóng, đóng gói cẩn thận, không bị hư hại trong quá trình vận chuyển. Sẽ tiếp tục ủng hộ và giới thiệu cho bạn bè, người thân về sản phẩm này.
    Wait For CAPTCHA Input
    Click Button    css=button[title='Submit']
    Sleep    3s
    Wait Until Page Contains    Review Text must be between 25 and 1000 characters!

Submit A Review With Invalid ReviewText - special characters
    Scroll Element Into View    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="rating1"]
    Input Text    id=name    ${REVIEW_NAME}
    Input Text    id=text    Tuyệt vời, rất đáng giá sẽ mua nha !@#$%^&*())
    Wait For CAPTCHA Input
    Click Button    css=button[title='Submit']
    Sleep    3s
    Wait Until Page Contains    Thank you for your review. It has been submitted to the webmaster for approval

Submit A Review With Invalid Capcha
    Scroll Element Into View    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="rating1"]
    Input Text    id=name    ${REVIEW_NAME}
    Input Text    id=text    Tuyệt vời, rất đáng giá sẽ mua nha !@#$%^&*())
    Input Text    id=capcha    capchasai
    Click Button    css=button[title='Submit']
    Sleep    3s
    Wait Until Page Contains    Human verification has failed! Please try again.

Wait For CAPTCHA Input
    [Documentation]    Wait for user to enter CAPTCHA manually
    Sleep    12s

----------------

Get Review Count
    ${review_text}=    Get Text    xpath=//*[@id="myTab"]/li[2]/a
    [Return]    ${review_text}

Verify Review Count Increases
    [Arguments]    ${initial_review_count}    ${new_review_count}
    Should Be True    ${new_review_count} != ${initial_review_count}
