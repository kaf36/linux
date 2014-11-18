#!/bin/bash
echo "Архиватор(архивация, деархивация). Автор: студент группы К01-361 Степаненко Даниил."
pr="y"
while [ "$pr" = "y" ]
do
exec 2>/dev/null
echo "Выберите режим работы:"
echo "1 - архивация"
echo "2 - извлечение из архива"
echo "3 - выход"
read doing
case $doing in
1)
    var=""
    while [ "$var" = "" ]
    do
    echo "Укажите каталог архива:"
    read path
    var=$(ls -l | grep "$path")
    if [ "$var" = "" ]; then
    echo "$(tput setaf 1)Нет такого каталога, попробуйте снова$(tput setaf 0)"
    fi
    done
    
    echo "Укажите имя архива:"
    read name
    tar -cvzf $name $path;;
2)  
    var1=""
    while [ "$var1" = "" ]
    do
    echo "Укажите имя архива:"
    read archname
    var1=$(ls -l | grep "$archname")
    if [ "$var1" = "" ]; then
    echo "$(tput setaf 1)Архива не существует или он имеет тип, отличный от tar. Попробуйте снова.$(tput setaf 0)"
    fi
    done
    tar -xvzf $archname;;
3)
    exit 0;;
*)
    echo "$(tput setaf 1)Введено неправильное действие.$(tput setaf 0)"
esac

echo "$(tput setaf 2)Хотите продолжить?(y/n)$(tput setaf 0)"
read pr

done
