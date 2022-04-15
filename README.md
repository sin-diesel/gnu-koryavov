# Описание утилиты

gnu-koryavov - утилита командной строки Linux и MacOS, с помощью которой можно
получать номер страницы для заданной задачи в Корявнике разных семестров, а также автоматически скачивать нужную версию книги и открывать её на нужной странице.


# Использование

После [установки](https://github.com/sin-diesel/gnu-koryavov#%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0) `gnu-koryavov` может быть запущен командой вида

```shell
gnu-koryavov [ОПЦИИИ]
```

## Опции

- `-s <номер-семестра>`  
Эта опция отвечает за номер сместра. От неё будет зависет, в каком Корявнике будет идти поиск задачи
- `-n <номер-задачи>`  
Выбор задачи. Укажите номер задачи, которую хотите найти
- `-open`  
Открыть электронный Корявник. Задайте эту опцию, если хотите, чтобы в случае нахождения задачи в Корявнике скрипт загрузил открыл его электронную версию на нужной странице

### Обязательные опции

Некоторые опции являются обязательными, т.к. в случае их отсутствия скрипт не сможет однозначно интерпретировать входные данные (запуск вообще без опций в принципе не имеет смысла с практической точки зрения). Краткий список обязательных опций:

- `-s`
- `-n`

## Пример использования

```shell
gnu-koryavov -s 1 -n 1.11 -open
Выбранный семестр: 1
Выбранная задача: 1.11
Электронный корявник будет открыт
Задача 1.11 найдена на странице №25!
#вывод вспомогательной информации о скачивании и открытии электронного корявника
```



# Установка

```shell
git clone https://github.com/sin-diesel/gnu-koryavov
cd gnu-koryavov
./install.sh
```

# Конфигурация

Для работы `gnu-koryavov` требуется указать путь к скрипту, который будет открывать Корявник на нужной странице с помощью нужной программы. 

## Использование готовых скриптов

Текущая версия `gnu-koryavov` уже содержит набор скриптов для открытия Корявника в следующих программах:

- [Okular](https://github.com/KDE/okular)
- [Atril](https://github.com/mate-desktop/atril)
- [Evince](https://github.com/GNOME/evince)
- [Xreader](https://github.com/linuxmint/xreader)
- [Zathura](https://github.com/pwmt/zathura)
Для использования одного из них нужно лишь установить путь к нему в соответствии значению `pdfviewer_script` в файле `config.conf`.  
Это значение по умолчанию указывает на `~/gnu-koryavov/okular.sh`, поэтому, если Вы хотите использовать Okular, сразу после установки выполните (и можете приступать к использованию)

```shell
cp okular.sh ~/gnu-koryavov/
```

### Пример

Например, если Вы хотите использовать Atril, и скрипт `atril.sh` расположен в `/home/user/gnu-koryavov/atril.sh`, измените нужный параметр `config.conf` следующим образом

```shell
pdfviewer_script=/home/user/gnu-koryavov/atril.sh
```

## Использование другого средства просмотра

Вы можете создать скрипт, который будет открывать Корявник с помощью любой другой программы и настроить `gnu-koryavov` на его использование.  
Скрипт будет вызываться так:

```shell
./your-script <номер-семестра> <номер-страницы>
```

Скрипт должен открывать на указанной странице файл `<номер-семестра>.djvu`, расположенный в `~/gnu-koryavov/KORYAVNIKS`.

Чтобы `gnu-koryavov` запускал Ваш скрипт вместо `okular.sh`, в файле `~/gnu-koryavov/config.conf` измените значение параметра `pdfviewer_script` на путь к вашему скрипту, как это сделано по умолчанию. *Не забудьте поделиться этим скриптом со всеми пользователями `gnu-koryavov`, создав соответсвующий пулл-реквест!*

# Авторство и благодарности

Исполнение by [Сидельников Стас](https://vk.com/sindiesel)
Отдельная благодарность отдается [Талашкевичу Данику](https://vk.com/danik.princessa) за идею
и помощь в создании данной тулзы.
