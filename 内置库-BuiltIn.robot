*** setting ***
Documentation     *RIDE默认初始化加载BuiltIn*
Library           BuiltIn

*** Variables ***
@{LIST}           foo    bar

*** Test Cases ***
convent（转换）
    [Documentation]    _1.Convert,进制转换使用，2to10,10to16_
    ...
    ...    *Convert to Integer*转换成整数
    ...
    ...    *Convert to Binary*转换二进制
    ...
    ...    *Convert to Octal*转换八进制
    ...
    ...    *Convert to Hex*转换十六进制
    ...
    ...    *Convert to String*转换字符串
    ...
    ...    *Convert to Bytes*
    ...
    ...    *Convert to Boolean*转换字布尔值
    ...
    ...    *Convert to Number*
    ${a}    set variable    100
    ${integer}    convert to integer    ${a}
    ${number}    convert to number    ${a}
    ${binary}    convert to binary    ${a}
    ${Octal}    convert to Octal    ${a}
    ${Hex}    convert to Hex    ${a}
    ${string}    convert to string    ${a}
    ${bytes}    convert to bytes    ${a}
    ${boolean}    convert to boolean    ${a}
    Comment    转换方式    当前值    转换后的进制/前置头    长度
    ${integer}    convert to integer    FFAA    16
    ${binary}    convert to binary    F    base=16    prefix=0b
    ${Octal}    convert to Octal    16    prefix=oct    length=4
    ${Hex}    convert to Hex    255
    ${Hex}    convert to Hex    255    prefix=0x    length=2
    ${string}    convert to string    123
    ${bytes}    convert to bytes    12
    ${boolean}    convert to boolean    11

convent（转换）-格式
    [Documentation]    _1.Convert,进制转换使用，2to10,10to16_
    ...
    ...    *Convert to Integer*转换成整数
    ...
    ...    *Convert to Binary*转换二进制
    ...
    ...    *Convert to Octal*转换八进制
    ...
    ...    *Convert to Hex*转换十六进制
    ...
    ...    *Convert to String*转换字符串
    ...
    ...    *Convert to Bytes*
    ...
    ...    *Convert to Boolean*转换字布尔值
    ...
    ...    *Convert to Number*
    Comment    转换方式    当前值    转换后的进制/前置头    长度
    ${integer}    convert to integer    FFAA    16
    ${binary}    convert to binary    F    base=16    prefix=0b
    ${Octal}    convert to Octal    16    prefix=oct    length=4
    ${Hex}    convert to Hex    255
    ${Hex}    convert to Hex    255    prefix=0x    length=2
    ${string}    convert to string    123
    ${bytes}    convert to bytes    12
    ${boolean}    convert to boolean    11

Verify(验证)-should断言
    should not be empty    A
    should be empty    ${EMPTY}
    should not be True    0
    should be equal    2    2
    should start with    hello    he
    should end with    hello    lo
    should match    aaab    a*b
    should match regexp    2    \\d

Verify(验证)-fail
    [Tags]    fail
    Fail    停止当前case
    log    不会打印

Verify(验证)-Fatal Error
    [Tags]    fatal
    fatal error    停止所有case
    log    后面的案例都会停止

get count/length从字符串中获取
    [Documentation]    get count从字符串中获取某个元素的个数
    ...
    ...    get length 获取字符的长度
    ${count}    get count    hello world    o
    ${count}    get count    hello world    l
    ${list}    create list    1    2
    ${LEN}    GET LENGTH    ${list}
    LENGTH SHOULD BE    ${list}    ${LEN}

Variables（变量）
    [Documentation]    setTest 作用域用例
    ...
    ...    set Suite作用域
    ...
    ...    set Global Variable 全局
    ...
    ...    get varibale Value 获取变量的值
    ${var}    set variable    a
    ${var2}    set variable if    '${var}'<>'0'    9
    set test variable    ${testvar}    test
    set suite variable    ${suitevar}    suite
    set global variable    ${globalvar}    global
    ${getvar}    get variables
    ${varval}    get variable Value    ${var}
    ${varval}    get variable Value    ${var3}    ${var2}
    log variables
    variable should exist    ${testvar}
    variable should Not exist    ${qtvar}
    ${globalvar}    replace variables    ${testvar}

