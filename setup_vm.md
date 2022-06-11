# VM setup

> 用于虚拟机出现未知无法解决问题时扬了之后的remake

## Basic

1. 使用桥接网卡，这样IP可以固定。

## vim
1. `sudo apt install vim`
1. `vi ~/.vimrc`

## change source
1. `sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak`

2. `vi /etc/apt/sources.list`
  阿里源

  ```
  deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
  deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
  
  deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
  deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
  
  deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
  deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
  
  deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
  deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
  
  deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
  deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
  ```

  清华源

  ```
  # 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
  deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
  # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
  deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
  # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
  deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
  # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
  deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
  # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
  ```

  > 似乎出现了ca-certificate的问题，暂时通过https->http解决

3. `apt update` 更新index

## 安装基础工具软件

1. `sudo apt install curl openssh-server net-tools`
2. `ifconfig` 查看ip

## ssh

1. 在host上 `ssh-copy-id -i ~/.ssh/id_rsa.pub vmuser@ip` 之后ssh连接就不用输入密码

## shell

> ref:
>
> - [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
> - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
> - [Powerlevel10k](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
> - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

1. `sudo apt install zsh`

2. `sudo chsh -s $(which zsh)`

   > 重启使得shell更改命令生效

3. `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

4. `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`

   > using gitee: `git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`

5. `ZSH_THEME="powerlevel10k/powerlevel10k"` in .zshrc

6. `exec zsh`

7. `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

8. `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

9. edit plugins in `.zshrc`

   ```
   plugins=(
       # other plugins...
       zsh-syntax-highlighting
       zsh-autosuggestions
   )
   ```

10. `source ~/.zshrc`

## git

1. `ssh-keygen -t rsa -C "youremail@example.com"`
2. `cat ~/.ssh/id_rsa.pub`
3. 添加到gitlab，github的SSH key中
4. config
   1. `git config --global user.email "youremail@example.com"`
   2. `git config --global user.name "yourname"`
   3. `git config --global core.editor "vim"`

## tmux

> ref: [tpm](https://github.com/tmux-plugins/tpm)

1. `sudo apt install tmux`

2. `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

3. put these in `~/.tmux.conf`

   ```
   # List of plugins
   set -g @plugin 'tmux-plugins/tpm'
   set -g @plugin 'tmux-plugins/tmux-sensible'
   
   # Other examples:
   # set -g @plugin 'github_username/plugin_name'
   # set -g @plugin 'github_username/plugin_name#branch'
   # set -g @plugin 'git@github.com:user/plugin'
   # set -g @plugin 'git@bitbucket.com:user/plugin'
   
   # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
   run '~/.tmux/plugins/tpm/tpm'
   ```

4. `tmux source ~/.tmux.conf`