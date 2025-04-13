# MCP Server

[RISKEN MCP Server :octicons-link-external-24:](https://github.com/ca-risken/risken-mcp-server){ target="_blank" } を使用することで、RISKENのデータやセキュリティのオペレーションを[Model Context Protocol (MCP) :octicons-link-external-24:](https://modelcontextprotocol.io/introduction){ target="_blank" } を使用してAIモデル（LLM）に接続することができます。

## ユースケース

例えば、[Claude Desktop :octicons-link-external-24:](https://claude.ai/download){ target="_blank" }や[Cursor :octicons-link-external-24:](https://www.cursor.com/){ target="_blank" }などのMCPクライアントツールを利用して、以下のようなセキュリティオペレーションが可能になります。

- 「（あなた）未解決のアラートはありますか？」 → 「（AI）本日生成されたアラートが1件あります。このアラートは...」
- 「（あなた）AWS関連でスコアの高いFindingを検索して」 → 「（AI）3件見つかりました。このFindingは...」
- 「（あなた）その問題はどのような方法で解決できますか？」 → 「（AI）この原因は...なので、以下のような方法で解決できます...」
- 「（あなた）xxxのFindingは誤検知なのでアーカイブしておいて」 → 「（AI）承知しました...」

## 設定方法

1. RISKENでアクセストークンを取得します。
    - 詳細は[アクセストークン](/risken/access_token)を参照してください。
2. [Docker](https://www.docker.com/)をインストール＆起動します
3. Claude DesktopやCursorの設定に以下のように設定します


```json
{
  "mcpServers": {
    "risken": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "-e",
        "RISKEN_ACCESS_TOKEN",
        "-e",
        "RISKEN_URL",
        "ghcr.io/ca-risken/risken-mcp-server",
        "stdio"
      ],
      "env": {
        "RISKEN_ACCESS_TOKEN": "your_access_token",
        "RISKEN_URL": "http://your_host"
      }
    }
  }
}
```

MCPサーバーが提供しているToolやResource、設定方法の詳細については[RISKEN MCP Server :octicons-link-external-24:](https://github.com/ca-risken/risken-mcp-server){ target="_blank" }のREADMEを参照してください。
