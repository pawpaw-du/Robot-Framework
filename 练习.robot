*** Test Cases ***
循环
    :FOR    ${i}    INRANGE    10
    \    log    i=${i}
    :FOR    ${j}    INRANGE    2    10
    \    log    j=${j}
    :FOR    ${k}    INRANGE    10    1    -2
    \    log    k=${k}
    :FOR    ${m}    IN    a    v    b
    \    log    m=${m}
    Comment    嵌套循环
    :FOR    ${n}    IN    10    11    12
    \    log    n=${n}
    \    ForJ    ${n}

分支
    ${a}    set variable    0
    ${b}    set variable    5
    Comment    多行写法,下一行的三个点不可少
    runkeywordif    ${a}    log    1
    ...    ELSE IF    ${b}<=4    log    2
    ...    ELSE    log    3
    Comment    单行写法
    runkeywordif    ${a}    log    1
    ...    ELSE IF    ${b}<=4    log    2
    ...    ELSE    log    3

condition
    :FOR    ${i}    INRANGE    10
    \    log    i=${i}
    \    runkeywordif    ${i}>=5    exitforloop
    :FOR    ${i}    INRANGE    10
    \    log    i=${i}
    \    exitforloopif    ${i}>=8

Return Value
    ${getArg1}    返回一个值    arg
    log    ${getArg1}

Return 2Value1Scalar
    [Documentation]    两个返回值时，${getArg2}转换成list
    ${getArg2}    返回2个值    arg
    log    ${getArg2}

ReturnValue list接收
    [Documentation]    两个返回值时，${getArg2}转换成list
    @{getArg2}    返回2个值    arg
    log    =@{getArg2}=

Return 2Value2Scalar
    [Documentation]    两个返回值时，${getArg2}转换成list
    ${getArg1}    ${getArg2}    返回2个值    arg
    log    ${getArg1}###${getArg2}

返回值个数大于取值变量个数
    [Documentation]    取值两个，返回值3个时，前面的${getArg1}取变量赋值；最后一个${getArg2}转换成list来接收两个变量值
    ${getArg1}    ${getArg2}    返回3个值    arg
    log    ${getArg1}；${getArg2}

list变量返回
    [Documentation]    取值两个，返回值3个时，前面的${getArg1}取变量赋值；最后一个${getArg2}转换成list来接收两个变量值
    ${getArg3}    list返回值    arg1    \    arg3
    log    ${getArg3}
    @{ListArg3}    list返回值    arg1    \    arg3    大大大
    log    @{getArg3}

大于
    ${a}    set variable    5
    ${b}    set variable    6
    runkeywordif    ${a}>${b}    log    >
    ...    ELSE IF    ${a}<${b}    log    <
    ...    ELSE    log    ==

and
    ${a}    set variable    5
    ${b}    set variable    6
    runkeywordif    ${a}and${b}    log    >
    ...    ELSE IF    ${a}<${b}    log    <
    ...    ELSE    log    ==

单一条件
    ${status}    set variable    0
    runkeywordif    ${status}<=3    log    right
    ...    ELSE    log    error
    ${status}    set variable    0
    runkeywordif    ${status}==True    log    right
    ...    ELSE    log    error
    runkeywordif    ${status}==False    log    right
    ...    ELSE    log    error

多个条件
    ${status}    set variable    5
    runkeywordif    ${status}<=3    log    right
    ...    ELSE IF    ${status}>4    log    error
    ...    ELSE    log    end

预留返回值IF条件
    ${status}    set variable    0
    ${result}    runkeywordif    ${status}<=3    setvariable    right
    \    ...    ELSE    setvariable    error
    ${status1}    set variable    1
    ${result1}    set variable if    ${status}<=3    right

多个条件字符对比
    ${status}    set variable    "ok"
    runkeywordif    ${status}=="ok"    log    right
    ...    ELSE IF    ${status}==“error”    log    error
    ...    ELSE    log    end
    Comment    字符时要加引号
    ${network}    set variable    'wifi'
    runkeywordif    ${network}=="FE"    log    FE
    ...    ELSE IF    ${network}=="wifi"    log    wifi
    ...    ELSE    log    end

多个条件布尔型对比
    ${status}    set variable    ${False}
    runkeywordif    ${status}=="${true}"    log    1
    ...    ELSE IF    ${status}==${False}    log    2
    ...    ELSE    log    3

判定是否包含元素
    @{status}    create list    ${False}    123    4
    ${num}    set variable    123
    runkeywordif    ${num} in @{status}    log    1
    ...    ELSE    log    2
    Comment    多个判定
    @{status}    create list    ${False}    123    4    xx
    ${num}    set variable    123
    ${string}    set variable    xx
    runkeywordif    ${num} in @{status}and ${string}in@{status}    log    1
    ...    ELSE    log    2

列表是否相等
    @{status}    create list    ${False}    123    4
    @{num}    create list    123    ${False}    4
    runkeywordif    @{num} == @{status}    log    yes
    ...    ELSE    log    no
    Comment    多个判定
    @{status}    create list    ${False}    123    4    xx
    @{num}    create list    ${False}    123    4    xx
    runkeywordif    @{num} == @{status}    log    yes
    ...    ELSE    log    no

列表中的元素是否相等
    @{status}    create list    ${False}    123    4
    @{num}    create list    123    ${False}    4
    runkeywordif    @{num}[1] == @{status}[0]    log    yes
    ...    ELSE    log    no
    Comment    多个判定
    @{status}    create list    ${False}    123    4    xx
    @{num}    create list    ${False}    123    4    xx
    runkeywordif    @{num}[0] == @{status}[0]    log    yes
    ...    ELSE    log    no

get赋值
    ${getVal1}    getlength    ""
    log    ${getVal1}
    ${getVal2}    getlength    ${EMPTY}
    log    ${getVal2}
    ${time}    get time
    log    ${time}

字符串-截取值-嵌套
    ${getVal1}    getlength    ""
    log    ${getVal1}
    ${getVal2}    getlength    ${EMPTY}
    log    0123length${getVal1}abcd
    ${time}    get time
    log    ${time}
    Comment    取值某一位的值
    ${val2}    set variable    adbckkkggg
    log    ${val2[0]}
    log    ${val2[3:5]}    #实际取值范围等价于[3:5)或[3:4]

*** Keywords ***
ForJ
    [Arguments]    ${arg1}
    [Documentation]    定义循环体，定义循环变量${arg1}
    :FOR    ${j}    INRANGE    5
    \    log    arg=${arg1};j=${j}

返回一个值
    [Arguments]    ${arg1}    ${arg2}=123    @{arg3}
    [Documentation]    三个变量，list放置最后
    log    ${arg1}
    log    ${arg2}
    log    =@{arg3}=
    [Return]    ${arg1}

返回2个值
    [Arguments]    ${arg1}    ${arg2}=123    @{arg3}
    [Documentation]    三个变量，list放置最后
    log    ${arg1}
    log    ${arg2}
    log    =@{arg3}=
    [Return]    ${arg1}    ${arg2}

返回3个值
    [Arguments]    ${arg1}    ${arg2}=123    @{arg3}
    [Documentation]    三个变量，list放置最后
    log    ${arg1}
    log    ${arg2}
    log    =@{arg3}=
    [Return]    ${arg1}    ${arg2}    ${arg1}

list返回值
    [Arguments]    ${arg1}    ${arg2}=123    @{arg3}
    [Documentation]    三个变量，list放置最后
    log    ${arg1}
    log    ${arg2}
    log    =@{arg3}=
    [Return]    @{arg3}
