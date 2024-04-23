sed 's+${platform}+amd64+g' Dockerfile > Dockerfile-amd
sed 's+${platform}+arm64+g' Dockerfile > Dockerfile-arm
