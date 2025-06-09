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
    asciidoctor --base-dir ${BASE_DIR} --backend=html5 -o ${OUTPUT_FILE} -w --doctype=book -a toc2 -a current-year=$(date +%Y) ${ASCIIDOC_ATTRIBUTES} ${LAYOUT_FILE}
    set +x
}

# Generate main documentation
# path to files showing which type of guide the repo has been configured to display.
DEPLOYMENTFILE=docs/_deployment_guide.adoc

# Check for deployment guide
if test -f "$DEPLOYMENTFILE"; then
    echo "== Generating Main Deployment Guide =="

    BASE_DIR=docs/
    LAYOUT_FILE=docs/boilerplate/index_deployment_guide.adoc
    OUTPUT_FILE=index.html

    build_guide_with_asciidoc_attributes
    mv docs/${OUTPUT_FILE} $(pwd)/
fi

# Generate archive documentation
ARCHIVE_DEPLOYMENTFILE=archive/docs/_deployment_guide.adoc

# Check for archive deployment guide
if test -f "$ARCHIVE_DEPLOYMENTFILE"; then
    echo "== Generating Archive Deployment Guide =="

    BASE_DIR=archive/docs/
    LAYOUT_FILE=archive/docs/boilerplate/index_deployment_guide.adoc
    OUTPUT_FILE=index.html

    build_guide_with_asciidoc_attributes
    mv archive/docs/${OUTPUT_FILE} ./archive/
fi
