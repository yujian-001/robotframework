*** Settings ***
Library    SeleniumLibrary    implicit_wait=10
Library   Collections
Variables    config.py   #调用变量边里面的参数


#用户关键字
*** Keywords ***
setup webtest
    Open Browser    http://localhost     chrome     #打开浏览器，没有具体的网站

teardown webtest
    Close Browser      #关闭浏览器

loginwebsite
    [Documentation]    封装登陆模块
    [Arguments]       ${url}    ${username}    ${password}
    Go To               ${url}     #调用变量表里面的参数,打开指定的网址
    Input Text       id=username      ${username}  #调用变量表里面的参数,打开指定的网址
    Input Text       id=password      ${password}  #调用变量表里面的参数,打开指定的网址
    Click Element     tag=button

AddCourse
    [Arguments]      ${name}    ${desc}    ${index}     #输入的变量参数化，增加代码的复用性，添加课程用户关键字
    clcik Element     css=*[href='#/courser']    #直接点击课程图标，进行相关的操作
    sleep  1

    Click Element     css=*[ng-click='showAddOne=true']     #点击添加课程按钮
    #输入课程名，课程描述，课程的序号,点击确定按钮
    Input Text        css=*[ng-model='addDate.name']       ${name}
    Input Text        cs=*[ng-model='addDate.desc']        ${desc}
    Input Text        css=*[ng-model='addDate.display_index']      ${index}
    Click Element     css=*[ng-click='addOne()']

GetCourseList
    #获取课程名称列表对象
    clcik Element     css=*[href='#/courser']
    sleep  1

    ${eles}=     Get Elements    css=tr>td:nth-child(2)
    ${course}=    create list      #创建空的course列表对象
    :FOR    ${ele}      IN  @{eles}
    \       log to console      ${ele.text}
    \       append to list      ${course}    ${ele.text}      #将ele.text文本信息插入到coure列表中
    log to console      ${course}

    [Return]     ${course}      #类似函数，返回课程列表对象

deletAllCourse
    [Documentation]      #使用用户关键字定义删除课程
    loginwebsite    ${adminuser}[name]    ${adminuser}[password]          #调用用户关键字表里面的用户关键字
    set selenium implicit wait    1
    :FOR    ${one}    IN   RANGE    9999
    \       ${eles}   get webelements    css=button[ng-click^='delOne']
    \       exit for loop if      $eles==[]        #如果eles对象为空，则退出循环
    \       Click Element         @{eles}[0]
    \       sleep                 1

    set selenium implicit wait    10

AddTeacher  #添加老师用户关键字
    [Arguments]      ${ realname}   ${username}     ${desc}    ${index}    ${lesson}     #输入的变量参数化，增加代码的复用性，添加课程用户关键字
    Click Element     css=*[ng-click='showAddOne=true']     #点击添加课程按钮
    #输入课程名，课程描述，课程的序号,点击确定按钮
    Input Text        css=input[ng-model='addDate.realname']       ${realname}
    Input Text        css=input[ng-model='addDate.name']       ${username}
    Input Text        cs=*[ng-model='addDate.desc']        ${desc}
    Input Text        css=*[ng-model='addDate.display_index']      ${index}

    select from list by label    css=select[ng-model='$parent.courseSelected']   ${lesson}  #点击下拉框选项

    Click Element     css=button[ng-click='addEditData.addTeacgerCourse()']   #点击添加按钮

    Click Element     css=*[ng-click='addOne()']  #点击确定按钮

GetTeacherList
    #获取课程名称列表对象
    ${eles}=     Get Elements    css=tr>td:nth-child(2)
    ${teacher}=    create list      #创建空的course列表对象
    :FOR    ${ele}      IN  @{eles}
    \       log to console      ${ele.text}
    \       append to list      ${teacher}    ${ele.text}      #将ele.text文本信息插入到coure列表中
    log to console      ${teacher}

    [Return]     ${teacher}      #类似函数，返回课程列表对象

deletAllTeacher
    [Documentation]      #使用用户关键字定义删除课程
    loginwebsite    ${adminuser}[name]    ${adminuser}[password]          #调用用户关键字表里面的用户关键字
    set selenium implicit wait    1
    :FOR    ${one}    IN   RANGE    9999
    \       ${eles}   get webelements    css=button[ng-click^='delOne']
    \       exit for loop if      $eles==[]        #如果eles对象为空，则退出循环
    \       Click Element         @{eles}[0]
    \       sleep                 1

    set selenium implicit wait    10