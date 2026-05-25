# Progress — Yi Wang 个人网站

> **最后更新**：2026-05-25  
> **当前 commit**：`cc15b49 Add credentials page and streamline profile.`  
> **本地分支**：`main`（尚未 push 到 GitHub）  
> 详细架构与决策见 `PLAN.md`；本文件只记录"做到哪 / 下一步"。

---

## 一句话状态

主页 + AI 子页 + Credentials 子页三页已成形，内容已用真实 CV 填充，**未抽离 CSS/JS，未配照片，未部署**。

---

## 已完成 ✓

| Step | 内容 | Commit |
|------|------|--------|
| 0 | 决策与规划文档 (PLAN.md) | `33307f8` |
| 1 | 目录骨架 + `index.html` 内容落地（Hero/Education 双卡/Experience zigzag/Case Studies/AI Banner） + 新建 `ai.html` | `33307f8` |
| 2 | 新增 Leadership & Volunteering（双卡）、Contact；后又被 D15/D16 调整 | `cc15b49` |
| 2.5 | 新增 `credentials.html`；主页 About 合并进 Profile；移除主页 Skills；导航 + Footer 全面同步 | `cc15b49` |

---

## 🎯 下一步：Step 3 — 视觉对齐 & CSS/JS 抽离

**第一动作**：把三个 HTML 文件里重复的 `<style>` + `<script>` + Tailwind 配置抽离到外部文件：
- `assets/css/styles.css`（自定义样式：`.bento-card`、`.timeline-node`、`.monogram` 等）
- `assets/js/main.js`（滚动高亮、平滑滚动）
- 三个 HTML 通过 `<link>` / `<script src>` 引用，去掉内联

附带任务（同一 Step 内）：
- 按 `DESIGN.md` 检查 Tailwind `borderRadius` 是否需要调（DESIGN 推荐 `sm = 0.125, DEFAULT = 0.25`，当前是 `DEFAULT = 0.125, lg = 0.25`，差一档）
- 检查 `pb-20 md:pb-0`、Hero 装饰旋转等细节是否符合 DESIGN.md
- 三个页面视觉一致性复核（间距、`bg-surface-container-low` 段落节奏）

完成后预期 commit message：`Extract shared CSS/JS into assets and align with design system.`

---

## 待办（按优先级）

| 优先级 | Step | 内容 | 阻塞物 |
|--------|------|------|--------|
| ⏭️ 下一步 | 3 | CSS/JS 抽离 + DESIGN.md 视觉校正 | 无 |
| 中 | 4 | EN / DE 双语切换（`assets/i18n/{en,de}.json` + `i18n.js`） | 无（先做骨架，德文翻译可后补） |
| 中 | 5 | 头像 + favicon + Open Graph 图 + `<meta>` + `CV.pdf` 缓存策略 | **需用户提供素材**（见下方清单） |
| 中 | 6 | 可访问性 & 移动端打磨（focus 样式、键盘导航、360/768/1280 自查） | 无 |
| 高 | 7 | `README.md` + `.gitignore` 完善 + `vercel.json` + GitHub 仓库 + Vercel 部署 | **需用户决定 GitHub 仓库名 + 是否绑定域名** |
| 低 | 8 | dark mode toggle / Plausible 分析 / 微动效 | 无 |

---

## 等用户提供的素材

