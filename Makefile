REPO_PO        = /Users/mitsu/ghq/github.com/protoout/po
REPO_PO_COMMON = /Users/mitsu/ghq/github.com/protoout/po-common
URL_PO         = https://github.com/protoout/po
URL_PO_COMMON  = https://github.com/protoout/po-common

setup:
	zsh ./scripts/setup.sh

setup-symbolic-link:
	pwd
	zsh /Users/mitsu/ghq/github.com/mitsuoka0423/dotfiles/scripts/generate_symbolic_link.sh

## スニペット
po: repo-po web-po
po-common: repo-po-common web-po-common

## リポジトリ系
repo-po: ${REPO_PO}
	code ${REPO_PO}
repo-po-common: ${REPO_PO_COMMON}
	code ${REPO_PO_COMMON}

## よく使うページ
web-po:
	open ${URL_PO}
web-po-common:
	open ${URL_PO_COMMON}
