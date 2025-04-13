# MCP Server

By using [RISKEN MCP Server :octicons-link-external-24:](https://github.com/ca-risken/risken-mcp-server){ target="_blank" }, you can connect RISKEN data and security operations to AI models (LLMs) using the [Model Context Protocol (MCP) :octicons-link-external-24:](https://modelcontextprotocol.io/introduction){ target="_blank" }.

## Use Cases

For example, by using MCP client tools such as [Claude Desktop :octicons-link-external-24:](https://claude.ai/download){ target="_blank" } or [Cursor :octicons-link-external-24:](https://www.cursor.com/){ target="_blank" }, you can perform security operations like:

- "(You) Are there any unresolved alerts?" → "(AI) There is 1 alert generated today. This alert is..."
- "(You) Search for high-score AWS-related findings" → "(AI) I found 3 items. This finding is..."
- "(You) How can this issue be resolved?" → "(AI) The cause is... so it can be resolved by..."
- "(You) Archive this finding because it is a false positive" → "(AI) I will archive it."

## Setup

1. Obtain an access token from RISKEN.
    - For details, refer to [Access Token](/risken/access_token).
2. Install and start [Docker](https://www.docker.com/).
3. Configure Claude Desktop or Cursor with the following settings:


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

For details on the tools and resources provided by the MCP server, refer to the [README](https://github.com/ca-risken/risken-mcp-server/blob/main/README.md){ target="_blank" }.
