title: Set up Jira on a linode server and problems I've encountered
date: 2017-03-11 10:01:12
tags:
    - jira
    - life
    - linode
    - development
    - management
categories:
    - tool
---
# Set up JIRA on a linode server and problems I've encountered.
Was installing jira on my linode server, and encountered a few problems, which solved with some invetigations. This blog post will take a note of some problems and how I solved them.

#### Environment
Currently using a linode server, running 'Ubuntu 16.04 LTS x86_64' on it. I haven't used this server a lot. Only installed a gitlab instance on it for my personal usage.

#### Database Setup
At first, I was deciding to install postgreSQL as the database for JIRA to connect to. But I quickly discovered, because I've installed gitlab already on my server, which has installed postgreSQL itself during its installation process, and has created a dedicated unix user for using postgreSQL. Because I wanted to keep gitlab running and don't want to mess up with it, I decided to give up postgreSQL.

Then after installing jira and run it up for the first time in browerser, there's a set-up wizard, which gives the option as using a **built-in** database named **HSQLDB**. But after the set-up wizard finished, jira keeps crashing continuously. After I `service jira start`, it holds on running for several minutes, then crashed. This happened a lot of times, and in `/var/log/syslog`, I saw something related to *JVM out of memory*. I was initially suspecting it's due to some limitations of
this **built-in** database that's casuing JIRA to crash. (Although finally I realized that's not the case). But anyway, since jira doc also suggests that **HSQLDB** should only be used to evaluation purpose and for production purpose it's better to use an external db, I decided to change to **mysql** at this point.

After `apt-get install mysql`, I tried to run `mysql`, which shows error msg:
```bash
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)
```

After checking `service mysql status`, I get this:
```bash
● mysql.service - MySQL Community Server
   Loaded: loaded (/lib/systemd/system/mysql.service; enabled; vendor preset: enabled)
      Active: inactive (dead) (Result: exit-code) since Sat 2017-03-04 13:03:20 UTC; 3h 23min ago

      Mar 04 13:03:20 ubuntu systemd[1]: mysql.service: Control process exited, code=exited status=1
      Mar 04 13:03:20 ubuntu systemd[1]: Failed to start MySQL Community Server.
      Mar 04 13:03:20 ubuntu systemd[1]: mysql.service: Unit entered failed state.
      Mar 04 13:03:20 ubuntu systemd[1]: mysql.service: Failed with result 'exit-code'.
      Mar 04 13:03:20 ubuntu systemd[1]: mysql.service: Service hold-off time over, scheduling restart.
      Mar 04 13:03:20 ubuntu systemd[1]: Stopped MySQL Community Server.
      Mar 04 13:03:20 ubuntu systemd[1]: mysql.service: Start request repeated too quickly.
      Mar 04 13:03:20 ubuntu systemd[1]: Failed to start MySQL Community Server.
      ```

      Then I realized this is a stupid mistake, as I haven't started mysql-server service. Then running `service mysql start` gives:
      ```bash
      Job for mysql.service failed because the control process exited with error code. See "systemctl status mysql.service" and "journalctl -xe" for details.
      ```

      In `/var/log/syslog`, there's an important error message:
      ```bash
      Mar 4 16:55:12 ubuntu mysql-systemd-start[5060]: MySQL system database not found. Please run mysql_install_db tool.
      ```
      This clearly shows that I haven't initialized mysql database after installtion. Run `mysql_install_db` shows yet more warning and error:
      ```bash
      2017-03-04 16:56:59 [WARNING] mysql_install_db is deprecated. Please consider switching to mysqld --initialize
      2017-03-04 16:56:59 [ERROR]   The data directory needs to be specified.
      ```

      Fine, seems the command `mysql_install_db` is deprecated, and I probbaly need to run the new command `mysqld --initialize`, which gives yet more errors...
      ```bash
      2017-03-04T16:57:51.080833Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
      2017-03-04T16:57:51.082478Z 0 [ERROR] --initialize specified but the data directory has files in it. Aborting.
      2017-03-04T16:57:51.082585Z 0 [ERROR] Aborting
      ```
      After some search on google, trying to find where is the data directory for mysql, I finally find hints in this [StackOverflow answer](http://stackoverflow.com/a/10209282/3548195). It shows that the data directory should be `/var/lib/mysql`. This must be correct, as there are currently some files there, which seem to cause the previous error. Now I deleted these files: `rm /var/lib/mysql/*`.

      Finally all the commands begin to work as magic without any errors:
      ```bash
      root~$:mysqld --initialize
      root~$:service mysql start
      root~$:service mysql status
      ● mysql.service - MySQL Community Server
         Loaded: loaded (/lib/systemd/system/mysql.service; enabled; vendor preset: enabled)
            Active: active (running) since Sat 2017-03-04 17:10:03 UTC; 2min 17s ago
              Process: 6363 ExecStartPost=/usr/share/mysql/mysql-systemd-start post (code=exited, status=0/SUCCESS)
                Process: 6359 ExecStartPre=/usr/share/mysql/mysql-systemd-start pre (code=exited, status=0/SUCCESS)
                 Main PID: 6362 (mysqld)
                    CGroup: /system.slice/mysql.service
                               └─6362 /usr/sbin/mysqld

                               Mar 04 17:10:02 ubuntu systemd[1]: Starting MySQL Community Server...
                               Mar 04 17:10:03 ubuntu systemd[1]: Started MySQL Community Server.
                               ```
#### Database Driver
                               Was running into after problem related to **mysql**. JIRA requires you to manually download the **connectorJ** driver. However, the file downloaded from the link given by JIRA doc, is actually named `mysql-connector-java-5.1.41.tar.gz`. After I unzipped it, I thought the **tar** should be the driver file, and copied into JIRA's lib directory, but it turned out to fail, as when setting up JIRA it prompts can't find driver class.

                               I finally solved this problem by untar the **tar**, which gives a folder, where inside the folder there's actually another **tar** named `mysql-connector-java-5.1.41-bin.jar`. Note the difference as this one has the **bin** part. This is the actual **jar** file you need to put in JIRA lib directory. Now JIRA can connect to database without any more complaints.

#### JIRA still crashes and final solution
After JRIA connects to mysql successfully, it still continues to crash every a while. Then I searched this problem especially with the keyword `linode` and I came to this official Atlassian Documentation: [Connection of Jira on Linode break after few minutes](https://confluence.atlassian.com/jirakb/connection-of-jira-on-linode-break-after-few-minutes-815585943.html), which looks extremely like my case, and I immediately realized my initial setting for linode also has a very small
SWAP size (which was around 248MB, not even 1GB mentioned in this doc).

Finally I followed the 'woraround' advice given in this doc, and resize the linode swap size to 2048MB. Voila, finally I have a JIRA instance running smoothly on my linode!.

I did some small tweaks later regarding reverse proxy, so I can have a nice subdomain pointing to jira instance at: http://jira.yongli1992.com. I might summarize this in another post!
