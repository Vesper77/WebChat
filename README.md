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
 To activate -  input "/bot n", where n - number of messages which you will get from bot
) To change localization to russian put locale=ru as a query parameter 

5: To run the app exec:<br>
    $rails s<br>
    It runs connection on 
    https://localhost:3001<br>
    Remember to config your SSL certificate in config/config.yml

P.S Test users info:
 Email: Alex@google.com<br>
 Password: 123456
 
P.S.S To change swagger description:
1: Make changes in controllers 
2: $rake swagger:docs
3: open https://localhost:3001/api and put in input<br>
 https://localhost:3001/api/v1/<controller_name>.json to see<br>
 API description on <controller_name> 

