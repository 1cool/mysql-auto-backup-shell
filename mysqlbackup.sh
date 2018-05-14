#!/bin/bash
#定义备份文件路径
backupDir='/home/luobo/mysql/'

#当前日期
date=$(date "+%Y-%m-%d")
#七日前日期
sevenAgoDate=$(date -d '-7 days' "+%Y-%m-%d")

#备份文件名
sqlFile=${backupDir}${date}_label.sql.gz
sevenAgoSqlFile=${backupDir}${sevenAgoDate}_label.sql.gz

#如果备份文件路径不存在就创建，注意权限问题
if [ ! -d ${backupDir} ]; then
	mkdir ${backupDir}
fi

#删除七日前备份
if [ -f "${sevenAgoSqlFile}" ]; then
    rm -f ${sevenAgoSqlFile}
fi

mysqldump -uroot -p110 label |gzip >${sqlFile}
