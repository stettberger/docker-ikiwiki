#!/bin/bash

set -e

run_scripts() {
    local run_script_dir="${IKIWIKI_HOME}/scripts/${1}"
    ls ${run_script_dir}/*.sh | sort -n | while read script; do
        echo $script
        if [ -f ${script} -a -x ${script} ] ; then
            ${script}
        fi
    done
}

run_scripts config
