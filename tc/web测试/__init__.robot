*** Settings ***
Resource  rflib/rc5.robot
Suite Setup     setup webtest       #打开一次浏览器初始化动作
Suite Teardown      teardown webtest    #关闭一次浏览器清除动作