# 个人 CV 网站 — 实施规划 (PLAN.md)

> Owner: Yi Wang  
> Target: 静态个人网站，部署至 GitHub Pages（或 Vercel/Netlify）  
> 现状：`code.html` 是模板草稿，内容为占位文本；`DESIGN.md` 设计体系完整可沿用；`CV.pdf` 为真实简历内容。  
> 目标：把草稿改造成内容真实、结构清晰、可发布、可维护的个人网站。

---

## 0. 关键决策（已确认 ✓ / 待补充 …）

| # | 决策点 | 最终方案 | 备注 |
|---|--------|----------|------|
| D1 ✓ | 网站语言 | **英文为主 + 德语切换** | 顶部右侧加 `EN / DE` 切换；用 JS 切换 DOM 文案，单文件，SEO 后期再补 `hreflang` |
| D2 ✓ | 部署平台 | **Vercel**（仓库托管在 GitHub） | Preview 部署、自定义域名、Edge CDN、后期可加 serverless 函数；比 GH Pages 更专业 |
| D3 ✓ | 域名 | 先用 Vercel 默认 `*.vercel.app`，后续可绑定自定义域名 | 在 `vercel.json` 里预留好头部缓存策略 |
| D4 ✓ | 文件结构 | **多文件拆分**：`index.html` + `assets/css/styles.css` + `assets/js/main.css` + `assets/i18n/{en,de}.json` + `assets/img/` | 利于后续加更多页面/组件，详见 §4 |
| D5 ✓ | Hero 照片 | 保留照片位（暂用占位 → 之后替换） | 你之后提供 jpg/png，放到 `assets/img/photo.jpg` |
| D6 ✓ | "下载 CV"按钮 | 链接到仓库内 `CV.pdf` | 之后更新简历只需替换文件 + `git push`，网站自动同步；Vercel 自带 CDN 缓存 |
| D7 ✓ | 联系方式 | 邮箱 + LinkedIn + GitHub（明文 + `mailto:`） | 邮箱用轻度反爬（JS 拼接），不上联系表单 |
| D8 ✓ | 暗色模式 | **本期不做**，结构上预留 `data-theme` 钩子 | 后期 1–2 小时即可加 toggle |
| D9 ✓ | 分析统计 | 暂不加 | 后期如需，推荐 Plausible（无 cookie，GDPR 友好） |
| D10 ✓ | 项目展示数量 | 2–4 个（AI Job Search + Master Thesis + UZH Innovathon + 可选 MCM） | 详见 §1.4 |
| **D11 新** | **Education 布局** | **不分页**，改为"双卡片并列"（Master / Bachelor），各自一张信息密度更高的卡片 | 详见 §2.2 |
| D12 ✓ (修订) | **Experience 图文布局** | **之字形 (zigzag) 卡片对**：每段实习一行，左右两块，桌面端图文交错（左图右文 → 右图左文 → 左图右文），移动端单列堆叠（图在上）。图位置先放占位，你后续上传 `assets/img/exp/*.jpg` 即可替换。 | 详见 §2.3 |
| D13 ✓ 修订 | **Featured Work & Community 区块** | 合并 Selected Case Studies 与 Leadership & Volunteering：同一 section 内用二级标题区分 `Selected Case Studies`（UBS / IPZ / Food System）和 `Leadership & Volunteering`（Hack4Good / Tencent） | 见 §2.4 |
| D14 新 | **AI 应用独立子页面** | 新建 `ai.html`：展示 AI Applications & Initiatives，支持 Live Demo / GitHub 外链；主页 nav 加入口；首张内容卡 = AI-Driven Job Search Automation Stack | 见 §2.5 |
| D15 新 | **Credentials 附录子页面** | 新建 `credentials.html`：分类托管 Languages / Skills & Toolkit / Test Scores & Certificates（GMAT, IELTS）/ References。References 默认 "Available upon request"，未来可换成 PDF 下载卡 | 见 §2.6 |
| D16 ✓ 修订 | **主页精简** | 删除主页的 Skills & Languages 区块；删除 About 区块；Hero 下方数字 stats band 也已删除，Profile 只保留 impression 内容；导航中 `About` 移除，新增 `Credentials` | 见 §2.1 |
| D17 提案 (deferred) | **Education 瘦身 + Master Thesis 升级到 Featured** | 用户目前接受现状，先存档不改。详细方案见 §10 Backlog · B1 | 见 §10 |

