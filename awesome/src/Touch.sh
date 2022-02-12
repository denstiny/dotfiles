#!bin/bash

xinput --disable  `xinput  | grep Touch | awk -F ' ' '{print $6}' | awk -F '=' '{print $2}'`

