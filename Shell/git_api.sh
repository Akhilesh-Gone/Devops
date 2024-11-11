#!/bin/bash
#Author : Akhilesh
# Date 11 Nov 24
#this script gets the data of collabrators form a repository using api


# Api url
Api_url="https://api.github.com"

# username and token for authentication
USERNAME="$username"
TOKEN="$token"
owner="$1"
repo="$2"


# function for authentications and curl
function get {
        # this adds the remaining link
        local org="$1"
        # authenticating and creating curl link here no get request is used and curl internally uses get request
        # -s to supress progress meter
        curl -s -u "${USERNAME}:${TOKEN}" "${Api_url}/${org}"
}
# function for remaining curl command
 function list_users {
         local rem="repos/"$owner"/"$repo"/collaborators"
         collabarators="$(get "${rem}" | jq -r ".[] | select(.permissions.pull == true) | .login")"
 }

list_users
echo "$collabarators"
