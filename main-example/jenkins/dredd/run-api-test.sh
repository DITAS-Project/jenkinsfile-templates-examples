#!/usr/bin/env bash
COMPONENT_ENDPOINT="http://31.171.247.162:50011"
YAML_FILE="a.yaml"
attempts=0

until $(curl --output /dev/null --silent --head --fail $COMPONENT_ENDPOINT); do
    if [ ${attempts} -eq 3 ];then
      echo "Max attempts reached"
      exit 1
    fi

    printf '.'
    attempts=$(($attempts+1))
    sleep 5
done
dredd $YAML_FILE $COMPONENT_ENDPOINT