Runkeyword
    ${var}    set variable    log
    runkeyword    ${var}    abc
    runkeyword    ${var}    abc
    Comment    ...换行的意思
    ...    AND    ${var}    EFG
    ...    AND    ${var}    EFG
    runkeyword if    '${var}'=='log'    ${var}    iflog
    runkeyword unless    '${var}'=='test'    ${var}    unless
    run keyword and ignore error    fail    ignore
    ${status}    run keyword and return status    log    selenium
    Comment    run keyword and continue on failure    fail    #执行失败后面的还会执行
    run keyword and expect error    *    Fail
    repeat keyword    2    Log    repeat
    wait until keyword succeeds    30s    5s    LOG    aaa

control(控制)FOR循环INRANGE
    : FOR    ${in}    INRANGE    5
    \    log    ${in}
    \    runkeyword if    ${in}==3    continue for loop
    \    log    cfloop=${in}
    : FOR    ${in}    INRANGE    5
    \    log    ${in}
    \    exit for loop if    ${in}==2
    \    log    exitloopif=${in}
    pass Execution    pass后面的不会执行    #直接给个通过的结果，用于站位
    pass execution if

Return From keyword
    ${index} =    Find Index    bar    @{LIST}
    Should Be Equal    ${index}    ${1}
    ${index} =    Find Index    foo    @{LIST}
    Should Be Equal    ${index}    ${0}
    ${index} =    Find Index    non existion    @{LIST}
    Should Be Equal    ${index}    ${-1}    #不存在时返回

MISC
    comment    \    关键字占位用
    no operation
    sleep    2s
    ${cate}    catenate    hello    world
    comment    注释
    set log level    trace
    log    log文本
    log many    a    b    c
    log to console    console

MISC-catenate-拼接
    ${cate}    catenate    TCPS-IOT    你好
    log    ${cate}

Evaluate随机数
    [Documentation]    Ecaluate 可以调用python的方法
    ...    出现乱码可以转换为可以识别的中文
    ${num}    Evaluate    random.randint(0,1000)    random

Evaluate（随机字符串）
    ${str}    Evaluate    string.ascii_uppercase    string
    ${strlen}    Evaluate    len('${str}')
    ${len}    get length    ${str}
    ${num}    set variable    4
    ${newstr}    set variable    ${EMPTY}
    : FOR    ${index}    INRANGE    ${num}
    \    ${i}    evaluate    random.randint(0,int(${len})-1)+1    random
    \    ${temp}    set variable    ${str[int(${i})-1]}
    \    ${newstr}    set variable    ${newstr}${temp}
    log    ${newstr}

Evaluate（字符串处理）
    [Documentation]    ${str}.Striip去掉空格
    ...
    ...    ${}..replace替换
    ...
    ...    string.join拼接
    ${str}    set variable    \ hello world \
    log    =${str}=
    ${str}    evaluate    '${str}'.strip()
    log    =${str}=
    ${str}    evaluate    '${str}'.replace('o','h')
    ${str}    evaluate    '${str}'.replace(' ','')
    ${urlA}    set variable    http://www.baidu.com
    ${urlB}    set variable    more
    ${url}    evaluate    string.join(['${urlA}','${urlB}'],'/')    string

