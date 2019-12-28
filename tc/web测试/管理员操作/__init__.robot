*** Settings ***
Resource  rflib/rc5.robot

#Suite Setup   loginwebsite   ${url}    &{adminuser}[name]    &{adminuser}[password]     #登陆的初始化操作,所有的测试用例都
Suite Setup   loginwebsite
