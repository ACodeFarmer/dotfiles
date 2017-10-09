#!/usr/bin/env bash

print_info 'Homebrew 섹션을 시작합니다.'
if test "$(uname)" = "Darwin"
then
  if test ! $(which brew)
  then
    print_message 'Brew를 설치 합니다.'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    print_message 'Brew가 이미 설치되어 있습니다.'
  fi
  print_message 'Brew 업데이트를 진행합니다.'
  brew update

  ask_for_confirmation "Homebrew Bundle 을 설치 할까요?"
  if answer_is_yes; then
    brew tap Homebrew/bundle
    #brew bundle
    #brew bundle --file=devel/vagrant.Brewfile
  fi  

else
  print_message '이 섹션은 OSX를 위해서만 작성되었습니다. 리눅스용 Homebrew 사용은 지원하지 않습니다.'
fi
print_info 'Homebrew 섹션을 완료했습니다.'