| 素材 | 落位 | 用途 | 优先级 |
|------|------|------|--------|
| 职业头像 (jpg/png) | `assets/img/photo.jpg` | Hero 头像 | 高 |
| UCEA 配图 | `assets/img/exp/ucea.jpg` | Experience zigzag 左图 | 中 |
| SDIC 配图 | `assets/img/exp/sdic.jpg` | Experience zigzag 右图 | 中 |
| Abu Dhabi 配图 | `assets/img/exp/abu-dhabi.jpg` | Experience zigzag 左图 | 中 |
| AI Job Search 截图 | `assets/img/ai/job-search-hero.png` | ai.html 旗舰卡右栏 | 中 |
| AI Job Search Live Demo URL | `ai.html`（搜 `target="_blank"`） | 替换占位 `#` | 中 |
| AI Job Search GitHub URL | `ai.html`（同上） | 替换占位 `#` | 中 |
| GMAT 分数 + PDF | `assets/docs/gmat.pdf` + 改 `credentials.html` Score 字段 | Certificates 卡 | 低 |
| IELTS 分数 + PDF | `assets/docs/ielts.pdf` + 改 `credentials.html` Score 字段 | Certificates 卡 | 低 |
| LinkedIn URL | 3 个 html Footer | 社交链接 | 高 |
| GitHub 主页 URL | 3 个 html Footer | 社交链接 | 高 |
| 更多志愿经历（可选） | `index.html` 的 Featured 区中 `Leadership & Volunteering` 小节加新 `<article>` | 用户曾提及还有 | 低 |

---

## 当前文件清单

```
d:\cvhtml\
├── index.html              ✅ 主页（Hero / Education / Experience / Featured / AI Banner / Contact）
├── ai.html                 ✅ AI Lab 子页（Job Search Stack 大卡 + 占位区）
├── credentials.html        ✅ 凭证页（Languages / Skills / GMAT+IELTS / References）
├── CV.pdf                  ✅ 简历，已链通
├── PLAN.md                 ✅ 架构与决策
├── PROGRESS.md             ✅ 本文件
├── DESIGN.md               ✅ 设计系统
├── .gitignore              ✅
├── code.html               ⚠️ 旧模板草稿，未跟踪，可随时删
├── screen.png              ⚠️ 视觉参考截图，已被 .gitignore 排除
├── stitch_*.zip            ⚠️ 设计素材压缩包，已被 .gitignore 排除
├── CV.pdf                  ✅
└── assets/
    ├── css/                📭 空目录（Step 3 填）
    ├── js/                 📭 空目录（Step 3 填）
    ├── i18n/               📭 空目录（Step 4 填）
    ├── img/                📭 空目录（等素材）
    │   └── exp/            📭
    └── (将新增 docs/)      📭 当 GMAT/IELTS PDF 来时建
```

未决定：是否在 commit 前删除 `code.html`（旧草稿）— 不影响功能。

---

## 下次开始的标准动作

1. 在 Cursor 打开 `d:\cvhtml`
2. 让 AI 读 `PROGRESS.md`、`PLAN.md` 两个文件
3. 跟 AI 说："继续 Step 3" 或 "处理 XX 素材"
4. AI 会按本文件的"下一步"开始，每完成一个动作让你预览/确认再继续
5. 完成 Step 后记得：
   - 让 AI 更新 `PROGRESS.md` 把对应行勾上 ✓
   - `git commit -m "..."`（提交信息见各 Step 的"预期 commit message"）

---

## 已确认的关键决策（速查）

> 完整版在 `PLAN.md` §0

- 语言：英文为主 + 德语切换（D1，Step 4 实现）
- 部署：Vercel 主、GitHub Pages 备（D2，Step 7）
- 文件结构：多文件拆分（D4）
- Hero 照片：保留位，等用户提供（D5）
- 暗色模式：本期不做（D8）
- Experience 布局：之字形图文卡片对（D12 修订版）
- Featured Work & Community：合并 Case Studies（UBS / IPZ / Food System）与 Leadership & Volunteering（D13 修订）
- AI 子页：`ai.html`（D14）
- Credentials 子页：`credentials.html`（D15）
- 主页精简：删 About、删 Skills；Hero 下方数字 stats band 也已删除（D16 修订）

---

## 已知占位 / TODO 在代码里

为方便下次抓取，所有"等素材替换"的位置都在 HTML 里留了路径提示，可以 grep：

```
rg "replace at assets/" .
rg "Pending upload" .
rg "to be added" .
rg "Upload PDF to" .
```
