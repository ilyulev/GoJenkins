# GoJenkins
Jenkins configuration to build go source code with a packages from private repositories.

# Problem
During Jenkins configuration I found a problem with a private repositories. During "go get" command I had a password requests that makes immpossible to use that command on a build server. 

# Workaround
Use "git clone" command to clone all private repositories and then run "go get" on top of the previuosly retrieved packages.

# Preconfiguration
I use ssh to clone these packages. So you need to add ssh key to jenkins and bitbucket. 

Create a new pipeline. Add an additional behaviour type "Check out to a sub-directory" and use "src/bitbucket.org/Username/Reporitory" as a value. Don't forget to change Username and Repository values to your actual one (or use an url from your browser).

Add Jenkinsfile and ci-build (and ci-test if needed) to your source code. Update these files with your Username and Password values and commit.

# Limitations
This script was developed to cover following case: there are private company repositories under the same bitbucket team used in the target go package. All other dependencies are open-source.