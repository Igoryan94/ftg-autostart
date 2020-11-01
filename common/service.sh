#!/system/bin/sh
# Copyright:
#		2020, Igor Kozlovskiy (igoryan94@gmail.com)
#									 (@DfP_DEV @ Telegram)

export HOME=/data/data/com.termux/files/home
export PATH=/data/data/com.termux/files/usr/bin:/data/data/com.termux/files/usr/bin/applets

([ ! -d $HOME/friendly-telegram ] || ! which python3 \
		|| [ ! -f $HOME/friendly-telegram/api_token.txt ]) && \
	return 1

len=`wc -c $HOME/friendly-telegram/api_token.txt`
[ $len -gt 0 ] || return 1

! pgrep -f friendly-telegram && \
	cd $HOME/friendly-telegram && python3 -m friendly-telegram &

