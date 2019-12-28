*** Settings ***
Library    SeleniumLibrary    implicit_wait=10
Resource   rflib/rc5.robot      #导入资源文件
Variables   config.py     #导入变量文件，需要带文件名

*** Test Cases ***
添加课程测试1
    [Documentation]     添加课程初始化和清除操作
    [Setup]       deleteAllCourse       #调用资源文件rc5.robot的用户关键字

    AddCourse     化学     化学课程     5
    ${course}=    GetCourseList    #将用户关键字的返回结果赋值给一个变量

    should be true      $course==["化学"]

    [Teardown]     deleteAllCourse      #调用资源文件rc5.robot的用户关键字