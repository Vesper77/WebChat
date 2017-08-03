# ChatApplication
1: To download this app you need to execute: <br>
$ git clone git@github.com:Vesper77/WebChat.git <directory name>

2: Config your postgres connection in config/database.yml<br>
  
3:  $ bundle install <br>
$ rake db:setup<br>
   $ rake db:migrate<br>
   $ rake db:seed<br>
   
4: To activate bot:<br>
 $bundle exec rake environment resque:work QUEUE=sleep<br>
 If you will input "/bot n", where n - number of messages which you will get from bot
) To change localization to russian put locale=ru as a query parameter 