#!/bin/bash

unset LD_LIBRARY_PATH
echo "instance_id=$(/usr/bin/curl -s http://169.254.169.254/latest/meta-data/instance-id)"

