@echo off

set args=

:start
	if [%1] == [] goto bash
	set args=%args% %1
	shift
	goto start

:bash
	bash -c "ctags %args%"