---

## 1. 内容审计（现有草稿 vs 真实 CV）

下表标出 `code.html` 中需要替换的占位内容。

### 1.1 Hero 区
| 字段 | 草稿现状 | 应替换为（来自 CV） |
|------|----------|-----------------------|
| 标语 | "FINANCE & TECHNOLOGY • Yi Wang" | "MANAGEMENT, DATA SCIENCE & AI • Yi Wang" |
| H1 | "Bridging Finance, Data Science, and AI." | （保留 / 微调："Building from 0 to 1 with Data, AI, and Global Perspective."） |
| 描述段 | 提及"quantitative strategist"，与 CV 定位不符 | 基于 CV Profile：UZH 2026 Graduate（Management & Economics, Data Science track），passionate about AI Agents & LLMs，跨 CH/UAE/CN 经历 |
| 头像 | 模板生成图 | **需你提供真实头像** |
| CTA | Download CV / Contact Me | 同左，但 Download CV 真正指向 `CV.pdf` |

### 1.2 Education
| 草稿 | 真实 CV |
|------|---------|
| Master in Finance & AI (UZH, 2022–2024) | **Master of Management & Economics, Data Science track — University of Zurich (Sep 2023 – Jul 2026)**，GPA 5.0/6；亮点：UZH Innovathon（IPZ 数字出行方案）、Master Thesis（77GB 音乐市场数据 × Python/R 大规模计量研究） |
| B.Sc. Quantitative Economics (Top-tier University, 2018–2022) | **Bachelor of Finance — Xi'an International Studies University (Sep 2019 – Jul 2023)**，排名 1/56，GPA 92/100，Best Undergraduate Thesis Award |

### 1.3 Experience（CV 有 3 段实习，草稿只有 2 段且全部为占位）
1. **Investment Associate — UCEA Family Office, Zurich (Oct 2024 – Jun 2025)**  
   - Standardized deal-sourcing and data-driven investment documentation  
   - Conducted quantitative valuations to support portfolio strategy
2. **Industry Research Intern — SDIC Securities, Shanghai (Hybrid, Apr – Sep 2024)**  
   - Built complex financial data models in Excel for the Machinery Group  
   - Optimized data extraction & synthesis for institutional client reporting
3. **Business Development Intern — China-UAE Industrial Capacity Cooperation (Jiangsu) Dev. & Mgmt. Ltd., Abu Dhabi (Jul – Aug 2023)**  
   - Optimized cross-border banking setup workflows  
   - Ensured data compliance with VAT regulations for Chinese enterprises

### 1.4 AI Projects / Initiatives（草稿 4 个全是虚构占位）
建议替换为以下真实/可佐证的项目卡片：
1. **AI-Driven Job Search Automation Stack** (May 2026 – Ongoing)  
   Stack: Next.js · Vercel · Convex · LLM · Cursor · Hermes Agent  
   描述：端到端职位发现 → 模型打分 → 应用草稿生成 → 评审 → 投递的全栈产品，计划演进为多用户产品。
2. **Master Thesis — Music Market Econometrics** (UZH, 2025–2026)  
   Stack: Python · R · Chartmetric API · Spotify API  
   描述：77GB 数据规模下的大规模实证研究。
3. **UZH Innovathon — IPZ Digital Mobility Solution**  
   Stack: Rapid prototyping · 设计冲刺  
   描述：为苏黎世公共交通设计数字化出行方案。
4. **(可选) MCM 2021 Finalist (Top 1%)** — AHP + 多目标建模优化复杂食物系统。

### 1.5 现草稿缺失、建议新增的板块
- **Awards & Honors**（MCM Finalist 2021、UBS Case Competition 2026 Finalist、Best Undergraduate Thesis Award）
- **Leadership & Volunteering**（Hack4Good @ Analytics Club ETH；Tencent Public Welfare BU）
- **Skills**（Python / SQL / R / Excel / Cursor / Agents / LLMs / Financial Modeling）+ **Languages**（EN C1, ZH Native, DE A2–B1）
- **Contact**（邮箱 yi.wang.max@gmail.com、+41 77 225 40 63、Zurich、LinkedIn、GitHub）

