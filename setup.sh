#!/bin/sh

# variables
NODEJS_SITE="http://nodejs.org/"
LOGFILE="setup.log"

# Node.js
if type node >/dev/null 2>&1; then
    echo " node:" `node -v`
    echo "  npm:" `npm -v`
else
    echo "Node.js is not installed. Please install it form the site: $NODEJS_SITE"
    if type open >/dev/null 2>&1; then
        open $NODEJS_SITE
    fi
    exit 1
fi

echo "" > $LOGFILE

# yeoman
sudo npm install -g yo >> $LOGFILE 2>&1
if [ $? -eq 0 ]; then
    echo "   yo:" `yo --version`
else
    exit 1
fi

# Grunt
sudo npm install -g grunt-cli >> $LOGFILE 2>&1
if [ $? -eq 0 ]; then
    echo "grunt:" `grunt --version`
else
    exit 1
fi

# Bower
sudo npm install -g bower >> $LOGFILE 2>&1
if [ $? -eq 0 ]; then
    echo "bower:" `bower --version`
else
    exit 1
fi

# Sass
sudo gem install sass >> $LOGFILE 2>&1
if [ $? -eq 0 ]; then
    echo "sass: " `sass --version`
else
    exit 1
fi
    
# rff-doctor
sudo npm install -g rff-doctor >> $LOGFILE 2>&1
if [ $? -eq 0 ]; then
    rff-doctor
else
    exit 1
fi

exit 0
