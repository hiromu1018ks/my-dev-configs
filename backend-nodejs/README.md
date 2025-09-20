# バックエンド設定 (Node.js + TypeScript)

Node.js + TypeScriptプロジェクト用のESLint/Prettier設定です。

## 📦 含まれるファイル

- `eslint.config.js` - ESLint設定 (Flat Config形式)
- `prettier.config.js` - Prettier設定
- `.prettierignore` - Prettierの除外設定
- `package.dev.json` - 必要なdevDependencies

## 🛠️ 適用方法

```bash
# 自動セットアップ
../scripts/setup-backend.sh /path/to/your/project

# または手動コピー
cp eslint.config.js /path/to/your/project/
cp prettier.config.js /path/to/your/project/
cp .prettierignore /path/to/your/project/
```

## 📋 主要な設定

### ESLintプラグイン

- `@stylistic/eslint-plugin` - コードスタイル
- `typescript-eslint` - TypeScript専用ルール
- `eslint-plugin-import` - import/export管理
- `eslint-plugin-simple-import-sort` - import順序統一
- `eslint-plugin-unused-imports` - 未使用import削除

### 重要なルール

```javascript
// TypeScript厳格設定
"@typescript-eslint/no-unused-vars": "off",
"unused-imports/no-unused-imports": "error",

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

- `src/**/*.{js,ts}` - メインコード
- `src/**/*.{test,spec}.{js,ts}` - テストファイル

## 🚫 除外ファイル

- `{dist,build,node_modules}/**`
- `**/*.config.*` - 設定ファイル

## 🌍 環境設定

```javascript
languageOptions: {
  ecmaVersion: "latest",
  globals: {
    ...globals.node,     // Node.js環境
    ...globals.es2024,   // ES2024機能
  },
}
```

## 🔧 Express.js対応

`@types/express`と`@types/node`が含まれており、Express.jsアプリケーション開発に最適化されています。