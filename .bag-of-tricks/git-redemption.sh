#!/usr/bin/env bash

git filter-branch --env-filter '

OLD_MAIL="paolo.brasolin@leanbit.it"
NEW_NAME="Paolo Brasolin"
NEW_MAIL="paolo.brasolin@gmail.com"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_MAIL" ]
then
    export GIT_COMMITTER_NAME="$NEW_NAME"
    export GIT_COMMITTER_EMAIL="$NEW_MAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_MAIL" ]
then
    export GIT_AUTHOR_NAME="$NEW_NAME"
    export GIT_AUTHOR_EMAIL="$NEW_MAIL"
fi

' --tag-name-filter cat -- --branches --tags
