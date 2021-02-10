#!/bin/bash
#

VIM=vim
TEST_SUITE='test/**/*.vader'

cd "$(git rev-parse --show-toplevel)" || exit

if [ ! -d "$HOME/.vim/bundle/vader.vim" ] && [ ! -d "vader.vim" ]; then
  git clone https://github.com/junegunn/vader.vim.git
fi

"${VIM}" -u test/init.vim -E -s -c "Vader! -x -q ${TEST_SUITE}"
vader_exit=$?
exit $vader_exit
