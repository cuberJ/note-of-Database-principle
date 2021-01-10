git add *
if $1 != ""
    then git commit -m $1;echo ${1}'成功加入仓库'
else
    git commit -m '修订';echo '未提供变量，但成功加入仓库'
fi
git push database master
echo '成功上传'
