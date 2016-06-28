#!/bin/sh

# Homebrew

echo 'Homebrew 섹션을 시작합니다.'
if test "$(uname)" = "Darwin"
then
  if test ! $(which brew)
  then
    echo '> Brew를 설치 합니다.'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo '> Brew가 이미 설치되어 있습니다.'
  fi
  echo '> Brew 업데이트를 진행합니다.'
  brew update

  # TODO : 패키지 자동 설치
else
  echo '> 이 섹션은 OSX를 위해서만 작성되었습니다. 리눅스용 Homebrew 사용은 지원하지 않습니다.'
fi
echo 'Homebrew 섹션을 완료했습니다.'
