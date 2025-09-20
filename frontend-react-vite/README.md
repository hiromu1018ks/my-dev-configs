# フロントエンド設定 (React + Vite + TypeScript)

React + Vite + TypeScriptプロジェクト用のESLint/Prettier設定です。

## 📦 含まれるファイル

- `eslint.config.js` - ESLint設定 (Flat Config形式)
- `prettier.config.js` - Prettier設定
- `.prettierignore` - Prettierの除外設定
- `package.dev.json` - 必要なdevDependencies

## 🛠️ 適用方法

```bash
# 自動セットアップ
../scripts/setup-frontend.sh /path/to/your/project

# または手動コピー
cp eslint.config.js /path/to/your/project/
cp prettier.config.js /path/to/your/project/
cp .prettierignore /path/to/your/project/
```

## 📋 主要な設定

### ESLintプラグイン

- `@stylistic/eslint-plugin` - コードスタイル
- `eslint-plugin-react` - React固有のルール
- `eslint-plugin-react-hooks` - Hooks使用ルール
- `eslint-plugin-jsx-a11y` - アクセシビリティ
- `eslint-plugin-import` - import/export管理
- `eslint-plugin-simple-import-sort` - import順序統一
- `eslint-plugin-unused-imports` - 未使用import削除

### 重要なルール

```javascript
// Import順序の統一
"simple-import-sort/imports": [
  "error",
  {
    "groups": [
      ["^react(-dom)?", "^node:", "^@?\\w", "^@/.*", "^\\.+/(?!assets/)"],
      ["^.+\\.json$", "^.+\\.(svg|png|jpg)$", "^.+\\.s?css$"],
    ],
  },
],

// 空行の統一
"@stylistic/padding-line-between-statements": [
  "error",
  { "blankLine": "always", "prev": "*", "next": "return" },
  { "blankLine": "always", "prev": "*", "next": ["function", "class"] }
]
```

## 🎯 対象ファイル

- `src/**/*.{js,ts,jsx,tsx}` - メインコード
- `src/**/*.{test,spec}.{js,ts,jsx,tsx}` - テストファイル

## 🚫 除外ファイル

- `{dist,build,public,node_modules}/**`
- `**/lib/utils.{js,ts}` - shadcn/ui utilities
- `**/components/ui/**/*.{jsx,tsx}` - shadcn/ui components
- `**/*.config.*` - 設定ファイル