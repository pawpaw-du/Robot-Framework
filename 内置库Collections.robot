*** Settings ***
Library           Collections

*** Test Cases ***
collections（集合list ）
    comment    list    dictionary
    ${tuple}    Evaluate    (u'a',u'b',u'c',u'd')
    ${conlist}    Convert to List    ${tuple}
    append to list    ${conlist}    e    f
    insert into list    ${conlist}    1    q
    ${get}    get from list    ${conlist}    -2
    ${getindex}    get index from list    ${conlist}    c

collections（集合dictionary）
    comment    list    dictionary
    ${dict}    Create dictionary    a=1    b=2
    set to dictionary    ${dict}    a=3    c=4
    log dictionary    ${dict}
    remove from dictionary    ${dict}    a
    log dictionary    ${dict}
    keep in dictionary    ${dict}    b
    log dictionary    ${dict}
