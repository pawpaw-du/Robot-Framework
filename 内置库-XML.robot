*** Settings ***
Library           XML
Library           OperatingSystem

*** Test Cases ***
XML
    comment    将一段文本信息处理成xml对像    base基础路径
    ${XML}    parse xml    <xml><robot>test</robot></xml>
    ${elemnet}    get element    ${XML}    robot
    add element    ${XML}    <auto id="4">qitao</auto>
    ${text}    get element text    ${XML}    auto
    set element tag    ${XML}    rf    robot
    set element text    ${XML}    settext    xpath=rf
    remove element attribute    ${XML}    id    auto
    clear element    ${XML}

nvram.xml
    ${nvram}    get file    ${CURDIR}${/}nvram.xml
    ${Nvram}    parse Xml    ${nvram}
    ${element}    get element    ${Nvram}    HwInfo
    ${HwInfo-value}    get element text    ${Nvram}    HwInfo    #标签内的数据
    ${SerialNum-value}    get element text    ${Nvram}    SerialNum
    ${Ifconfig-element}    get elements    ${Nvram}    Ifconfig
    ${DeviceID-value}    get element text    ${Nvram}    DeviceID
