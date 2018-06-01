@ECHO OFF
@net user Visitor /add /active:yes
@net localgroup users Visitor /delete
@net localgroup guests Visitor /add
