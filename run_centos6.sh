#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)

docker-compose run --rm centos6 /work/create_yum_repos.sh