---

## 2. 目标信息架构（修订版 — 两层页面）

> 双层架构：**主页 `index.html`** 偏学术/经历；**子页 `ai.html`** 偏 AI 产品探索。

### 主页 `index.html`
单页滚动 + Sticky Header（后期加 EN/DE 切换器） + Mobile Tab Bar：
1. **Hero / Profile**（impression：姓名、定位、头像、CTA）— 合并并精简了原 About，已删除重复数字卡
2. **Education**（**双卡片并列**布局，Master / Bachelor）— §2.2
3. **Experience**（3 段实习，**之字形图文卡片**）— §2.3
4. **Featured Work & Community**（合并 Case Studies + Leadership & Volunteering，页面内二级区分）— §2.4
5. **AI Initiatives Banner**（banner 风格 CTA，引导跳转到 `ai.html`）— §2.5
6. **Contact**
7. **Footer**（含 Credentials 链接）

> Skills / Languages / Awards / Certificates / References 全部迁移到 `credentials.html`（§2.6）。

导航：`Profile · Education · Experience · Featured · AI Lab · Credentials · Contact · Resume(CV.pdf)`  
移动 Tab Bar 5 项：`Profile · Education · Work · Featured · AI Lab`（Credentials 仅桌面 + Footer 入口）

### 子页 `credentials.html` — §2.6
- 简化 header（Logo / 全套 nav / Resume 按钮），`Credentials` 高亮
- Hero："Credentials & Documents — Languages, toolkit, test scores, and references."
- 区块：
  1. **Languages** — 3 张语言水平卡（Mandarin Native / English C1 / German A2–B1）
  2. **Skills & Toolkit** — 分类 chips：Technical & Analytical（Python, SQL, R, Excel, Financial Modeling, Econometrics）+ AI & Product（Cursor, AI Agents, LLMs, Next.js, Vercel, Convex）
  3. **Test Scores & Certificates** — GMAT / IELTS 卡片骨架，"View certificate PDF →" 链接占位（你后续上传 `assets/docs/gmat.pdf` 等替换）
  4. **References** — 默认 "Available upon request" + email CTA；未来加单条推荐人卡（含 PDF 下载）

### 子页 `ai.html` — §2.5
- 简化 header（Yi Wang logo / "← Back to portfolio" / Resume 按钮）
- Hero："AI Applications & Initiatives — Building practical AI products from 0 to 1."
- 项目大卡：AI-Driven Job Search Automation Stack
  - 描述、技术栈、时间线
  - **CTA**：`Live Demo →`、`GitHub →`（链接待你提供）
  - 截图区（你后续上传 `assets/img/ai/job-search-*.png`）
- 占位区："More explorations coming." — 未来可加更多 AI 项目
- 同主页 Footer

---

### 2.1 语言切换器 (EN / DE)

- 位置：桌面端 Header 右侧、Resume 按钮**之前**；移动端进入"汉堡菜单"或顶部右上角小型 chip
- 实现：所有可翻译文案在 HTML 上标 `data-i18n="hero.title"` 之类的 key，翻译表放 `assets/i18n/en.json` / `de.json`
- 默认语言：浏览器 `navigator.language` 检测 → 命中 `de*` 显示德语，否则英语；用户手动切换后存 `localStorage`
- URL：不带 hash 参数（避免破坏锚点），靠 localStorage 记忆
- 初期翻译范围：导航 / Hero / 按钮文案 / Section 标题 + 摘要句。**实习/项目的详细 bullet 暂时只出英文**（德语翻译工作量大，可分阶段完成）

---

### 2.2 Education 布局（双卡片并列）

替代原"单线时间轴 2 节点"的稀疏感，改成 2 张并列卡片（桌面端 1×2、移动端 1×1）：

