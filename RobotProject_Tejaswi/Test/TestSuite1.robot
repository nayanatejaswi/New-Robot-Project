*** Settings ***
Library    SeleniumLibrary

Suite Setup    Log To Console    TestSuite Started
Suite Teardown    Log To Console    TestSuite Completed    

Test Setup    GoToLoginPage
Test Teardown    ClosingBrowser

Default Tags    Common    

*** Test Cases ***

MyFirstTest
    [Tags]    Smoke
    Log    Welcome to MyfirstTest 
    
MySecondTest
    Set Tags    Regression 
    Log    Welcome to MySecondTest
    Remove Tags    Regression
    
MyThirdTest
    Log    Welcome to MyThirdTest
    
MyFourthTest 
    Log    Welcome to MyFourthTest  
    
MyFifthTest
    Log    Welcome to MyFifthTest
    
FirstSeleniumTest
       
    Open Browser    https://www.google.com    chrome
    Set Browser Implicit Wait    5
    Input Text    name=q    Nayana Tara
    Click Button    name=btnK    
    Sleep    3        
    Close Browser
    Log To Console    Test is Completed    
  
    
LoginTest
    Open Browser    https://www.amazon.com/ap/signin?_encoding=UTF8&ignoreAuthState=1&openid.assoc_handle=usflex&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.mode=checkid_setup&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&openid.ns.pape=http%3A%2F%2Fspecs.openid.net%2Fextensions%2Fpape%2F1.0&openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com%2F%3Fref_%3Dnav_custrec_signin&switch_account=    chrome
    Set Browser Implicit Wait    5
    Input Text    id=ap_email    @{credentials}[0]
    Click Button    id=continue
    Input Password    id=ap_password    &{logins}[password]
    Click Button    id=signInSubmit
    Click Element    xpath=//*[@id="nav-link-accountList"]/span[1]
    Click Element    xpath=//*[@id="nav-item-signout"]/span        
    Close Browser                
    Log To Console    Login Test Completed 
    
LoginKeywordTest
    Open Browser    ${url}    chrome    
    Login
    Logout
    Close Browser
    Log To Console    Keyword Test Completed

SimpleLoginTest
    BrowserSettings
    Login
    Logout
    Log To Console    Testcase execution completed     
    
*** Variables ***
${url}    https://www.amazon.com/ap/signin?_encoding=UTF8&ignoreAuthState=1&openid.assoc_handle=usflex&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.mode=checkid_setup&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&openid.ns.pape=http%3A%2F%2Fspecs.openid.net%2Fextensions%2Fpape%2F1.0&openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com%2F%3Fref_%3Dnav_custrec_signin&switch_account=
@{credentials}    +917331184075    amazon@123
&{logins}    username=+917331184075    password=amazon@123
    
*** Keywords ***
Login
    Input Text    id=ap_email    +917331184075
    Click Button    id=continue
    Input Password    id=ap_password    amazon@123
    Click Button    id=signInSubmit
    
Logout
    Click Element    xpath=//*[@id="nav-link-accountList"]/span[1]
    Click Element    xpath=//*[@id="nav-item-signout"]/span   
    
GoToLoginPage
    Open Browser    ${url}    chrome
        
BrowserSettings
    Delete All Cookies
    Maximize Browser Window
    Set Browser Implicit Wait    5
     
ClosingBrowser
    Close Browser       

    