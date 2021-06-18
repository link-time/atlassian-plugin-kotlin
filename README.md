# Maven Archetype: Kotlin Atlassian Plugin
![Maven](https://github.com/linked-planet/atlassian-plugin-kotlin/workflows/Maven/badge.svg)
[![GitHub License](https://img.shields.io/badge/license-CC0%201.0%20Universal-blue.svg?style=flat)](https://creativecommons.org/publicdomain/zero/1.0/legalcode)

Creates a Jira or Confluence plugin to be implemented with the
[Kotlin](https://kotlinlang.org/) programming language.


## Usage

Use [install-all-tags.sh](install-all-tags.sh) to install all available tags on your local machine.

### Required Properties
| name | description |
| ---- | ----------- |
| atlassianApp | `confluence`, `jira`, `jira-insight` |
| groupId | Maven Group ID |
| artifactId | Maven Artifact ID |
| package | Name of the Java package the plugin source code will reside in |
| nameHumanReadable | Name of the project to be shown to users |
| description | A short description of the plugin |
| organizationNameHumanReadable | Name of the author organization |
| organizationUrl | URL of the author organization |
| inceptionYear | Year of inception |
| developerConnection | String to be written into Maven's SCM `developerConnection` tag |
| generateGithubActions | Whether to generate a GitHub workflow |
| generateBitbucketPipelines | Whether to generate bitbucket-pipelines.yml and corresponding scripts |
| generateDockerEnvironment | Whether to generate a `docker-compose.yml` with a basic Atlassian-provided app container |
| generateStubs | Whether to generate stubs (all archetype files in `src`) |
| generateFrontend | Whether to generate a separate React/KotlinJS frontend  |

### Example
```
mvn archetype:generate -B \
    "-DarchetypeGroupId=com.linked-planet.maven.archetype" \
    "-DarchetypeArtifactId=atlassian-plugin-kotlin" \
    "-DarchetypeVersion=<VERSION-OF-ARCHETYPE>" \
    "-DatlassianApp=jira" \
    "-DgroupId=com.linked-planet.plugin.jira" \
    "-DartifactId=new-plugin" \
    "-Dpackage=com.linkedplanet.plugin.jira.newplugin" \
    "-DnameHumanReadable=New Plugin" \
    "-Ddescription=Description of New Plugin" \
    "-DorganizationNameHumanReadable=linked-planet GmbH" \
    "-DorganizationUrl=https://linked-planet.com" \
    "-DinceptionYear=2020" \
    "-DdeveloperConnection=scm:git:https://github.com/linked-planet/new-plugin.git" \
    "-DgenerateGithubActions=true" \
    "-DgenerateBitbucketPipelines=true" \
    "-DgenerateDockerEnvironment=true" \
    "-DgenerateStubs=true" \
    "-DgenerateFrontend=true" \
    "-Dgoals=license:update-file-header"
```


## License

### Template license
Written 2019-2020 by [linked-planet GmbH](https://www.linked-planet.com).

To the extent possible under law, the author(s) have dedicated all copyright and related
and neighboring rights to this template to the public domain worldwide.
This template is distributed without any warranty. See <http://creativecommons.org/publicdomain/zero/1.0/>.

### Generated project license
The generated project will have Apache 2.0 pre-configured because this is the default
for us. Change it as needed.
