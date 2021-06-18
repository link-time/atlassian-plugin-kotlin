#!/bin/sh

set -e

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 version"
  exit 1
fi

VERSION=$1

set_commit_version() {
  V=$1
  COMMIT_MSG=$2
  mvn -B versions:set "-DnewVersion=$V" versions:commit
  git ls-files . | grep 'pom.xml' | xargs git add && git commit -m "$COMMIT_MSG"
}

echo_demarcation() {
  TEXT=$1
  echo
  echo "--------------------------------------------------------------------------"
  echo "RELEASE: $TEXT"
  echo "--------------------------------------------------------------------------"
}

# set non-snapshot version number as specified in parameter
echo_demarcation "Set & commit version $VERSION"
set_commit_version "$VERSION" "[skip ci] release v$VERSION"

# build, deploy and tag that version
echo_demarcation "Build, tag & deploy version $VERSION"
mvn -B clean deploy scm:tag \
  "-DaltReleaseDeploymentRepository=artifactory::$ARTIFACTORY_CONTEXT_URL/libs-release-local" \
  "-DaltSnapshotDeploymentRepository=artifactory::$ARTIFACTORY_CONTEXT_URL/libs-snapshot-local" \
  "-Ddeveloper.connection=scm:git:$BITBUCKET_GIT_HTTP_ORIGIN" \
  -Pci

# prepare for next snapshot version
MAJOR_VERSION=$(echo "$VERSION" | cut -d . -f1)
MINOR_VERSION=$(echo "$VERSION" | cut -d . -f2)
INCREMENT_VERSION=$(echo "$VERSION" | cut -d . -f3)
NEXT_INCREMENT_VERSION=$((INCREMENT_VERSION + 1))
NEXT_SNAPSHOT_VERSION="$MAJOR_VERSION.$MINOR_VERSION.$NEXT_INCREMENT_VERSION-SNAPSHOT"
echo_demarcation "Prepare next snapshot version $NEXT_SNAPSHOT_VERSION"
set_commit_version "$NEXT_SNAPSHOT_VERSION" "[skip ci] set development version $NEXT_SNAPSHOT_VERSION"

echo_demarcation "git push"
git push
