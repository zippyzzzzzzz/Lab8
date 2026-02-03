*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open KKU Computing Website
    [Documentation]    ทดสอบการเปิดหน้าเว็บ Computing KKU แบบ Headless
    Open Browser To Login Page
    Title Should Be    College of Computing, Khon Kaen University
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless
    
    # เพิ่มบรรทัดนี้เพื่อแก้ปัญหาขนาดหน้าจอในโหมด Headless
    Call Method    ${chrome_options}    add_argument    --window-size\=1920,1080
    
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    https://computing.kku.ac.th