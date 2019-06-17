#!/bin/sh
# I forgot where I found this on StackOverflow, but thanks to whoever that was!

git filter-branch --env-filter '

OLD_EMAIL="old.email@domain.com"
CORRECT_NAME="My Name"
CORRECT_EMAIL="new.email@domain.com"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
