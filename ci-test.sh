#We need GOPATH because we are building not from default GO folder
export GOPATH=${WORKSPACE}
#Change folder to the one with go source code
cd src/bitbucket.org/Username/Repository
#Run tests
go test ./...
