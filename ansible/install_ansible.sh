#!/bin/bash

apt-get update &&
    apt-get upgrade -y &&
    apt-get install -y software-properties-common &&
    apt-add-repository -y ppa:ansible/ansible &&
    apt-get update &&
    apt-get install -y ansible &&
    apt-get clean autoclean &&
    apt-get autoremove --yes
