git add *
if $1 != ""
    then git commit -m $1
else
    git commit -m '修订'
fi
git push database master
echo $1
