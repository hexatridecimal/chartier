source config.sh
haml index.haml > index.html
coffee -c poll.coffee
sass style.sass > style.css
./upload.rb
