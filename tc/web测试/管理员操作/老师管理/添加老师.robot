*** Settings ***
Library    SeleniumLibrary    implicit_wait=10
Resource   rflib/rc5.robot      #导入资源文件
Variables   config.py     #导入变量文件，需要带文件名

*** Test Cases ***
添加老师测试1
    [Documentation]     添加课程初始化和清除操作
    [Setup]       deleteAllTeacher       #调用资源文件rc5.robot的用户关键字

    AddTeacher     庄子    zhuangzi      庄子老师    2    初中语文
    AddTeacher     孔子    kongzi      孔子老师    1    初中语文
    ${course}=    GetTeacherList    #将用户关键字的返回结果赋值给一个变量

    should be true      $course==['孔子','庄子']

    [Teardown]     deleteAllTeacher      #调用资源文件rc5.robot的用户关键字


#C:\Users\Administrator\PycharmProjects\selenium_test\task>robot --pythonpath . tc ,在task根目录执行测试套件目录