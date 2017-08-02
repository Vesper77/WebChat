# ChatApplication

1) Config your postgres connection in config/database.yml<br>
  
2)  $ bundle install <br>
$ rake db:setup<br>
   $ rake db:migrate<br>
   $ rake db:seed<br>
3) To activate bot:<br>
 $bundle exec rake environment resque:work QUEUE=sleep<br>
 If you will input "/bot n", where n - number of messages which you will get from bot
4) To change localization to russian put locale=ru as a query parameter 