```
┌──────────────────────────────┐ ┌──────────────────────────────┐
│ 2023 — 2026                  │ │ 2019 — 2023                  │
│ University of Zurich         │ │ Xi'an International Studies  │
│ M.A. Management & Economics  │ │ B.Sc. Finance                │
│ Data Science Track           │ │ Ranking 1/56 · GPA 92/100    │
│ GPA 5.0 / 6                  │ │ Best Undergraduate Thesis    │
│ ─────────────────────────    │ │ ─────────────────────────    │
│ Highlights:                  │ │ Highlights:                  │
│ · UZH Innovathon — IPZ       │ │ · 4 年保持专业第一            │
│ · Master Thesis · 77GB data  │ │ · Best Undergraduate Thesis  │
│   (Chartmetric × Spotify)    │ │   Award                      │
└──────────────────────────────┘ └──────────────────────────────┘
```

每张卡片：左上角彩色小图标（mortarboard 或学校 mark）、日期 mono 字体、学位粗体、亮点 bullet list、可选学校官网外链。

---

### 2.3 Experience 图文布局（修订版：之字形 zigzag 卡片对）

3 段实习按 CV **倒序**：UCEA (Zurich) → SDIC (Shanghai) → China-UAE (Abu Dhabi)。每段实习一行，桌面端左右两块（一块文 + 一块图），三行交错排列：

```
桌面端：
┌─────────────┐  Oct 2024 – Jun 2025
│  [图 UCEA]  │  Investment Associate
│ assets/img/ │  UCEA Family Office · Zurich, Switzerland
│ exp/ucea.jpg│  · …bullets…
└─────────────┘

  Apr 2024 – Sep 2024              ┌─────────────┐
  Industry Research Intern         │ [图 SDIC]   │
  SDIC Securities · Shanghai       │ exp/sdic.jpg│
  · …bullets…                      └─────────────┘

┌─────────────┐  Jul 2023 – Aug 2023
│ [图 CN·UAE] │  Business Development Intern
│ exp/        │  China-UAE Industrial Capacity Cooperation
│ abu-dhabi.  │  Abu Dhabi, UAE
│ jpg         │  · …bullets…
└─────────────┘

移动端：单列堆叠，每段实习上图下文（图始终先于文，统一视觉锚点）
```

**图位占位策略**：图片不存在时显示浅灰背景 + 中央语义图标（`apartment`/`account_balance`/`public`）+ "Photo for [Company]" 小字提示。等你上传到 `assets/img/exp/{ucea,sdic,abu-dhabi}.jpg` 后自动覆盖占位。建议比例 4:3 或 3:2，便于横向并排。

---

### 2.4 Featured Work & Community — §2.4

3 张并列卡片（桌面 3 列、平板 2 列、移动 1 列），每张卡片含：图标 + 类型标签 + 标题 + 1–2 句描述 + 可选 "Read more →" CTA。

| 卡片 | 类型标签 | 标题 | 描述 | 来源 |
|------|---------|------|------|------|
| 1 | COMPETITION · FINANCE | UBS Inter-University Case Competition | National Finalist (Top 7%). Selected among 700+ candidates for national investment simulations and banking case studies. Zurich, 2026. | CV §Awards |
| 2 | INNOVATION · MOBILITY | IPZ Digital Mobility | UZH Innovathon — designed a digital mobility solution for Verkehrsbetriebe Zürich within an intensive innovation marathon. | CV §Education |
| 3 | MODELING · MCM 2021 | Food System Optimization | Mathematical Contest in Modeling — Finalist (Top 1%). Optimized complex food systems using AHP and multi-objective modeling. | CV §Awards |

CTA 链接初期都是 `#`（占位），未来可以为每个 case 写一篇详细 case study 页面 `cases/ubs-2026.html` 等。

---

### 2.5 AI Initiatives Banner + 子页面 `ai.html`

**主页 banner**（整宽一行，渐变背景 + CTA 按钮）：
> **AI Applications & Initiatives**  
> Beyond academics and competitions, I explore AI-driven products in motion.  
> `[View AI Lab →]` 跳转到 `ai.html`

**子页 `ai.html`**：聚焦 AI 产品/实验展示。第一项内容卡：
- **AI-Driven Job Search Automation Stack** (May 2026 – Ongoing)
- 技术栈：Next.js · Vercel · Convex · LLM · Cursor · Hermes Agent
- 描述：端到端流程（存储职位 → 模型打分 → 排名 → shortlist → LLM 起草申请 → 评审），单一可扩展产品面板。
- CTA：`Live Demo →` + `GitHub →`（**链接待你提供**）
- 截图位（**待你上传**）
- 底部："More explorations coming." 占位，未来加新项目即可。

