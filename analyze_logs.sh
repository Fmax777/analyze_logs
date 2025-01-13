#!/bin/bash

total_requests=$(awk 'END { print NR }' access.log) 

ip=$(awk '{print $1}' access.log | sort | uniq | wc -l) 

get=$(awk '/GET/ { ++count } END { print count }' access.log) 
post=$(awk '/POST/ { ++count } END { print count }' access.log) 

url=$(awk '{print $7}' access.log | sort | uniq -c | sort -nr | head -n 1)

{
	echo "Отчет о логе веб-сервера"
	echo "========================"
	echo "Общее количество запросов: $total_requests"
	echo "Количество уникальных IP-адресов: $ip"
	echo "Количество запросов по методам:"
	echo "		$get GET"
	echo "		$post POST"
	echo "Самый популярный URL:    $url"
} > report.txt

echo "Отчет сохранен в файл report.txt"