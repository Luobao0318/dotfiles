#!/bin/bash

# 获取 dotfiles 的绝对路径
DOTFILES_DIR=~/dotfiles

# 定义需要链接的文件列表
files=(".bashrc" ".vimrc" ".gitconfig")

echo "开始安装 Dotfiles"

for file in "${files[@]}"; do
    # 目标文件在主目录中的路径
    TARGET=~/$file

    # 如果主目录中已经有同名文件或软链接，先把它备份
    if [ -e "$TARGET" ] || [ -h "$TARGET" ]; then
        mv "$TARGET" "${TARGET}.backup_$(date +%s)"
        echo "已备份现有 $file"
    fi

    # 从 dotfiles 目录链接到主目录
    ln -s "$DOTFILES_DIR/$file" "$TARGET"
    echo "✔ 创建软链接: $file"
done

echo "配置完成"
