*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   common.resource

*** Variables ***
${filter_button}    css:#exploreFilterContainer > div.cards > div > filter:nth-child(1) > div > div.filterCardTitleSection > div.cardHeader.flex > div > pbi-text-label > div
${filter_name}  css:#exploreFilterContainer > div.cards > div > filter:nth-child(1) > div > div.filterContent > div > filter-visual > div > visual-modern > div > div > div.slicer-content-wrapper > div > div.searchHeader.show > input
${result_list}  css:#exploreFilterContainer > div.cards > div > filter:nth-child(1) > div > div.filterContent > div > filter-visual > div > visual-modern > div > div > div.slicer-content-wrapper > div > div.slicerBody

*** Test Cases ***
Evaluate
    Open and configure browser
    Login PowerBI
    Navegar Gestao
#    BuiltIn.Sleep   100
    Wait Until Element Is Visible   ${filter_button}
    Click Element   ${filter_button}
    Wait Until Element Is Visible   ${filter_name}
    Input Text  ${filter_name}  0003
    BuiltIn.Sleep   2
    Click Element At Coordinates    ${result_list}  1   -70
    BuiltIn.Sleep   2
    Export pdf






