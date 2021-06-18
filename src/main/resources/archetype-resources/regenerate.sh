#!/bin/bash

set -e

SCRIPT_DIR="$(
  cd "$(dirname "$0")" || exit
  pwd -P
)"

get_version_from_maven() {
    mvn help:evaluate -Dexpression=project.version -q -DforceStdout | tail -n 1
}

FOLDER_NAME=$(basename "$SCRIPT_DIR")
ARTIFACT_ID="$artifactId"
VERSION=$(get_version_from_maven)

pushd "$PWD" || exit
cd "$SCRIPT_DIR" && cd "../" || exit

echo "---------------------------------------------------"
echo "Renaming existing project to $FOLDER_NAME-swap ..."
echo "---------------------------------------------------"
echo
mv "$FOLDER_NAME" "$FOLDER_NAME-swap"


echo "---------------------------------------------------"
echo "Regenerating project files ..."
echo "---------------------------------------------------"
echo
mvn archetype:generate -B -U \
    "-DarchetypeGroupId=com.linked-planet.maven.archetype" \
    "-DarchetypeArtifactId=atlassian-plugin-kotlin" \
    "-DarchetypeVersion=3.1.4-SNAPSHOT" \
    "-DatlassianApp=$atlassianApp" \
    "-DgroupId=$groupId" \
    "-DartifactId=$artifactId" \
    "-Dpackage=$package" \
    "-DnameHumanReadable=$nameHumanReadable" \
    "-Ddescription=$description" \
    "-DorganizationNameHumanReadable=$organizationNameHumanReadable" \
    "-DorganizationUrl=$organizationUrl" \
    "-DinceptionYear=$inceptionYear" \
    "-DdeveloperConnection=$developerConnection" \
    "-DgenerateGithubActions=$generateGithubActions" \
    "-DgenerateBitbucketPipelines=$generateBitbucketPipelines" \
    "-DgenerateDockerEnvironment=false" \
    "-DgenerateStubs=false" \
    "-DgenerateFrontend=$generateFrontend" \
    "-Dgoals=license:update-file-header"


echo "---------------------------------------------------"
echo "Post-process generated files ..."
echo "---------------------------------------------------"
# must not overwrite the script itself
rm $ARTIFACT_ID/regenerate.sh
# inject current project version into regenerated files
sed -i -E "0,/<version>[0-9]+\.[0-9]+\.[0-9]+(.*)<\/version>/s/<version>[0-9]+\.[0-9]+\.[0-9]+(.*)<\/version>/<version>$VERSION<\/version>/" $ARTIFACT_ID/pom.xml


echo "---------------------------------------------------"
echo "Copy files into swap ..."
echo "---------------------------------------------------"
echo
cp -a "$ARTIFACT_ID/." "$FOLDER_NAME-swap/"


echo "---------------------------------------------------"
echo "Clean up ..."
echo "---------------------------------------------------"
echo
rm -r "$ARTIFACT_ID"
mv "$FOLDER_NAME-swap" "$FOLDER_NAME"

popd || exit
