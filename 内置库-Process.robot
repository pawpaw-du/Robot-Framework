*** Settings ***
Library           Process

*** Test Cases ***
Process进程
    [Documentation]    进程有关的操作
    ${result}    run process    python    -c    print 'robot'
    log    ${result.stdout}
    run process    python    -c    print 'rf'    alias=RF
    ${presult}    get process result    RF
    start process    python    alias=py2
    start process    ping    alias=ping
    switch process    py2
    terminate all processes
