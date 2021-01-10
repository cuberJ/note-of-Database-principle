git add *
if $1 != ""
    then git commit -m $1;echo ${1}'成功加入仓库'
else
    git commit -m '修订';echo '未提供变量，但成功加入仓库'
fi
git push database master 2>/dev/null
answer=$?
echo $answer
if [ "$answer"x = "0"x ]
    then echo '成功上传'
elif [ "$answer"x = "128"x ]
    then echo '网络连接失败'
else
    echo '非网络因素的上传失败'
fi
