#!/bin/sh

# check whether Mac OS
PRODUCT=`sw_vers -productName`
if [ "$PRODUCT" == "Mac OS X" ]; then
    echo "This script can only run on Mac OS X."
    exit 1
fi

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
npm install -g yo >> $LOGFILE
if [ $? -eq 0 ]; then
    echo "   yo:" `yo --version`
else
    exit 1
fi

# Grunt
npm install -g grunt-cli >> $LOGFILE
if [ $? -eq 0 ]; then
    echo "grunt:" `grunt --version`
else
    exit 1
fi

# Bower
npm install -g bower >> $LOGFILE
if [ $? -eq 0 ]; then
    echo "bower:" `bower --version`
else
    exit 1
fi

# Sass
gem install sass >> $LOGFILE
if [ $? -eq 0 ]; then
    echo "sass: " `sass --version`
else
    exit 1
fi
    
# rff-doctor
npm install -g rff-doctor >> $LOGFILE
if [ $? -eq 0 ]; then
    rff-doctor
else
    exit 1
fi

exit 0
