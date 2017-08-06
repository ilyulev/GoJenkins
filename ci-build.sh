#We need GOPATH because we are building not from default GO folder
export GOPATH=${WORKSPACE}
export PATH=$GOPATH/bin:$PATH
#Change folder to the one with go source code
cd src/bitbucket.org/Username/Repository
#4 pipes command: the most complicated part
#     first command - list all package dependencies
#     second command - grep all lines with "bitbucket". I assume you have lines with bitbucket.org only
#     third command - change first slash to a colon. So you have "bitbucket.org:Username/Repository" instead of "bitbucket.org/Username/Repository"
#     last command - create a final git command: "git@bitbucket.org:Username/Repository". 
#            Go one level up (to your username folder), clone your private repos to your company folder, move back to your src folder
go list -f '{{ join .Imports "\n" }}' | grep bitbucket | sed 's/\//:/' | while read -r line; do cd ..; git clone -- "git@$line" ;cd Repository; done

echo 'Building go code'
#Double check we are in the code repo
cd src/bitbucket.org/Username/Repository
#Get all public packages
go get
#Build go code
go build .
