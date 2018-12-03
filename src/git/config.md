# git config

## 推荐配置

```bash
# 核心配置
git config --global core.autocrlf false
git config --global core.quotepath false
git config --global core.safecrlf true

# 别名
git config --global alias.ar archive
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.ret 'reset HEAD --' # 撤回暂存
git config --global alias.df diff
git config --global alias.ds 'diff --staged'
git config --global alias.dt difftool
git config --global alias.ll '!git sum -10' # list latest commits
git config --global alias.mt mergetool
git config --global alias.pick cherry-pick
git config --global alias.pr 'pull -r'
git config --global alias.rb rebase
git config --global alias.st 'status -s'
git config --global alias.sum 'log --pretty=summary --date="format-local:%Y-%m-%d %H:%M:%S"'
git config --global alias.undo 'checkout --' # 撤销工作区修改

# 格式
git config --global pretty.summary 'tformat:%C(yellow) %h %Cred %<(15,trunc) %an %Cgreen %ad %Creset %s'

# TortoiseGit
git config --global alias.cm '!TortoiseGitProc.exe /command:diff &' # check for modifications
git config --global alias.sl '!TortoiseGitProc.exe /command:log /path:"." &' # show log
```
