0x0C. Web server

A good Software Engineer is a lazy Software Engineer

Read or watch:
- How the web works
- Nginx
- How to Configure Nginx
- Child process concept page
- Root and sub domain
- HTTP requests
- HTTP redirection
- Not found HTTP response code
- Logs files on Linux

#### How to Execute/Run our exercises
##### 0. Transfer a file to your server
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ ./0-transfer_file
    - Usage: 0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ ssh ubuntu@18.207.236.1 -i ~/.ssh/id_rsa 'ls ~/'
    -   
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ touch some_page.html
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ ./0-transfer_file some_page.html 18.207.236.1 jewstechs ~/.ssh/id_rsa
    - jewstechs@18.207.236.1: Permission denied (publickey).
    - lost connection
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ ./0-transfer_file some_page.html 18.207.236.1 ubuntu ~/.ssh/id_rsa
    - some_page.html                                                                                  100%    0     0.0KB/s   00:00    
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$ ssh ubuntu@18.207.236.1 -i ~/.ssh/id_rsa 'ls ~/'
    - some_page.html
- jewstechs@Jewstechs:~/alx/alx-system_engineering-devops/0x0C-web_server$
