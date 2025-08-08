# Linux 基础练习（Day1）

## 目的 & 成果
- 熟练使用 **文件 / 文本 / 权限 / 进程 / 网络** 常用命令。  
- 产出可复现的结果文件与总结文档，便于后续复盘与展示。  
- 为后续 **Docker / Terraform** 操作打基础。

## 本练习将生成的文件
```txt
lab/linux/
  report.txt          # 所有 *.md 的总行数
  bigfiles.txt        # 仓库中 ≥1MB 的文件清单（含大小）
  data.tsv            # 示例数据（3列）
  lines.txt           # 示例数据（20行）
  awk_col1.txt        # awk 打印第1列的结果
  sed_1_10.txt        # sed 提取1~10行的结果
  README.md           # 本文档
```

---

## 环境
- 运行位置：**仓库根目录**（例如 `/workspaces/infra-playground`）。  
- Shell：`bash`（Dev Container 或本机均可）。  
- 如遇命令缺失，可先安装：
```bash
sudo apt-get update && sudo apt-get install -y coreutils findutils gawk sed procps iproute2 dnsutils
```

---

## 任务 1：统计所有 `*.md` 的总行数 → `report.txt`

### 命令
```bash
find . -type f -name '*.md' -exec wc -l {} + | awk '{sum+=$1} END{print sum+0}' > lab/linux/report.txt

chmod 600 lab/linux/report.txt
```

### 说明
- `find . -type f -name '*.md'`：递归查找 Markdown 文件。  
- `wc -l`：统计每个文件的行数。  
- `awk '{sum+=$1} END{print sum+0}'`：累加第一列（行数）并输出总和。  
- `chmod 600`：仅**文件所有者**可读写，避免团队其他用户误读/泄漏中间结果。

### 示例输出（内容因仓库不同而异）
```txt
1242
```

> **为什么不是 644？**  
> `600 (-rw-------)`：只有自己可读写；`644 (-rw-r--r--)` 会让其他用户可读。中间结果/可能含路径信息时，建议用 600。

---

## 任务 2：查找 ≥1MB 的文件 → `bigfiles.txt`

### 如果没有大文件，先造一个练手
```bash
dd if=/dev/zero of=lab/linux/dummy.bin bs=1M count=2
```

### 生成清单
```bash
find . -type f -size +1M -exec ls -lh {} \; > lab/linux/bigfiles.txt
```

### 说明
- `-size +1M`：**严格大于** 1 MiB 的文件。  
- `ls -lh`：人类可读大小（例如 `2.0M`）。  
- `-exec ... {} \;`：对每个匹配文件执行一次 `ls -lh` 并输出。

### 示例（节选）
```txt
-rw-r--r-- 1 vscode vscode 2.0M Aug  8 12:34 ./lab/linux/dummy.bin
```

---

## 任务 3：awk / sed 文本处理小练习

### 准备数据
```bash
cat > lab/linux/data.tsv <<'EOF'
id name score
1 alice 90
2 bob 76
3 carol 88
4 dave 82
EOF

seq -f "line %g" 1 20 > lab/linux/lines.txt
```

### 3.1 awk：打印第 1 列 → `awk_col1.txt`
```bash
awk '{print $1}' lab/linux/data.tsv > lab/linux/awk_col1.txt
```
**说明**：按空白分隔输出第 1 列。CSV 可用 `-F,`：`awk -F, '{print $1}' file.csv`。

**示例输出**
```txt
id
1
2
3
4
```

### 3.2 sed：提取第 1–10 行 → `sed_1_10.txt`
```bash
sed -n '1,10p' lab/linux/lines.txt > lab/linux/sed_1_10.txt
```
**说明**：`-n` 静默模式、`1,10p` 打印 1 到 10 行。常用替代：`head -n 10 file`。

**示例输出**
```txt
line 1
line 2
...
line 10
```

---

## 验证 & 自检

### 文件存在性与权限
```bash
ls -l lab/linux
# 期望：report.txt 的权限是 -rw-------
```

### 快速断言（可选）
```bash
# GNU/Linux（stat -c）
test "$(stat -c '%a' lab/linux/report.txt 2>/dev/null)" = "600" && echo "report.txt 权限 OK"

# macOS/BSD（stat -f）
test "$(stat -f '%Lp' lab/linux/report.txt 2>/dev/null)" = "600" && echo "report.txt 权限 OK"

test -s lab/linux/bigfiles.txt && echo "bigfiles.txt 非空 OK"
test -s lab/linux/awk_col1.txt && echo "awk_col1.txt 非空 OK"
test -s lab/linux/sed_1_10.txt && echo "sed_1_10.txt 非空 OK"
```

---

## 常见问题（Troubleshooting）
- **`find/awk/sed: not found`** → 安装：`sudo apt-get update && sudo apt-get install -y findutils gawk sed`。  
- **`No such file or directory`** → 确保在**仓库根目录**执行、`lab/linux` 已存在。  
- **权限不对** → `chmod 600 lab/linux/report.txt`；查看：`ls -l` 或 `stat`。  
- **输出为空** → 确认源文件路径正确、源文件非空。

---

## 命令速查
| 命令 | 用途 | 示例 |
|---|---|---|
| `find` | 递归查找文件 | `find . -name '*.md'` |
| `wc -l` | 统计行数 | `wc -l README.md` |
| `awk` | 按列处理文本 | `awk '{print $1}' file` |
| `sed` | 行范围/正则处理 | `sed -n '1,10p' file` |
| `dd` | 造测试文件 | `dd if=/dev/zero of=dummy.bin bs=1M count=2` |
| `ls -lh` | 人类可读大小 | `ls -lh file` |
| `chmod` | 改权限 | `chmod 600 file` |

---

## 清理（可选）
```bash
rm -f lab/linux/dummy.bin
```
