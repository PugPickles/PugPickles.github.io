#!/bin/bash

DISABLE_THEME="false"
LOGIN_PAGE="/usr/local/emhttp/webGui/include/.login.php"

# Restore login.php
if [ ${DISABLE_THEME} = "true" ]; then
  echo "Restoring backup of login.php" 
  cp -p ${LOGIN_PAGE}.backup ${LOGIN_PAGE}
  exit 0
fi

# Backup login page if needed.
if [ ! -f ${LOGIN_PAGE}.backup ]; then
  echo "Creating backup of login.php" 
  cp -p ${LOGIN_PAGE} ${LOGIN_PAGE}.backup
fi


sed -i -e "\@<style>@i\    <link data-tp='theme' rel='stylesheet' href='https://pugpickles.github.io/style.css'>" ${LOGIN_PAGE}
