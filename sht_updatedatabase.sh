#!/usr/bin/env bash
set -e

# 如果需要的话，把下面变量改成你自己的容器名
APP_CONTAINER="sht"

echo "🚀 在容器 $APP_CONTAINER 中依次执行数据库初始化脚本..."

docker exec -it "$APP_CONTAINER" sh -c "\
  cd /app && \
  python -m database.database_create && \
  python manage.py makemigrations && \
  python manage.py migrate && \
  python -m database.database_init \
"

echo "🎉 数据库更新完成！"

#migrate 冲突解决办法
#方法1. 忽略已经存在的迁移
# python manage.py showmigrations
# python manage.py migrate <app_name> <migration_name> --fake
# 示例：python manage.py migrate reply 0003_add_isUp_field --fake
###
#方法2.恢复数据库结构到迁移状态
#例如补全字段 ：ALTER TABLE t66y_reply ADD COLUMN isUp TINYINT(1) DEFAULT 0;等等
#



