@pushd %~dp0
@echo L > dic.txt
@echo geo >> dic.txt
@echo jinmei >> dic.txt
@for /f %%t in (dic.txt) do curl -Lo SKK-JISYO.%%t http://openlab.ring.gr.jp/skk/skk/dic/SKK-JISYO.%%t
@echo zipcode > dic.txt
@echo office.zipcode >> dic.txt
@for /f %%t in (dic.txt) do curl -Lo SKK-JISYO.%%t http://openlab.ring.gr.jp/skk/skk/dic/zipcode/SKK-JISYO.%%t
@del dic.txt
@popd
