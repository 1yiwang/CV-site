# Progress — Yi Wang 个人网站

> **最后更新**：2026-05-25  
> **当前 commit**：`55346cd content: settle on hero H1 'theory to product' and drop placeholder case-study links`  
> **本地分支**：`main`（已 push 到 GitHub `1yiwang/CV-site`）  
> **部署状态**：✅ Vercel 已上线，每次 `git push` 自动部署  
> 详细架构与决策见 `PLAN.md`；本文件只记录"做到哪 / 下一步"。

---

## 一句话状态

三页（主页 + AI Lab + Credentials）**已上线 Vercel**；真实素材 / Live Demo / GitHub / LinkedIn / 头像全部接入并部署。当前阶段：**内容文案 + 字号 / 布局打磨已定版**（详见 Step 2.7）。下一步可推进 Step 3（CSS/JS 抽离）或 Step 7（自定义域名 + SEO meta）。

---

## 已完成 ✓

| Step | 内容 | Commit |
|------|------|--------|
| 0 | 决策与规划文档 (PLAN.md) | `33307f8` |
| 1 | 目录骨架 + `index.html` 内容落地（Hero/Education 双卡/Experience zigzag/Case Studies/AI Banner） + 新建 `ai.html` | `33307f8` |
| 2 | 新增 Leadership & Volunteering（双卡）、Contact；后又被 D15/D16 调整 | `cc15b49` |
| 2.5 | 新增 `credentials.html`；主页 About 合并进 Profile；移除主页 Skills；导航 + Footer 全面同步 | `cc15b49` |
| 2.6 | **真实素材接入** + **B3 完成**：`photo.jpg` / 3 张 exp jpg / AI Lab 双截图全部就位；AI Lab Live Demo + GitHub、3 页 Footer LinkedIn + GitHub 全接通；Experience 三处"replace at..."占位文案删除；删除旧草稿 `code.html` | `cc15b49` |
| 2.7 | **UI 打磨 & 文案定版**：详见下方"近期打磨明细 (Step 2.7)" 小节 | `bb8471d` → `55346cd` |

### 近期打磨明细（Step 2.7）

**导航 & 全局**
- 去掉桌面导航 `Yi Wang` 旁的 `bolt` 闪电图标
- `Resume` 按钮 → `Let's talk` CTA（跳 `#Contact`）；删除导航里的 `Contact` 文字链
- 桌面导航链接字号 12px → 14px
- Scroll-spy 脚本跳过 `.nav-cta` 类，避免按钮被当作普通链接高亮

**字号体系**
- Hero H1：30 / 48px（手机 / 桌面）—— 全站唯一保留 48px 的标题
- Contact H2 "Let's connect."：同步 30 / 48px，与 Hero H1 视觉对齐
- 其他所有标题（Education / Experience / Featured / AI Lab Banner / Languages / Skills / Test Scores / References / 子页 Hero H1 / Featured Project H2）**统一 30px，不分视口**
- Volunteering 卡片 H3（Analytics Club / Tencent）24px → 20px，与 Case Study 卡 H3 对齐

**布局 & 响应式**
- 移动端 Hero 重排：文字 / 介绍 → 照片 → CTA 按钮
- Hero / Contact CTA 按钮缩小并能并排：`px-4 md:px-8 py-2.5 md:py-4 text-sm md:text-base`
- Contact 区加 **Download CV** 按钮
- AI Lab Featured Project 右栏改两张图竖排（`object-contain` + 灰底，不裁切）

**Footer 收口**
- 三页 Footer 删 social 链接，保留版权 + 单一上下文链接（首页→Credentials、ai→Credentials、credentials→AI Lab）
- 版权行 `Built from 0 to 1 in Zürich.` → `Built in Zürich, Switzerland.`

**文案定版**
- Hero chip：`Management, Data Science & AI` → `Economics, Data Science & AI`
- 页面 `<title>`：`Yi Wang — Economics, Data Science & AI`
- Hero H1 经历多轮迭代，定版：**`Bridging Finance, Data, and AI — from theory to product.`**
  - 决策原则：不用 `research`（无学术研究产出）、不用 `real world`（偏幼稚）、不用 `leveraging / empowering / transform business`（套话）、不用 `AI enthusiast`（弱化资历感）
