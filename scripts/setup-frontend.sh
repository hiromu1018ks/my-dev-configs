#!/bin/bash

# フロントエンド(React + Vite)プロジェクトにESLint/Prettier設定を適用するスクリプト
# Usage: ./setup-frontend.sh [PROJECT_PATH]

set -e

PROJECT_PATH=${1:-"."}
CONFIG_DIR="$(dirname "$0")/../frontend-react-vite"

echo "🚀 フロントエンド設定をセットアップ中..."
echo "プロジェクトパス: $PROJECT_PATH"

# プロジェクトディレクトリの存在確認
if [ ! -d "$PROJECT_PATH" ]; then
    echo "❌ エラー: プロジェクトディレクトリが見つかりません: $PROJECT_PATH"
    exit 1
fi

# package.jsonの存在確認
if [ ! -f "$PROJECT_PATH/package.json" ]; then
    echo "❌ エラー: package.jsonが見つかりません"
    exit 1
fi

# 設定ファイルをコピー
echo "📁 設定ファイルをコピー中..."
cp "$CONFIG_DIR/eslint.config.js" "$PROJECT_PATH/"
cp "$CONFIG_DIR/prettier.config.js" "$PROJECT_PATH/"
cp "$CONFIG_DIR/.prettierignore" "$PROJECT_PATH/"

echo "📦 devDependenciesをインストール中..."

# package.dev.jsonから必要なdevDependenciesを抽出してインストール
if command -v jq > /dev/null; then
    # jqがある場合
    DEPS=$(jq -r '.devDependencies | to_entries[] | "\(.key)@\(.value)"' "$CONFIG_DIR/package.dev.json" | tr '\n' ' ')
    pnpm add -D $DEPS
else
    # jqがない場合は手動でインストール
    echo "⚠️  jqがインストールされていません。手動でdevDependenciesをインストールしてください："
    echo "以下のコマンドを実行："
    cat "$CONFIG_DIR/package.dev.json"
fi

# scriptsをpackage.jsonに追加
echo "📝 package.jsonにscriptsを追加中..."
if command -v jq > /dev/null; then
    SCRIPTS=$(jq '.scripts' "$CONFIG_DIR/package.dev.json")
    jq --argjson scripts "$SCRIPTS" '.scripts += $scripts' "$PROJECT_PATH/package.json" > tmp.json && mv tmp.json "$PROJECT_PATH/package.json"
fi

echo "✅ フロントエンド設定のセットアップが完了しました！"
echo ""
echo "🔧 次のステップ："
echo "1. pnpm install (またはnpm install)"
echo "2. pnpm run lint でESLintをテスト"
echo "3. pnpm run format でPrettierをテスト"