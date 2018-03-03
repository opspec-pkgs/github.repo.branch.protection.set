#!/usr/bin/env sh

set -e

statusCode=$(curl \
    --silent \
    --output \
    /response \
    --write-out "%{http_code}" \
    -X PUT "https://api.github.com/repos/${ownerName}/${repoName}/branches/${branchName}/protection" \
    --header "Authorization: token ${accessToken}" \
    -d @/protection)

if test "$statusCode" -ne 200; then
cat /response
exit 1
fi