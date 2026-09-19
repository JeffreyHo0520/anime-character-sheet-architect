---
name: anime-character-sheet-architect
description: 動漫與虛擬角色設定集與三視圖架構師 (Anime Character Sheet Architect)。深度拆解經典動漫角色（如七龍珠、火影、海賊王、咒術等）或原創虛擬角色之視覺 DNA，自動調用原生生圖工具生成 16:9 全視角角色設定圖（含正身、3/4 側視、正側輪廓、背面視圖、4款表情矩陣、標準色票）與 1:1 核心肖像頭像，自動存檔至本機工作區，並產出包含特徵錨定表、色票規範與後續創作提示詞模板的完整視覺手冊。當使用者提到「做角色設定圖」、「角色三視圖」、「虛擬角色母檔」、「角色視覺指南」、「動漫角色設定資料」、「角色的角色設定圖」、「動漫角色 Turnaround」、「角色設定集」時觸發。
---

# 動漫與虛擬角色設定集與三視圖架構師 (Anime Character Sheet Architect)

專為動漫、漫畫、VTuber 與原創虛擬 IP 角色打造官方動畫級 **角色設定集（Character Model Sheet / Turnaround Sheet）** 與 **視覺特徵錨定系統** 的全方位工程化技能。
能將使用者的角色需求（經典 ACG 角色復刻或全新虛擬 IP），無縫轉化為具備多角度全身迴轉、表情矩陣、標準色票與特徵鎖定提示詞的完整工業級資產，作為後續生成 LINE 貼圖、社群頭像、插畫或 3D 模型的高保真基準母檔。

---

## 🎯 核心定位與設計價值

1. **視覺基因精準拆解（Visual DNA Extraction）**：深度解構髮型、眼眸形狀、標誌性五官、服飾層次材質、隨身配件與招牌氣場。
2. **官方動畫級設定母圖（16:9 Model Sheet）**：一次生成正面立姿、側斜 3/4 視角、正側面輪廓、背面視圖、四款核心表情（冷靜、微笑、戰鬥、嬌羞/驚訝）與底部色彩代碼條（Color Swatches）。
3. **高解析核心特寫頭像（1:1 Master Avatar）**：生成近景胸上肖像，精細刻畫服飾配件徽章與眼神高光，供 LINE 貼圖 Tab/Main、大頭貼或封面使用。
4. **自動本機資產交付（Local Asset Management）**：主動將圖檔以規範化名稱儲存至使用者當前工作目錄，無需手動另存。
5. **後續創作特徵鎖定模板（Prompt Anchor Template）**：產出結構化提示詞公式，確保下游任務（貼圖、換裝、動作變換）的角色長相 100% 一致。

---

## 📋 標準執行工作流程（5 步工作法）

當使用者提出「製作某個動漫角色的設定圖」、「設定虛擬角色母檔」時，請依據以下 5 個標準步驟執行：

### 步驟 1：角色視覺基因深度拆解 (Visual DNA Breakdown)

在生成任何圖像前，迅速建立角色特徵錨定檔案（可直接於思考中構建或於回覆中列出）：
- **角色身份與世界觀**：角色名字、作品來源（或原創背景設定）。
- **髮型與髮色**：長度、分線、瀏海形態、光澤感、標誌性配件（如別在耳後、金屬髮飾等）。
- **眼眸與五官**：虹膜顏色（如 Cyan-blue）、眼尾線條、眉型、鼻唇線條、招牌表情氣質。
- **服飾穿搭層次**：
  - 上身：內搭、外套/背心、袖子樣式（條紋、純色、材質質感）、標誌性徽章/印花（如紅領巾軍 RR Logo）。
  - 下身：裙/褲、腰帶寬度與搭扣、襪類（黑絲襪、及膝襪、短襪等）。
  - 鞋履：靴子/球鞋、襪口折疊、顏色材質。
- **標誌性配件**：耳環（金屬大圓環、耳釘）、項鍊、手環、隨身道具或武器。
- **目標藝術風格**：鎖定原著大師風格（如鳥山明 Akira Toriyama 風格、荒木飛呂彥風、現代賽璐璐動畫風等）。

---

### 步驟 2：調用 `generate_image` 生成 16:9 角色設定母圖 (Turnaround Sheet)

調用內建 `generate_image` 工具，參數規範如下：
- **`AspectRatio`**：`"16:9"`（標準動畫設定集橫向畫布）
- **`ImageName`**：`<character_name>_sheet`（小寫下底線，至多 3 詞）
- **`Prompt` 編寫公式**：
  ```text
  Official anime character design sheet and turnaround model sheet of [Character Name] from [Anime/IP], created in modern high-fidelity [Artist/Anime Style, e.g. Akira Toriyama] anime style.
  Clean off-white background with subtle character sheet guide lines and color swatches at the bottom.
  Multiple views of [Character Name]:
  - On the left: full-body standing front view in confident relaxed pose.
  - In the center: full-body three-quarter side turnaround view and full-body back view showing hair from behind and back outfit details.
  - On the right: a vertical column of four expressive facial portrait bust shots: 1) cool aloof neutral gaze, 2) confident charming smirk, 3) serious combat battle focus, 4) slightly flustered or cute expression.
  Character features: [Detailed physical traits, hair, eyes, skin tone, accessories].
  Outfit details: [Detailed layers, top, bottom, belt, socks, shoes, colors].
  Professional animation production sheet, crisp cel-shaded lines, authentic [Anime Series] aesthetic, ultra-clean character reference sheet.
  ```

