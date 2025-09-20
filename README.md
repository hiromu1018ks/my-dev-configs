# 個人用開発設定テンプレート

このリポジトリは、新しいプロジェクトで一貫したコード品質を保つためのESLint/Prettier設定テンプレートです。

## 📁 構成

```
my-dev-configs/
├── frontend-react-vite/     # React + Vite + TypeScript用設定
├── backend-nodejs/          # Node.js + TypeScript用設定
├── scripts/                 # 自動セットアップスクリプト
├── templates/               # 追加テンプレート
└── README.md               # このファイル
```

## 🚀 使用方法

### フロントエンド (React + Vite)

```bash
# 既存プロジェクトに設定を適用
cd /path/to/your/project
/Users/hiromu/Develop/my-dev-configs/scripts/setup-frontend.sh

# または新しいディレクトリに適用
/Users/hiromu/Develop/my-dev-configs/scripts/setup-frontend.sh /path/to/new/project
```

### バックエンド (Node.js + TypeScript)

```bash
# 既存プロジェクトに設定を適用
cd /path/to/your/project
/Users/hiromu/Develop/my-dev-configs/scripts/setup-backend.sh

# または新しいディレクトリに適用
/Users/hiromu/Develop/my-dev-configs/scripts/setup-backend.sh /path/to/new/project
```

## 🛠️ 手動セットアップ

自動スクリプトが使えない場合の手動セットアップ方法：

### 1. 設定ファイルをコピー

```bash
# フロントエンド
cp frontend-react-vite/eslint.config.js your-project/
cp frontend-react-vite/prettier.config.js your-project/
cp frontend-react-vite/.prettierignore your-project/

# バックエンド
cp backend-nodejs/eslint.config.js your-project/
cp backend-nodejs/prettier.config.js your-project/
cp backend-nodejs/.prettierignore your-project/
```

### 2. devDependenciesをインストール

`package.dev.json`ファイルを参考に必要なパッケージをインストール：

```bash
# 例: フロントエンド
pnpm add -D eslint@^9.35.0 prettier@^3.6.2 typescript-eslint@^8.43.0 # ...その他
```

### 3. package.jsonにscriptsを追加

```json
{
  "scripts": {
    "lint": "eslint .",
    "lint:fix": "eslint . --fix",
    "format": "prettier --write 'src/**/*.{js,ts,jsx,tsx}'",
    "fix": "pnpm run format && pnpm run lint:fix"
  }
}
```

## 📋 設定の特徴

### フロントエンド設定

- **ESLint Flat Config** - 最新の設定形式
- **React + TypeScript** - React 19対応
- **Import管理** - `simple-import-sort`で一貫したimport順序
- **アクセシビリティ** - `jsx-a11y`でWebアクセシビリティ確保
- **TailwindCSS** - prettier-plugin-tailwindcss対応
- **未使用import削除** - `unused-imports`で自動クリーンアップ

### バックエンド設定

- **Node.js + TypeScript** - サーバーサイド開発用
- **Express.js対応** - 型定義とルール最適化
- **厳格なTypeScript** - 型安全性重視
- **Import管理** - フロントエンドと同様のimport順序

### 共通設定

- **Stylistic Rules** - コードの見た目を統一
- **Prettier統合** - ESLintとPrettierの競合回避
- **Jest対応** - テストファイル用の専用ルール

## 🔧 カスタマイズ

### ESLint設定の変更

各プロジェクトの要件に応じて`eslint.config.js`を調整：

```javascript
// 特定のルールを無効化
const customConfig = {
  rules: {
    "react/jsx-uses-react": "off",
    // 追加のカスタムルール
  }
};
```

### Prettier設定の変更

`prettier.config.js`でフォーマット設定を調整：

```javascript
const config = {
  singleQuote: true,
  tabWidth: 2,
  // 追加設定
};
```

## 📝 更新履歴

- **2025-09-20**: 初期リリース
  - React + Vite設定
  - Node.js設定
  - 自動セットアップスクリプト

## 🤝 使用例

このテンプレートを使用して作成されたプロジェクト：
- [Hidamari](../Hidamari) - React + Express SNSアプリケーション

## 💡 Tips

- **エディタ連携**: VSCodeのESLint/Prettier拡張機能を有効化
- **Git hooks**: huskyでコミット前の自動チェック設定推奨
- **CI/CD**: GitHub ActionsでESLint/Prettierチェック自動化

---

📧 質問や改善提案があれば、Issueまたは個人的に連絡してください。