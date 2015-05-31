#!/bin/bash
set -e

source "${IKIWIKI_HOME}/scripts/lib/base_config.sh"
source "${IKIWIKI_HOME}/scripts/lib/config.sh"
source "${IKIWIKI_HOME}/scripts/lib/base_functions.sh"
source "${IKIWIKI_HOME}/scripts/lib/functions.sh"


make_config() {
    echo "Generating ikiwiki config file..."
    cat ${CONFIGTEMPLATE} \
      | python -c "${PYTHON_JINJA2}" \
      > ${CONFIGFILE}

    cat ${IKIWIKI_HOME}/conf/wikilist.tpl  \
        | python -c "${PYTHON_JINJA2}" \
                 > ${IKIWIKI_HOME}/.ikiwiki/wikilist

}


# generate config file
make_config

exit 0