---

### 步驟 3：調用 `generate_image` 生成 1:1 核心肖像頭像 (Master Avatar)

調用內建 `generate_image` 工具生成高清特寫頭像：
- **`AspectRatio`**：`"1:1"`
- **`ImageName`**：`<character_name>_avatar`
- **`Prompt` 編寫公式**：
  ```text
  High-fidelity master anime character portrait of [Character Name] from [Anime/IP], in modern [Style] anime style.
  Waist-up bust portrait, looking slightly towards the viewer with signature [Signature expression, e.g. confident cool smirk].
  [Detailed facial features, hair tucked behind ear, earrings, eye color].
  Wearing [Iconic upper body outfit with chest emblem, textures].
  Clean minimalist solid light studio background with soft rim lighting.
  Crisp cel-shaded anime line art, professional official artwork quality, perfect character reference avatar.
  ```

---

### 步驟 4：自動複製歸檔至本地工作目錄

生圖完成後，立即以 `run_command`（PowerShell）將生成的暫存圖片複製至使用者當前的專案工作目錄：
```powershell
Copy-Item '<BrainImage1Path>' -Destination './<character_name>_character_sheet.jpg' -Force
Copy-Item '<BrainImage2Path>' -Destination './<character_name>_avatar.jpg' -Force
Copy-Item '<BrainImage1Path>' -Destination './character_reference_<character_name>.jpg' -Force
```
*標準輸出檔名規範：*
1. `<character_name>_character_sheet.jpg`：16:9 全方位設定三視圖與表情矩陣母圖
2. `<character_name>_avatar.jpg`：1:1 高解析正身胸像大頭貼
3. `character_reference_<character_name>.jpg`：供後續 AI 生圖管線直接讀取的錨定參考圖

---

### 步驟 5：產出角色視覺規範手冊 (Design Guide Artifact)

撰寫結構化的 Markdown Artifact（使用者專屬角色設定手冊）：
1. **內嵌設定圖與肖像圖**（直接以 Markdown 圖片展示）。
2. **角色視覺錨定特徵表**（髮型、眼睛、上身、下身、鞋履配件細節）。
3. **標準色票矩陣（Color Palette Table）**：提取 5~6 個核心色碼（HEX），方便在設計軟體（如 Canva、Photoshop）精準取色。
4. **本地檔案索引與用途說明**。
5. **後續創作提示詞公式（Prompt Formula）**：提供填空式英文提示詞模板，讓使用者未來生成 LINE 貼圖、日常插畫時能無縫維持畫風一致。

---

## 🎨 經典大師畫風提示詞映射庫 (Style Cheatsheet)

在組合 Prompt 時，可根據角色作品選用最適畫風關鍵詞：

| 經典作品 / 大師風格 | 核心關鍵詞 (Prompt Keywords) | 視覺特點 |
| :--- | :--- | :--- |
| **七龍珠 / 鳥山明** | `Akira Toriyama art style, 90s Dragon Ball Z cel-shading, sharp angular jawline, defined muscular contours, bold black line art` | 剛勁有力的黑線、鮮明塊狀高光與陰影、標誌性三角形鼻峰 |
| **海賊王 / 尾田榮一郎** | `Eiichiro Oda anime style, dynamic expressive eyes, fluid energetic linework, bold vibrant anime coloring` | 富有彈性的肢體線條、極誇張生動的表情、高飽和色彩 |
| **火影忍者 / 岸本齊史** | `Masashi Kishimoto art style, classic Studio Pierrot animation, earthy ninja palette, soft cel shading` | 寫實細緻的手腳結構、忍具細節、自然柔和的陰影漸層 |
| **咒術迴戰 / MAPPA** | `MAPPA modern anime aesthetic, cinematic lighting, sharp eye details with glossy iris highlights, dynamic high-contrast shadows` | 現代數位動畫光影、虹膜透明感、冷色調氛圍陰影 |
| **京都動畫 (京阿尼)** | `Kyoto Animation aesthetic, delicate hair strands, soft gentle lighting, expressive warm eyes, detailed clothing folds` | 極致柔美髮絲、精巧五官、溫暖細膩的日常空氣感 |

---

## 🔗 下游創作管線串接指南

本技能產出之資產可直接與以下技能無縫接軌：
1. **`line-sticker-pack-creator` / `line-sticker-sheet-architect`**：
   - 以 `character_reference_<character_name>.jpg` 作為角色一致性控制基準。
   - 直接採用表情矩陣中的表情，擴充為 8/16/24 款常用生活對話貼圖。
2. **`chibi-3d-figure-designer`**：
   - 提取設定手冊中的色票與服飾細節，一鍵生成同角色的 3D 黏土/PVC 盲盒公仔。
3. **社群貼文與海報視覺**：
   - 以 1:1 肖像直接搭配 `canva-event-poster-architect` 或封面設計技能。
