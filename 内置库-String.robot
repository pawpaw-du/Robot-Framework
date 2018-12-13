*** Settings ***
Library           String

*** Test Cases ***
ReplaceString
    ${str}    setvariable    ho
    ${str}    evaluate    '${str}'.replace('o','h')
    log    ${str}
    ${replace}    replacestring    ${str}    h    0    #被替换项，替换后的内容

Convert-大小写-编码方式互换
    [Documentation]    encode把字符串转换成对应的Bytes
    ...    decode再转回字符串
    ${str}    set variable    hello world
    ${lower}    convert to lowercase    ${str}
    ${upper}    convert to uppercase    ${str}
    ${a}    set variable    重工
    ${utf8}    encode string to bytes    ${a}    UTF-8
    ${gbk}    encode string to bytes    ${a}    GBK
    ${utf8cn}    decode bytes to string    ${utf8}    UTF-8
    ${gbkcn}    decode bytes to string    ${gbk}    GBK

Line-行数
    ${str}    set variable    hello\nworld\n\nsss\nhelp
    ${linecount}    get line count    ${str}
    ${lines}    split to lines    ${str}
    ${line}    get line    ${str}    3    #index从0开始
    ${linecontain}    get lines containing string    ${str}    h
    ${lines}    split to lines    ${linecontain}

String截取修改
    ${str}    set variable    hello world
    ${replace}    replace string    ${str}    l    k
    ${remove}    removestring     ${str}    wo
    ${split}    split string    ${str}
    ${splitright}    split string from right    ${str}
    ${splitchar}    split string to characters    ${str}
    ${fetchright}    fetch from right    ${str}    o
    ${fetchleft}    fetch from left    ${str}    6
    log    ${str[6:]}
    ${gen}    generate random string    4    [UPPER]    #随机生成字符，大写
    ${gen}    generate random string    4    [LOWER]