(以下原有 4 种备选方案保留作为历史参考，但已不采用)

#### ~~方案 A · 纯文字垂直时间轴（最 Swiss、信息密度最高）~~
```
│
●─ Oct 2024 – Jun 2025    UCEA Family Office · Zurich
│   Investment Associate
│   · …
│   · …
│
●─ Apr 2024 – Sep 2024    SDIC Securities · Shanghai
│   Industry Research Intern (Machinery Group)
│   · …
```
**优点**：极简、加载快、对齐严谨、不需要额外素材  
**缺点**：3 段经历视觉上稍单调，没有图像锚点

#### 方案 B · 时间轴 + 右侧小图（Logo / 城市轮廓）⭐ 我的推荐
```
│
●─ 2024–2025  ┌────────────────────────────────┐  ┌─────┐
│             │ UCEA Family Office · Zurich    │  │ ZH  │ ← 64×64 小图
│             │ Investment Associate · …       │  │ logo│
│             └────────────────────────────────┘  └─────┘
```
**优点**：保留 Swiss 节奏，又有公司/城市识别度；只需要 64×64 的图  
**缺点**：需要你提供（或我用 Unsplash CC 找）3 张 logo / 城市极简图

#### 方案 C · 卡片网格（每段实习一张大卡片，图在上）
```
┌────────────────────┐  ┌────────────────────┐  ┌────────────────────┐
│  [Zurich skyline]  │  │  [Shanghai bund]   │  │  [Abu Dhabi skyline]│
│  UCEA · 2024–2025  │  │  SDIC · 2024       │  │  China-UAE · 2023  │
│  Investment Assoc. │  │  Research Intern   │  │  BD Intern         │
│  · …               │  │  · …               │  │  · …               │
└────────────────────┘  └────────────────────┘  └────────────────────┘
```
**优点**：图文并茂、视觉冲击力大、三地国际背景被一眼看到  
**缺点**：信息密度低，bullet 多了卡片会很高；需要 3 张高质量横图（建议城市图）

#### 方案 D · 之字形交错（zigzag，左图右文交替）
```
┌─────────┐  UCEA Family Office · Zurich
│  Zurich │  Oct 2024 – Jun 2025 · Investment Associate
│  图     │  · …
└─────────┘  · …

                        SDIC Securities · Shanghai  ┌──────────┐
                        Apr 2024 – Sep 2024 · …    │ Shanghai │
                        · …                         │  图      │
                                                    └──────────┘
```
**优点**：阅读节奏强、有杂志感、3 段经历正好交替对称  
**缺点**：移动端会回退成单列堆叠（自动处理）；图片要求最高（3 张大横图）

> **我的推荐：方案 B**。理由：保留 DESIGN.md 强调的"Swiss 垂直轴 + 时间标签"语言；又通过小尺寸 logo / 城市轮廓增加视觉锚点；素材需求最低（64×64 即可）。**如果你想突出"跨 3 大洲"的国际背景，可以选方案 C**。

请回复选择：A / B / C / D。

---

## 3. 视觉与设计规范

完全沿用 `DESIGN.md`：
- 主色 `#021525` Deep Navy，强调色 `#007AFF` Electric Blue
- 字体 Inter + JetBrains Mono（用于日期与代码风标签）
- 卡片仅 4px 圆角、1px 边框、Hover 抬升阴影 `0 10px 30px rgba(23,42,58,.08)`
- 12 栏栅格，最大宽度 1280px，桌面 80px / 移动 20px 边距
- Sticky Header 使用 `backdrop-blur(12px)` + 90% 不透明白底

需要在 `code.html` 现有 Tailwind 配置上修补：
- `borderRadius` 配置与 DESIGN.md 不一致（草稿里 `DEFAULT: 0.125rem`，DESIGN.md 是 `0.25rem`），统一到 DESIGN.md
- 把 `pb-20 md:pb-0` 之类小问题顺手清理

---

## 4. 技术与文件结构

按 **D4（多文件拆分）** 最终结构：

