#!/usr/bin/env bash

# Refer https://github.com/mathiasbynens/dotfiles/blob/master/.macos

print_info "$OS 설정 섹션을 시작합니다."

# Save to disk (not to iCloud) by default
diable_icloud_saving() {
  print_message "iCloud 대신 디스크에 저장하도록 설정"
  #defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
}

  # Disable automatic capitalization as it’s annoying when typing code
  #defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
enable_trackpad_tap_on_login() {
  print_message "트랙패드: 로그인 화면에서 탭하여 클릭 활성화(해당 사용자)"
  #defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  #defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
  #defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
}


###############################################################################
# Screen                                                                      #
###############################################################################

# Save screenshots to the desktop
#defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
#defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
#defaults write com.apple.screencapture disable-shadow -bool true

#print_question "환경 구성을 위해 sudo 권한이 필요합니다. 비밀번호를 입력하세요."
# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

MACOS_DEFAULT=false
ask_for_confirmation "사전 정의된 설정을 전부 활성화 할까요?"
if answer_is_yes; then
  MACOS_DEFAULT=true
fi

if $MACOS_DEFAULT; then
  diable_icloud_saving
  enable_trackpad_tap_on_login
else
  print_message ""
fi

print_info "$OS 설정 섹션을 완료했습니다."
