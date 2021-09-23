## Introduction
This service will check whether the network is avaliable or not.
If network is dead, it will trigger reboot command.

## Notice
This service recommand to use with linux **crontab** service.


## crontab command

```shell=
# ┌───────────── 分鐘 Minutes   (0 - 59)
# │ ┌─────────── 小時 Hours  (0 - 23)
# │ │ ┌───────── 日 Days    (1 - 31)
# │ │ │ ┌─────── 月 Months    (1 - 12)
# │ │ │ │ ┌───── 星期幾 Day of the week 
# │ │ │ │ │	 (0 - 7，0 是週日，6 是週六，7 也是週日)
# │ │ │ │ │	 
# * * * * * /path/to/command
```


## Links
[Reboot if ping fails](https://community.spiceworks.com/topic/457945-reboot-if-ping-fails)
[Linux 設定 crontab 例行性工作排程教學與範例](https://blog.gtwang.org/linux/linux-crontab-cron-job-tutorial-and-examples/)