```
cvhtml/
├── index.html                  # 主页：Hero + Education + Experience + Case Studies + AI Banner
├── ai.html                     # 子页：AI Applications & Initiatives
├── CV.pdf                      # 简历，供下载
├── vercel.json                 # Vercel 部署配置（缓存/重定向/header）
├── assets/
│   ├── css/
│   │   └── styles.css          # 自定义样式（Step 3 抽离）
│   ├── js/
│   │   ├── main.js             # 滚动高亮、平滑滚动（Step 3 抽离）
│   │   └── i18n.js             # EN/DE 切换（Step 4）
│   ├── i18n/
│   │   ├── en.json             # 英文文案（Step 4）
│   │   └── de.json             # 德文文案（Step 4）
│   └── img/
│       ├── photo.jpg           # Hero 头像（占位 → 你提供后替换）
│       ├── favicon.svg         # 站点图标（Step 5）
│       ├── og-cover.png        # 社交分享预览图（Step 5）
│       ├── exp/                # 实习章节图（zigzag 右侧大图）
│       │   ├── ucea.jpg
│       │   ├── sdic.jpg
│       │   └── abu-dhabi.jpg
│       └── ai/                 # AI 子页项目截图
│           └── job-search-*.png
├── README.md                   # 项目说明 + 本地预览 + 部署指引
├── DESIGN.md                   # 已存在，保留
├── PLAN.md                     # 本规划文档
└── .gitignore                  # 忽略系统垃圾/压缩包等
```

**Tailwind 策略**：继续用 `cdn.tailwindcss.com`（零构建），自定义 token 写在 `<script>tailwind.config = …</script>` 里。如果未来需要更严格的产物，再迁移到 `npm + Tailwind CLI`（PLAN 里先不上构建链）。

需要清理 / 处理：
- `code.html` → 拆分内容后**删除**（改用 `index.html`）
- `stitch_swiss_corporate_tech_portfolio.zip` → 删除（不进仓库）
- `screen.png` → 移到 `docs/screen.png` 仅作内部参考，或直接删除

---

## 5. 部署方案（Vercel 主，GitHub Pages 备）

