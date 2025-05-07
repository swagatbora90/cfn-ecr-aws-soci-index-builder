#!/bin/bash
set -ex

# Copied from https://github.com/aws-ia/aws-ia-documentation-base-common/blob/main/.utils/build_docs.sh and
# updated for cfn-ecr-aws-soci-index-builder repo

# -----------
# ${parameter:+word}
#     If parameter is null or unset, nothing is substituted,
#       otherwise the expansion of word is substituted.
#
# This is used to add values to variables if ${BUILD_PREVIEW_GUIDE} is unset.
# - ex: a production build.
#
#

build_guide_with_asciidoc_attributes() {
    if test -z ${BUILD_PREVIEW_GUIDE}; then
        ASCIIDOC_ATTRIBUTES="-a production_build"
    fi
    set -x
    asciidoctor --base-dir docs/ --backend=html5 -o ${OUTPUT_FILE} -w --doctype=book -a toc2 -a current-year=$(date +%Y) ${ASCIIDOC_ATTRIBUTES} ${LAYOUT_FILE}
    set +x
}

# path to files showing which type of guide the repo has been configured to display.
DEPLOYMENTFILE=docs/_deployment_guide.adoc

# Check for deployment guide
if test -f "$DEPLOYMENTFILE"; then
    echo "== Generating Deployment Guide =="

    LAYOUT_FILE=docs/boilerplate/index_deployment_guide.adoc
    OUTPUT_FILE=index.html

    build_guide_with_asciidoc_attributes
    mv docs/${OUTPUT_FILE} $(pwd)/
fi
