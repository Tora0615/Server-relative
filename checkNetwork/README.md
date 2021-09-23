## Introduction
This service will check whether the network is avaliable or not.
If network is dead, it will trigger reboot command.

## Notice
This service recommand to use with linux **crontab** service.
**Warning** : this script **MUST** run in root user's credentials.
   * So use ```sudo crontab -e``` to add the command.

## crontab setting

* Use ```crontab -e``` to edit settings.

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

* example : 
```*/10 * * * * /home/user/service/checkNetwork.sh > /dev/null 2>&1```

--> Every 10 minute execute checkNetwork.sh

* sysyem log when running success : 
```shell=
Sep 23 23:00:01 user-VirtualBox CRON[2183]: (root) CMD (/home/user/service/checkNetwork.sh > /dev/null 2>&1)
Sep 23 23:00:07 user-VirtualBox cron[591]: (CRON) INFO (pidfile fd = 3)
Sep 23 23:00:07 user-VirtualBox cron[591]: (CRON) INFO (Running @reboot jobs)
``` 

## Error records
### 1. Set crontab done but nothing happend.
#### A. Can use these two commands below to check whether the service is running : 
1. grep CRON /var/log/syslog 
   * This can see system log. Output will like this : 
    ```shell=
    Sep 23 20:50:01 user-VirtualBox CRON[3715]: (CRON) info (No MTA installed, discarding output)
    Sep 23 21:00:01 user-VirtualBox CRON[3728]: (user) CMD (/home/user/service/checkNetwork.sh)
    ```
2. ps -ef | grep cron | grep -v grep
   * This can see whether the service is running or not. Output will like this : 
   ```shell=
   root       613     1  0 15:06 ?        00:00:00 /usr/sbin/cron -f
   ```

#### B. Use sudo crontab -e to add command
This will run the command or script in root.


### 2. System log : (CRON) info (No MTA installed, discarding output)
Solution : Add ```> /dev/null 2>&1``` in the command end. 

This will redirect output to NULL file. (A file can let output disappear.)

Or you can install mail service.



## Links
[Reboot if ping fails](https://community.spiceworks.com/topic/457945-reboot-if-ping-fails)

[Linux 設定 crontab 例行性工作排程教學與範例](https://blog.gtwang.org/linux/linux-crontab-cron-job-tutorial-and-examples/)

[crontab 開機自動執行指令](https://www.opencli.com/linux/crontab-autorun-command-boot)
