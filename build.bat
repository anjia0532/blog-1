@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:clean
echo =======���hexo���ɵĻ����ļ�========
start hexo clean

:deploy
echo =======������̬�ļ������𵽷�����========
start hexo deploy

:push
echo =======�ύ���뵽github=========
git add --all
git commit -m "%1 || update"
git push

pause