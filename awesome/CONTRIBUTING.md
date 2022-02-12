# Contributing to awesome-ban

## Tips for bug reports

* 这个问题已经被报道了吗？请快速搜索。

* 也许问题已经在当前的master分支中解决了？

  只需克隆真棒禁令 `git clone --recursive https://github.com/4ban/awesome-ban.git` or

  通过下载git版本 https://github.com/4ban/awesome-ban/archive/master.zip

  and run `mv -bv awesome-ban/* ~/.config/awesome; rm -rf awesome-ban` directly to find out.

* You can obtain much better error messages with starting it in sandbox by Xephyr: 

`Xephyr :5 -ac -br -noreset -screen 1500x800 & sleep 1; DISPLAY=:5 awesome -c /path/to/awesome-ban/rc.lua`. 

Also change related paths in variables `theme_path` in your rc.lua and `theme.dir` in theme.lua.

Thank you!