- Contact blurb 重写为强调 finance × data science × AI 的 intersection

**清理**
- Selected Case Studies 三张卡（UBS / IPZ / Food System）底部的 `Case study →` 占位链接（`href="#"`）全部删除

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
| 高 | 7 | 自定义域名接入 + `README.md` + Open Graph / SEO meta | **需用户挑域名 + 注册商**（GitHub repo 与 Vercel 部署已完成） |
| 低 | 8 | dark mode toggle / Plausible 分析 / 微动效 | 无 |

### 已讨论但暂未执行的改动（Backlog）

详见 `PLAN.md §10`：

- **B1** · Education 瘦身 + Master Thesis 升级到 Featured（A+B 合并方案，最重要的一条）
- **B2** · AI Lab "Coming soon" 占位 CTA 文案
- ~~**B3** · Experience 占位图隐藏文件路径提示~~ ✅ 已完成（Step 2.6）
- **B4** · 顶部 "Open to roles" 状态条（找工作期间用）
- **B5** · Case Study 卡片填补真实链接（UBS 决赛报告 / IPZ writeup / MCM 论文 PDF）—— 占位链接已删，等真实材料补回

下次想做随时说"做 B1" 或一起做 B1+B2+B4+B5 都行。

---

## 等用户提供的素材

| 素材 | 落位 | 用途 | 状态 |
|------|------|------|------|
| 职业头像 | `assets/img/photo.jpg` | Hero 头像 | ✅ 已接入 |
| UCEA 配图 | `assets/img/exp/ucea.jpg` | Experience zigzag #1 | ✅ 已接入 |
| SDIC 配图 | `assets/img/exp/sdic.jpg` | Experience zigzag #2 | ✅ 已接入 |
| Abu Dhabi 配图 | `assets/img/exp/abu-dhabi.jpg` | Experience zigzag #3 | ✅ 已接入 |
| AI Job Search 截图 | `assets/img/ai/job-search-hero.png` | ai.html 旗舰卡右栏 | ✅ 已接入 |
| AI Job Search Live Demo URL | `ai.html` | swiss-job-agent vercel.app | ✅ 已接通 |
| AI Job Search GitHub URL | `ai.html` | github.com/1yiwang/SwissJobAgent | ✅ 已接通 |
| LinkedIn URL | 3 个 html Footer + index Contact | linkedin.com/in/yi-wang-783513299 | ✅ 已接通 |
| GitHub 主页 URL | 3 个 html Footer + index Contact | github.com/1yiwang | ✅ 已接通 |
| **GitHub repo `CV-site`** | `github.com/1yiwang/CV-site` | 用于部署 | ✅ 已建立 + push |
| Vercel 部署 | 自动绑定 `main` 分支 | CI/CD | ✅ 已上线，每次 push 自动部署 |
| **自定义域名** | Vercel project → Domains | 长期 portfolio 入口 | ⏳ **用户决策中**（名字 + 注册商） |
| GMAT 分数 + PDF | `assets/docs/gmat.pdf` + 改 `credentials.html` Score 字段 | Certificates 卡 | 低优先级 待补 |
| IELTS 分数 + PDF | `assets/docs/ielts.pdf` + 改 `credentials.html` Score 字段 | Certificates 卡 | 低优先级 待补 |
| 更多志愿经历（可选） | `index.html` 的 Featured 区中 `Leadership & Volunteering` 小节加新 `<article>` | 用户曾提及还有 | 低优先级 待补 |

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
├── screen.png              ⚠️ 视觉参考截图，已被 .gitignore 排除
├── stitch_*.zip            ⚠️ 设计素材压缩包，已被 .gitignore 排除
└── assets/
    ├── css/                📭 空目录（Step 3 填）
    ├── js/                 📭 空目录（Step 3 填）
    ├── i18n/               📭 空目录（Step 4 填）
    └── img/
        ├── photo.jpg               ✅ Hero 头像
        ├── exp/
        │   ├── ucea.jpg            ✅
        │   ├── sdic.jpg            ✅
        │   └── abu-dhabi.jpg       ✅
        └── ai/
            └── job-search-hero.png ✅
```

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
