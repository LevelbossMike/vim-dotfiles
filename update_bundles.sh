for dir in ~/.vim/bundle/*
do
  cd $dir
  echo "updating bundle for ${PWD##*/}"
  git pull
done
