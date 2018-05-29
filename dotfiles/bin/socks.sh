#!/bin/bash

IP=
LOGIN=

ssh -l ${LOGIN} -D 9999 -f -N ${IP} 2>/dev/null
