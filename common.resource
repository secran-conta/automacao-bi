*** Variables ***
${gestao_el}    xpath://*[@id="content"]/div/home/div/recommended-content-widget/div/recommended-content-card[1]/pbi-card/pbi-card-content/span/span
${export}   css:[localize="Export"]
${pdf}      css:[localize="Pdf"]
${toast}    css:#cdk-overlay-8 > snack-bar-container > div > div > notification-toast > section > div > div > div > span
${download directory}   Empty


*** Keywords ***
Open and configure browser
    ${now}    Get Time    epoch
    ${download directory}    Join Path    ${OUTPUT DIR}    downloads_${now}
    Set Global Variable     ${download directory}   ${download directory}
    Create Directory    ${download directory}
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # list of plugins to disable. disabling PDF Viewer is necessary so that PDFs are saved rather than displayed
    ${disabled}    Create List    Chrome PDF Viewer
    ${prefs}    Create Dictionary    download.default_directory=${download directory}    plugins.plugins_disabled=${disabled}
    Call Method    ${chrome options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${chrome options}

Login PowerBI
    Goto    https://app.powerbi.com
    Wait Until Element Is Visible   email
    Element Should Be Visible   email
    Input Text      email   bi@secran.com.br
    Press Keys  email  ENTER
    Wait Until Element Is Visible   passwd
    Element Should Be Visible   passwd
    Input Password  passwd  !@Secran2023
    Press Keys  passwd  ENTER
    Wait Until Element Is Visible   idBtn_Back
    ClickButton     idBtn_Back

Navegar Gestao
    Wait Until Element Is Visible   ${gestao_el}
    Click Element     ${gestao_el}

Arquivo Existe
    ${location}     Join Path   ${download directory}   Gestão Geral.pdf
    File Should Exist   ${location}

Export pdf
    Wait Until Element Is Visible   ${export}
    Click Element     ${export}
    Wait Until Element Is Visible   ${pdf}
    Click Element     ${pdf}
    Wait Until Element Is Visible   okButton
    ClickButton     okButton
    Wait Until Keyword Succeeds     10x  5 seconds  Arquivo Existe



