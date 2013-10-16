timerコマンド
============

インストール方法
-------------

ダウンロード後、解凍して、install.shを実行する。

	$ install.sh

使い方
-----

	$ timer
	Usage: timer [-li]
	       timer [-de] mm/dd HHMM command
	       timer [-de] weeknum HHMM command
	           mm/dd  : 02/01=2/1
	           weeknum: 0=日 1=月 2=火 3=水 4=木 5=金 6=土 7=日
	                      1-5 = 月から金まで
	                      5-7 = 金土日
	                    1,3,5 = 月水金
	           HHMM   : 0600=6:00
	Example:
	       # 2月1日 17:00から、rec_radikoru.shを実行（J-WAVEを1時間録音）する。
	       timer -e 02/01 1700 /usr/local/bin/rec_radikoru.sh -o radikoru/ -t 3600 FMJ
	       
	       # 上記予約を削除する。
	       timer -d 02/01 1700 /usr/local/bin/rec_radikoru.sh -o radikoru/ -t 3600 FMJ
	       
	       # 毎週日曜に、rec_radikoru.shを実行（J-WAVEを1時間録音）する。
	       timer -e 0 1700 /usr/local/bin/rec_radikoru.sh -o radikoru/ -t 3600 FMJ
	       
	       # 毎週月曜から金曜に、rec_radikoru.shを実行（NHK-FMを30分録音）する。
	       timer -e 1-5 0600 /usr/local/bin/rec_radikoru.sh -o radikoru/ -t 1800 NHK-FM

* timerコマンドによって、スリープ中のMacBookでも指定日時にコマンドを実行できる。
	* timerコマンドを実行するユーザーがログイン中であり、モニタを開いた状態でのスリープ。
* 曜日指定のタイマーは、毎週繰り返し実行される。
* 日付指定のタイマーは、その日付のみ実行される。
* timerコマンドは、起動日時のみ指定できる。
	* 終了時刻は、実行するコマンド側でコントロールする。
* timerコマンドは、指定したコマンドをcaffeinateコマンドでラッピングして実行する。
	* 例：`caffeinate /bin/sh -c "/usr/local/bin/rec_radikoru.sh -o radikoru/ -t 3600 FMJ"`
	* よって、コマンド実行中の自動スリープを心配する必要はない。

<br />

-iオプションは、対話的な操作。

	$ timer -i
	     1:  0-6     0101 /usr/bin/osascript /Users/zari/Library/Scripts/iTunes_app_update/iTunes11_app_update.scpt
	     2:  6-7     1754 /usr/local/bin/rec_radikoru.sh -o radikoru/ -t 370 FMJ
	     3:  6-7     1854 /usr/local/bin/rec_radikoru.sh -o radikoru/ -t 370 FMJ
	     4:  6-7     1954 /usr/local/bin/rec_radikoru.sh -o radikoru/ -t 370 FMJ
	     5:  6-7     2054 /usr/local/bin/rec_radikoru.sh -o radikoru/ -t 370 FMJ
	     6:  6-7     2154 /usr/local/bin/rec_radikoru.sh -o radikoru/ -t 370 FMJ
	     7:  6-7     2254 /usr/local/bin/rec_radikoru.sh -o radikoru/ -t 370 FMJ
	     8:  6-7     2354 /usr/local/bin/rec_radikoru.sh -o radikoru/ -t 370 FMJ
	     9:  7       1654 /usr/local/bin/rec_radikoru.sh -o radikoru/ -t 370 FMJ
	Select Number :1
	[c]opy  [d]elete :c
	
	$ timer -e 0-6 0101 /usr/bin/osascript /Users/zari/Library/Scripts/iTunes_app_update/iTunes11_app_update.scpt

* 指定した行番号の予約を、コピーまたは削除できる。
* コピーした場合は、同じ内容を予約するコマンドが表示され、実行待ちになる。
	* 好みの内容に修正してから、実行するのだ。
