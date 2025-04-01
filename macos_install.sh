#!/bin/bash

if ! which brew &>/dev/null; then
    echo "Homebrew 未安装，正在安装..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # 重新加载 brew
    eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null || eval "$(/usr/local/bin/brew shellenv)"

    # 再次检查是否安装成功
    if ! which brew &>/dev/null; then
        echo "Homebrew 安装失败，请手动安装。" >&2
        exit 1
    fi
else
    echo "Homebrew 已安装，跳过安装步骤。"
    # 执行一次brew的更新过程
    brew update && brew upgrade && brew cleanup
fi

software_list=("git" "wget" "node" "aliyunpan" "neofetch" "tree" "neovim" "upx" "wget" "hugo" "nvm" "protobuf" "docker" "sqlite" "yarn" "telnet")

for package in "${software_list[@]}"; do
    echo "Checking if $package is installed..."
    if brew list --versions "$package" > /dev/null; then
        echo "$package 已经安装，跳过。"
    else
        echo "Installing $package..."
        brew install "$package"
    fi
done

softCasks_list=("iina" "applite" "iterm2" "keycastr" "latest" "mos" "zed" "google-chrome" "firefox" "pixpin" "jetbrains-toolbox" "visual-studio-code" "github" "fork" "transmit" "apifox" "sublime-text" "finalshell" "wireshark" "typora" "cherry-studio" "chatgpt" "follow" "obsidian" "vmware-fusion" "brave")

for package in "${software_list[@]}"; do
    echo "Checking if $package is installed..."
    if brew list --versions "$package" > /dev/null; then
        echo "$package 已经安装，跳过。"
    else
        echo "Installing $package..."
        brew install --cask "$package"
    fi
done
