# TriggerSql только для TSql

DECLARE @... - переменная которая хранится в опеативке можем обращаться только в одном окне

CREATE TABLE #...  - временная таблица существующая только в одном окне, используется также как и пременная 

CREATE TABLE ##...  - глобальная таблица существующая во всех окнах, сущесвтует в опреативке, во время соединения или во время выполнения скрипта