Evaluate(中文处理）
    ${utf8}    set variable    u'\\u4e2d\\u6578'    #unicode-字符：u'\\u4e2d\\u6578'
    ${utf8cn}    evaluate    ${utf8}
    ${gbk}    set variable    \\xd6\\xd0\\xce\\xc4    #gbk-字符：\\xd6\\xd0\\xce\\xc4
    ${gbk}    evaluate    '${gbk}'.decode('gbk')
    ${a}    set variable    中文
    ${utf8}    evaluate    '${a}'.decode('utf-8')
    log    输出：${utf8}
    ${utf8cn}    evaluate    u'${utf8}'
    ${utflist}    create list    ${a}
    ${gbk}    evaluate    '${a}'.decode('utf-8').encode('gbk')
    ${gbkcn}    evaluate    '${gbk}'.decode('gbk')

Evaluate(re）
    [Documentation]    re.subn(三个变量，起始匹配内容，替换后内容，匹配项目) ^开头，$结束；作用是将字符串中不是英文和数字的字符替换为下划线“_”,返回值是替换后的字符串
    ...    re.sub('[\\d]','*','${string}'),将数字替换为*
    ...
    ...    re.findall('\\d','${string}')查找所有数字
    ...
    ...    re.findall('\\d+','${string}')连续数字作为一个值取出
    ${string}    set variable    paic-2.526.6-90
    ${subn}    evaluate    re.subn('[^\\w]','_','${string}')    re
    log    ${subn[0]}
    log    ${subn[1]}    #6所处的位置
    ${sub}    evaluate    re.sub('[\\d]','*','${string}')    re
    ${findnumber}    evaluate    re.findall('\\d','${string}')    re
    ${findnumbers}    evaluate    re.findall('\\d+','${string}')    re

regexp(正则表达式）
    [Documentation]    （1）\是转义字符
    ...
    ...    （2）匹配字符串可包含特殊字符，但在字符串中午特殊含义，只是文本意思。
    ...
    ...    （3）匹配模式不是全字符匹配。若需要全字符匹配，在匹配模式字符首加^，字符尾加$
    ${ret}    should match regexp    adsdd909cc    909    #部分匹配
    log    ${ret}
    Comment    ${ret}    should match regexp    adsdd909cc    ^909$    mes=匹配失败
    Comment    log    ${ret}
    ${email}    Should Match Regexp    test@test.com    ^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)(\.[A-Za-z]{2,})$    email validation
    log    ${email}

Evaluate(日期处理）
    [Documentation]    get time NOW现在时间
    ...
    ...    UTC时间
    ...    datatime 自定义格式：datetime.timedelta
    ...
    ...    ${newDate} Evaluate datetime.date(int('${year}'),int('${month}'),int('${day}'))+datetime.timedelta(days=int('${addDays}')) datetime
    ${ymd}    gettime    year month day
    ${ymd}    gettime    year month day    NOW-1day
    ${gettime}    gettime    year month day    2014-10-15
    ${year}    ${month}    ${day}    set variable    ${gettime}
    ${addDays}    set variable    -1
    ${newDate}    Evaluate    datetime.date(int('${year}'),int('${month}'),int('${day}'))+datetime.timedelta(days=int('${addDays}'))re    datetime
    ${newYMD}    Evaluate    '${newDate}'.split("-")
    ${nweTime}    Evaluate    time.strftime("%Y-%m-%d-%H-%M-%S")    time    #现在的时间

Evaluate(执行命令）
    [Documentation]    sys.platform判定系统是哪个中 windows、linux
    ${sys}    evaluate    sys.platform    sys
    ${cmd}    evaluate    os.system(r'md test-1000')    os    #新建
    ${cmd}    evaluate    os.system(r'rm -rf \ test-1000')    os    #删除
    ${cmd}    evaluate    os.system('rls -l')    os    #查看

*** Keywords ***
kw2
    [Arguments]    ${index}
    [Return]    ${index}

Find Index
    [Arguments]    ${element}    @{items}
    ${index} =    Set Variable    ${0}
    : FOR    ${item}    IN    @{items}
    \    Run Keyword If    '${item}' == '${element}'    Return From Keyword    ${index}
    \    ${index} =    Set Variable    ${index + 1}
    Return From Keyword    ${-1}    # Also [Return] would work here.
