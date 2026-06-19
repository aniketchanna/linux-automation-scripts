#!/bin/bash

load=$(ps -afux | grep -i "%cpu" | awk {'print $3'} | sed 's/%CPU//g')
THRESHOLD=10

if [ $load -ge $THRESHOLD ]
kill -9 


