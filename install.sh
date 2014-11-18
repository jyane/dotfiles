#!/bin/bash

_link() {
    pwd="$(pwd)"
    for f in $(ls -a ${pwd})
    do
        # TODO
        echo ${f}
    done
}

_link
