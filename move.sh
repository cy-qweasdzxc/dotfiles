#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# ============================================================
# 白名单：只有这里列出的文件/目录才会被移动并创建链接
# 请根据你的实际情况增删
# ============================================================
FILES_TO_MANAGE=(
  ".bashrc"
  ".zshrc"
  ".zprofile"
  ".profile"
  ".tmux.conf"
  ".vimrc"
  ".gitconfig"
  ".pam_environment"
  ".selected_editor"
  ".wget-hsts"
  ".xinputrc"
  ".bash_logout"
)

# ---------- 准备 ----------
mkdir -p "$DOTFILES_DIR"
mkdir -p "$BACKUP_DIR"

echo "==> dotfiles 目录: $DOTFILES_DIR"
echo "==> 备份目录:     $BACKUP_DIR"
echo

cd "$HOME"

for name in "${FILES_TO_MANAGE[@]}"; do
  src="$HOME/$name"

  # 源文件不存在就跳过
  if [[ ! -e "$src" && ! -L "$src" ]]; then
    echo "[跳过] $name  (源文件不存在)"
    continue
  fi

  # 已经是符号链接，跳过
  if [[ -L "$src" ]]; then
    echo "[跳过] $name  (已是符号链接)"
    continue
  fi

  target="$DOTFILES_DIR/$name"

  # dotfiles 里已有同名项，先备份
  if [[ -e "$target" || -L "$target" ]]; then
    echo "[备份] $target  ->  $BACKUP_DIR/"
    mv "$target" "$BACKUP_DIR/"
  fi

  echo "[移动] $src  ->  $target"
  mv "$src" "$target"

  echo "[链接] $src  ->  $target"
  ln -s "$target" "$src"
done

echo
echo "==> 完成。备份目录：$BACKUP_DIR"
echo "==> 验证链接：ls -la ~ | grep '^l'"
