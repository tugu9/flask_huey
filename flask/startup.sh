#!/bin/bash

# turn on bash's job control
set -m

# start webapp in the background 
./run_webapp.sh &

# start the huey in the foreground
./run_huey.sh

