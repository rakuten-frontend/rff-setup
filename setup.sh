#!/bin/sh

# variables
NODEJS_SITE="http://nodejs.org/"
RUBY_SITE="https://www.ruby-lang.org/"
LOGFILE="setup.log"

# check OS
OS="Unknown"
case `sh --version` in
    *'apple'*)
        OS="Mac" ;;
    *'msys'*)
        OS="Windows" ;;
esac

# open URL
openURL() {
    if [ $# > 0 ]; then
        if [ $OS = 'Mac' ]; then
            open $1
        elif [ $OS = 'Windows' ]; then
            explorer $1
        fi
    fi
}

# Node.js
if type node >/dev/null 2>&1; then
    echo " node:" `node -v`
    echo "  npm:" `npm -v`
else
    echo "Node.js is not installed. Please install it form the site: $NODEJS_SITE"
    openURL $NODEJS_SITE
    exit 1
fi

echo "" > $LOGFILE

# Ruby
if type ruby >/dev/null 2>&1; then
    echo " ruby:" `ruby -v`
else
    echo "Ruby is not installed. Please install it form the site: $RUBY_SITE"
    echo "Additionally you should set PATH to execute ruby command and re-launch the shell window."
    openURL $RUBY_SITE
    exit 1
fi

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
