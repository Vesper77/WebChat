# ChatApplication
1: To download this app you need to execute: <br>
$ git clone git@github.com:Vesper77/WebChat.git \<directory name>

2: Config your postgres connection in config/database.yml<br>
  
3:  $ bundle install <br>
$ rake db:setup<br>
   $ rake db:migrate<br>
   $ rake db:seed<br>
   
4: To activate bot:<br>
 $bundle exec rake environment resque:work QUEUE=sleep<br>
 If you will input "/bot n", where n - number of messages which you will get from bot
) To change localization to russian put locale=ru as a query parameter 

5: To run the app exec:
    $rails s<br>
    It will run two connections:<br>
    1. http://localhost:3000<br>
    2. https://localhost:3001<br>
    Remember to config your SSL certificate in config/config.yml

P.S Test users info:
1) Email: Alex@google.com<br>
   Password: 123456
