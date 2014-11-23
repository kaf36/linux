#!/bin/sh

echo 'Текущая директория'
pwd
echo 'Введите название файла'
read file
str="$(find . -name $file)"
while [[ "$str" = "" ]]
do
	echo 'Данного файла не существует. Введите название существующего файла'
	read file
	str="$(find . -name $file)"
done
echo 'ok'
date_f="$(stat -c %x $file|cut -c1-10)"
echo 'Введите дату в формате ГГГГ-ММ-ДД'
read date_u
if [[ "$date_u" -gt "$date_f" ]]
then
	echo 'Доступ к файлу осуществлялся после указанной даты'
	exit 0
else
	echo 'Доступ к файлу не осуществлялся после указанной даты'
	exit 120
fi