### 主方案 · Vercel
1. 在 GitHub 新建仓库（如 `yi-wang-portfolio`），把本目录 push 上去
2. 登录 [vercel.com](https://vercel.com) → "Add New Project" → 选这个 GitHub 仓库
3. Framework Preset 选 **Other**（纯静态，无需 build command），Root Directory 默认 `./`
4. Deploy → 几十秒后拿到 `https://yi-wang-portfolio.vercel.app`
5. 每次 `git push origin main` 自动重新部署；PR 自动有 Preview 链接
6. （可选）Settings → Domains 绑定自定义域名，按提示在域名商加 CNAME 即可

`vercel.json` 预留内容（强缓存 CV.pdf、合理 cache 静态资源）：
```json
{
  "headers": [
    { "source": "/CV.pdf", "headers": [{ "key": "Cache-Control", "value": "public, max-age=3600, must-revalidate" }] },
    { "source": "/assets/(.*)", "headers": [{ "key": "Cache-Control", "value": "public, max-age=31536000, immutable" }] }
  ]
}
```

### 备用方案 · GitHub Pages
保持仓库结构不变即可同时支持。Settings → Pages → Source 选 `main` / root，访问 `https://<user>.github.io/<repo>/`。`README.md` 里两套都写。

---

## 6. 可访问性与质量基线

- 语义化标签：`<header><nav><main><section><article><footer>`
- 所有图片有 `alt`
- 颜色对比度通过 WCAG AA（主色 vs 白底已满足）
- Tab 键焦点可见（focus-visible 样式）
- 移动端单列布局，触控目标 ≥ 44px
- `<title>` / `<meta description>` / Open Graph 标签到位（分享到 LinkedIn/Twitter 时有预览）
- HTML 通过 W3C 校验，无控制台错误
- Lighthouse 目标：Performance ≥ 90，Accessibility ≥ 95，SEO ≥ 95

---

## 7. 分步执行计划（你确认后我会一步一步做）

每一步完成后我会暂停，等你看效果再继续。

- **Step 1 — 目录骨架 + index.html 内容落地**  
  建立 §4 的目录结构（`assets/css`、`assets/js`、`assets/i18n`、`assets/img`），把现有 `code.html` 重构为新 `index.html`，**写入 §1 真实 CV 内容**（先英文一种语言），Education 改为双卡片布局，Experience 按你选的 D12 方案排版。该步只动结构与文案，不加新章节。
- **Step 2 — 结构扩展**  
  按 §2 新增 About / Awards & Leadership / Skills & Languages / Contact 章节，更新桌面 nav 与移动 Tab Bar。
- **Step 3 — 视觉对齐 & CSS/JS 抽离**  
  把 `<style>` / `<script>` 抽到 `assets/css/styles.css` 和 `assets/js/main.js`；按 DESIGN.md 校正 Tailwind 配置（圆角、间距、Hero 装饰）。
- **Step 4 — 双语切换 (EN / DE)**  
  写 `assets/i18n/en.json` 与 `de.json`，实现 `i18n.js`：DOM `data-i18n` 替换、`localStorage` 记忆、Header 切换器 UI。德文版先做导航/Hero/Section 标题/按钮，详细 bullet 暂英文。
- **Step 5 — 资源 & SEO**  
  设计 `favicon.svg`（极简 "YW" mark）、占位 `photo.jpg`、`og-cover.png`，补齐 `<meta description>`、Open Graph、Twitter Card；确认 `CV.pdf` 下载可用。
- **Step 6 — 可访问性 & 移动端打磨**  
  键盘导航、`:focus-visible` 样式、对比度复核；360 / 768 / 1280 三种宽度自查。
- **Step 7 — 仓库初始化 & 部署文档**  
  写 `README.md`、`.gitignore`、`vercel.json`；说明 Vercel + GitHub Pages 两种部署路径。
- **Step 8 — （后续，按需）增强项**  
  Dark mode toggle / Plausible 统计 / 微动效 / 自定义域名绑定。

---

## 8. 风险与开放问题

1. **照片缺失**：Hero 区域没有真实头像前会用占位灰块，避免线上显示 AI 生成的人脸。
2. **项目 2 / 3 的可演示链接**：AI Job Search 项目是否已经有公开仓库 / 在线 demo URL？如果有请提供。
3. **未来更新**：未来要再加博客或长文章吗？如果是，结构上会预留 `/posts/`，否则保持纯单页。
4. **隐私**：电话号码是否要公开在网站上？默认建议**只放邮箱**，电话留给 PDF 简历。

---

## 9. 等你确认的输入清单

D1–D11 已敲定 ✓。**进入 Step 1 之前，只剩以下事项：**

**已确认 ✓：**
- [x] D12 = B（时间轴 + 小 monogram logo）
- [x] Hero H1 = *"Building from 0 to 1 with Data, AI, and Global Perspective."*

**可后补（影响 Step 4/5，不影响 Step 1 推进）：**
- [ ] **§8.4 电话号码**：是否公开在 Contact 区？默认建议**只放邮箱**，电话留给 PDF。
- [ ] **头像图片** `assets/img/photo.jpg`（Step 5 前提供即可，先用占位）
- [ ] **LinkedIn / GitHub 个人主页链接**（Step 2 时填进 Footer & Contact）
- [ ] **AI Job Search 项目链接**（公开仓库 URL / 在线 demo URL，Step 2 时填进项目卡）
- [ ] **是否需要"跨 3 国"叙事**：如果选 C 方案需要 3 张城市横图，我可以用 Unsplash CC0 素材选好备选给你确认

---

*规划文档结束。回复 D12 + Hero H1 后即可开始 Step 1。*

---

## 10. Backlog · 待选优化提案

> 这一节登记**已讨论过但当前未执行**的优化方案。每条都有一段背景 + 具体改动 + 决策状态。下次想做时直接挑一条说"做 B1"即可。

### B1 · Education 瘦身 + Master Thesis 升级到 Featured

**状态**：2026-05-25 讨论 → **deferred**（用户接受现状）  
**关联决策**：D17 提案

**背景**  
对一个 2026 应届生，完全删除 Education 会损失：UZH 品牌、M.A. Management & Economics · Data Science track、GPA 5.0/6、本科 1/56 排名、Best Undergraduate Thesis Award、Master Thesis 题目。用户讨论时倾向"如果重要项目都在 Experience / Featured / AI Lab 里，就可以删 Education"——但盘点下来这些硬信息只在 Education 区出现。结论：**保留但归类更清晰**。把 Education 留下做"学历凭证"展示，把"研究内容"挪出去单独突出。

**两步合并方案 A + B**

**A · Education 瘦身**
- 保留 2 张卡片（Master / Bachelor）并列布局
- 每张卡只剩：日期 / 学位 / 学校 / 关键数字（GPA 或排名）
- **完全删除** "Highlights" bullets 区
- Bachelor 卡底部增加单个荣誉 chip：`🏆 Best Undergraduate Thesis Award`
- 视觉效果：Education section 高度减半

**B · Master Thesis 升级**
- 在 Featured 区的 `Selected Case Studies` 小节里新增第 4 张卡 = Master Thesis
- 推荐版式 **B-i**：1 大 + 3 小 Bento — Master Thesis 横向占满一行（旗舰卡，左大图标/数据渐变，右文字），下面 UBS / IPZ / Food System 三张同尺寸
- 卡内容：
  - Label: `Research · Econometrics`
  - Title: `Music Market Econometrics (Master Thesis)`
  - Time chip: `UZH 2025–2026`
  - 描述：Large-scale econometric research on 77 GB of music market data, combining streaming and chart performance metrics via the Chartmetric and Spotify APIs.
  - Stack chips: `Python` · `R` · `Chartmetric API` · `Spotify API`
  - Icon: `analytics` 或 `insights`
  - CTA: `Case study →`（占位）

**副作用清单**
- Education Master 卡删除 "Master Thesis…77 GB…" bullet（信息已挪到 Featured）
- Education Master 卡删除 "UZH Innovathon…IPZ" bullet（已在 Featured 第 2 张 case study）
- Education Bachelor 卡删除第 2 条 bullet "maintained top-of-cohort…"（与排名 1/56 重复）
- Education Bachelor 卡保留 "Best Undergraduate Thesis Award" 改为 chip 样式
- PLAN.md / PROGRESS.md 同步更新 D17 状态

**预期 commit**：`Compact Education and elevate Master Thesis to Featured.`

---

### B2 · AI Lab 占位 CTA 文案优化

**状态**：2026-05-25 提议 → **deferred**

**背景**  
`ai.html` 里 "Live Demo" 和 "GitHub" 两个按钮的 `href` 都是 `#`，访客点击什么都没发生，体验不好。

**改动建议**（用户提供真实链接前）
- 把两个按钮改为 `disabled`-style：灰色边框、不可点击、文案改 `Live Demo · Coming soon` 和 `GitHub · Coming soon`
- 或在按钮下方加一行小字：`Available to share by request — drop me an email.`
- 一旦用户给出真实 URL，把 `href="#"` 替换并恢复 hover 状态即可

**预期 commit**：`Soften AI Lab CTA placeholders.`

---

### B3 · Experience 占位图文案隐藏文件路径

**状态**：2026-05-25 提议 → **deferred**

**背景**  
Experience 三段实习的图片占位区现在显示 "Photo · UCEA · Zurich" + "replace at assets/img/exp/ucea.jpg"。第二行暴露了文件路径，对访客（特别是 HR）来说会觉得"网站半成品"。

**改动建议**（用户上传配图前）
- 删除每张占位图里的第二行 `replace at assets/img/exp/xxx.jpg`
- 只保留 icon + "Photo · UCEA · Zurich" 这类标识
- 看起来更像"刻意设计的极简插画"而不是开发占位
- 一旦用户上传 jpg/png 到对应路径，占位自动被照片覆盖（onerror 隐藏逻辑已经写好）

**预期 commit**：`Tidy Experience photo placeholders.`

---

### B4 · 顶部"Open to roles" 状态条（可选）

**状态**：2026-05-25 简单提及 → **deferred**

**背景**  
找工作期间常见做法：在 Hero 上方或导航下方加一条细长状态条，例如 `🟢 Open to full-time roles · starting Jul 2026 · Zurich / Remote`。便于访客 5 秒内 get 你的求职状态。

**改动建议**
- 一行细 banner，浅灰背景 + 绿点指示器 + mono 字体
- 全站 3 个页面统一显示
- 找到工作后可一键关闭（注释掉即可）

**预期 commit**：`Add availability status banner.`

---

> 后续优化想法请追加到本节，保持"提案 → 讨论 → 决策"三态可追溯。
