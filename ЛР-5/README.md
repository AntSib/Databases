# Лабораторная работа №5
Тема: Нормальные формы
## Отчёт

### Задание 1:
Постройте ОДНО отношение, которое включает ВСЕ атрибуты, которые заявлены в предметной области.

| **Модель** 	| **Серийный   номер** 	| **Производитель** 	| Объём памяти 	| Скорость вращения шпинделя   об\мин 	| Тип интерфейса 	| Дата приобретения 	| Дата выхода из строя 	| Web-сайт 	| Комментарии по поводу работы 	|
|:----------:	|:--------------------:	|:-----------------:	|:------------:	|:-----------------------------------:	|:--------------:	|:-----------------:	|:--------------------:	|:--------:	|:----------------------------:	|
| MQ01       	| MQ01ABF050           	| Toshiba           	| 500          	| 5400                                	| SATA 3         	| 02.05.2023        	| -                    	| link     	| None                         	|
| Black      	| WD5000LPSX           	| Western Digital   	| 500          	| 7200                                	| SATA 3         	| 15.08.2019        	| -                    	| link     	| None                         	|

### Задание 2:
Приведите отношение до 3НФ. Произведите декомпозицию в
соответствии с требованиями.


| **Серийный номер** 	|   Модель   	|  Производитель  	|
|:------------------:	|:----------:	|:---------------:	|
| bx4t7xbsd8         	| MQ01ABF050 	| Toshiba         	|
| 57drg5szf8         	| WD5000LPSX 	| Western Digital 	|


| Серийный номер 	| Дата приобретения 	| Дата выхода из строя 	| Комментарии по поводу работы 	|
|:--------------:	|:-----------------:	|:--------------------:	|:----------------------------:	|
| bx4t7xbsd8     	| 02.05.2023        	| -                    	| None                         	|
| 57drg5szf8     	| 15.08.2019        	| -                    	| None                         	|


|   Модель   	| Объём памяти 	| Скорость вращения шпинделя   об\мин 	| Тип интерфейса 	|
|:----------:	|:------------:	|:-----------------------------------:	|:--------------:	|
| MQ01ABF050 	| 500          	| 5400                                	| SATA 3         	|
| WD5000LPSX 	| 500          	| 7200                                	| SATA 3         	|


|  Производитель  	| Web-сайт 	|
|:---------------:	|:--------:	|
| Toshiba         	| link     	|
| Western Digital 	| link     	|


### Задание 3:
Найдите первичные ключи каждого полученного отношения на этапе 3НФ.




### Задание 4:
Рассмотрите функциональные зависимости полученных конечных отношений. Если все зависимости отвечают требования НФБК – работа закончена.
Напоминание требований НФБК:
<ul>
  <li>детерминант ФЗ является потенциальным (первичным ключом).</li>
  <li>естественное соединение полученных проекций должно дать исходное отношение.</li>
</ul>


