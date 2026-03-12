# Changelog

## 2026-03-12

- 新增 `playbooks/batch-rename-apply-guard.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md` 与 `playbooks/local-batch-file-routing.md`，把高风险本地批量改名/移动任务的默认执行顺序固定为 `preview -> apply -> verify -> handoff`，减少下载目录整理、上传前文件清洗和素材批量改名中的范围漂移、误触文件族与“脚本成功=任务完成”的假完成

- ?? `playbooks/resume-evidence-pack.md`???? `PLAYBOOKS.md`?`TOOLS.md` ? `roadmap.md`????/JD ???????????????? `JD signal -> evidence strength -> safe usage -> do-not-claim boundary`??????????????? JD?????????/?????????
oadmap.md，把官网/JD 研究到简历定制之间的中间层固定为 JD signal -> evidence strength -> safe usage -> do-not-claim boundary，减少目标岗位简历定制里反复翻 JD、弱匹配硬写和简历/问答边界不清的返工

- 鏂板 `playbooks/browser-stable-execution.md`锛屽苟鎺ュ叆 `PLAYBOOKS.md`銆乣playbooks/browser-research-briefing.md`銆乣playbooks/web-form-execution.md`銆乣playbooks/browser-upload-handoff.md` 涓?`playbooks/browser-download-handoff.md`锛屾妸澶氭娴忚鍣ㄤ换鍔＄殑榛樿鎺ㄨ繘鍗曞厓姝ｅ紡鏀跺彛涓?`snapshot(refs=aria) -> one action -> state checkpoint -> refreshed snapshot -> next action`锛屽噺灏戝畼缃戠爺绌躲€佽〃鍗曞～鍐欍€佷笂浼犱笅杞藉拰鍚庡彴鎿嶄綔閲岀殑 stale ref銆佷笂涓嬫枃婕傜Щ涓庢妸鍔ㄤ綔鎴愬姛璇垽涓虹姸鎬佹垚鍔熺殑杩斿伐

- 灏?`self-evolution-log/ideas/capability-investment-gate-template.md` 姝ｅ紡钀芥垚 `playbooks/capability-investment-gate.md`锛屽苟鎺ュ叆 `PLAYBOOKS.md`銆乣TOOLS.md` 涓?`playbooks/capability-intake-handoff.md`锛屾妸 OpenClaw 鏂拌兘鍔?鏂板伐鍏锋帴鍏ョ被浠诲姟浠庘€滄妧鏈笂鑳芥帴鈥濊繘涓€姝ユ敹绱т负鈥滄槸鍚﹀€煎緱闀挎湡鎶曞叆鈥濈殑鏄惧紡闂搁棬锛屽噺灏戜负浣庡鐢ㄣ€侀珮缁存姢鑳藉姏杩囧害寤鸿鐨勮繑宸?

- 灏?`self-evolution-log/ideas/desktop-persisted-state-proof-template.md` 缁х画鎺ュ叆 `playbooks/windows-file-dialog-handoff.md` 涓?`playbooks/office-output-proof.md`锛屾妸 Save / Save As / Export 绫讳换鍔＄殑瀹屾垚鏍囧噯浠庘€滃璇濇鍏抽棴 + 鏂囦欢瀛樺湪鈥濇敹绱т负鈥滄湰鍦颁骇鐗╁凡楠岃瘉 + persisted-state proof + 涓嬫父鍙畨鍏ㄤ緷璧栤€濓紝鍑忓皯妗岄潰/Office 瀵煎嚭銆佸彟瀛樹负鍜屼笂浼犲墠鏂囨。閾捐矾閲屸€滅湅璧锋潵瀛樹簡鍏跺疄娌＄湡姝ｅ啓鍏ユ渶鏂扮姸鎬佲€濈殑杩斿伐

- 鏂板 `playbooks/attachment-readiness-pack.md`锛屽苟鎺ュ叆 `PLAYBOOKS.md` 涓?`roadmap.md`锛屾妸娴忚鍣ㄤ笂浼犲墠鐨勫噯澶囧眰鍥哄畾涓衡€渦pload field + chosen file + local proof + page-side acceptance target + next move鈥濓紝鍑忓皯瀹樼綉鎶曢€掋€佹潗鏂欐彁浜ゃ€佸闄勪欢琛ㄥ崟閲岃竟涓婁紶杈规壘鏂囦欢銆侀敊浼犵増鏈拰鎶婂璇濇鍏抽棴璇垽涓轰笂浼犳垚鍔熺殑杩斿伐

- 鏂板 `playbooks/acp-implementation-pack.md`锛屽苟鎺ュ叆 `PLAYBOOKS.md`銆乣TOOLS.md` 涓?`roadmap.md`锛屾妸 ACP coding 绫讳换鍔＄殑鍓嶇疆鏀跺彛鍥哄畾涓衡€滅洰鏍囩粨鏋?+ repo/workspace + scope boundary + acceptance checks + side-effect boundary + handoff requirement鈥濓紝鍑忓皯鐢?Codex / Claude Code / Gemini 鍋氬疄鐜颁换鍔℃椂鍥犱换鍔″寘杩囪櫄瀵艰嚧鐨勬緞娓呭洖鍚堛€佹敼鍋忓拰寮遍獙鏀?

- 鏂板 `playbooks/browser-export-proof.md`锛屽苟鎺ュ叆 `PLAYBOOKS.md`銆乣TOOLS.md`銆乣playbooks/browser-download-handoff.md`銆乣playbooks/web-form-execution.md` 涓?`roadmap.md`锛屾妸寮傛瀵煎嚭绫绘祻瑙堝櫒浠诲姟鍥哄畾涓衡€渆xport trigger + ready-state proof + local-file proof + next-route鈥濓紝鍑忓皯鎶ヨ〃/鍚庡彴/瀵煎嚭涓績鍦烘櫙閲屾妸 toast銆乻pinner銆乺eady button 鎴栨棫鏂囦欢璇垽涓哄畬鎴愮殑杩斿伐

- 鏂板 `playbooks/multimedia-delivery-pack.md`锛屽苟鎺ュ叆 `multimedia-generation-workflow.md`銆乣PLAYBOOKS.md`銆乣TOOLS.md` 涓?`roadmap.md`锛屾妸澶氬獟浣撲换鍔＄殑鏈鏀跺彛鍥哄畾涓衡€滀富浜や粯鐗堟湰 + 鍙鐢?prompt 璧勪骇 + 涓嬩竴浜ゆ帴鍔ㄤ綔 + completion proof鈥濓紝鍑忓皯灏侀潰鍥?鐭棰?鍥剧敓瑙嗛浠诲姟鍦ㄤ笂浼犮€佸彂甯冦€佸闃呭墠鍐嶆鎵嬪伐鎸戠増鏈拰涓㈠け winning prompt 鐨勮繑宸?

- 鏂板 `self-evolution-log/ideas/desktop-persisted-state-proof-template.md`锛屽苟鎺ュ叆 `playbooks/desktop-operations.md`銆乣PLAYBOOKS.md` 涓?`roadmap.md`锛屾妸妗岄潰/Office 缂栬緫鍚庣殑瀹屾垚鏍囧噯杩涗竴姝ユ敹绱т负鈥滃凡淇濆瓨/宸插簲鐢?+ 鑷冲皯涓€鏉℃寔涔呭寲璇佹槑鈥濓紝鍑忓皯鏂囨。淇敼銆佽缃彉鏇村拰鏈湴 GUI 缂栬緫閲屸€滅晫闈㈢湅璧锋潵鏀逛簡浣嗗疄闄呮病鍐欏叆鈥濈殑杩斿伐

- 鏂板 `playbooks/office-output-proof.md`锛屽苟鎺ュ叆 `document-delivery-pack.md`銆乣word-paper-fast-path.md`銆乣paper-formatting.md`銆乣PLAYBOOKS.md` 涓?`TOOLS.md`锛屾妸 Word / PDF / Excel / Markdown-to-Office 浜や粯浠诲姟鐨勫畬鎴愭爣鍑嗘敹绱т负鈥滃敮涓€浜や粯浠?+ freshness + 蹇呰鏍煎紡璇佹槑 + 涓嬩竴姝ヤ氦鎺モ€濓紝鍑忓皯鏃у鍑哄鐢ㄣ€侀敊鏂囦欢 handoff 鍜屼粎鍑枃浠跺瓨鍦ㄥ氨璇垽瀹屾垚鐨勯闄?

- 锟斤拷锟斤拷 `playbooks/multimedia-prompt-pack.md`锟斤拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md` 锟斤拷 `self-evolution-log/roadmap.md`锟斤拷锟窖讹拷媒锟藉复锟斤拷锟斤拷锟斤拷印锟絙rief 锟斤拷锟叫碉拷 prompt 锟斤拷锟斤拷一锟斤拷锟皆达拷锟斤拷谋锟斤拷锟斤拷锟斤拷锟轿?`shared guardrails -> variant prompts -> acceptance checklist -> next revision axis` 锟侥可革拷锟斤拷锟斤拷锟斤拷锟斤拷锟缴帮拷锟斤拷锟斤拷锟斤拷锟斤拷图 / 锟斤拷频 / 图锟斤拷锟斤拷频锟斤拷锟斤拷锟斤拷锟?prompt 锟斤拷锟斤拷锟斤拷姹撅拷冉锟绞э拷锟?

- 锟斤拷锟斤拷 `playbooks/career-form-fill-pack.md`锟斤拷锟斤拷锟斤拷锟斤拷 `playbooks/career-prep-handoff.md`锟斤拷`playbooks/careers-site-application.md`锟斤拷`playbooks/web-form-execution.md`锟斤拷`PLAYBOOKS.md` 锟斤拷 `roadmap.md`锟斤拷锟窖癸拷锟斤拷投锟斤拷锟叫★拷锟斤拷锟斤拷锟斤拷准锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷页锟斤拷执锟叫★拷之锟斤拷锟缴拷锟斤拷锟斤拷锟斤拷战锟斤拷锟揭伙拷锟斤拷筛锟斤拷锟街达拷邪锟斤拷锟斤拷锟斤拷俣嗖斤拷锟斤拷锟斤拷锟斤拷锟竭凤拷锟斤拷锟较憋拷锟筋、锟较达拷目锟疥不唯一锟斤拷锟斤拷锟斤拷锟街段伙拷锟斤拷姆锟斤拷锟?

- 锟斤拷锟斤拷 `self-evolution-log/ideas/capability-investment-gate-template.md`锟斤拷锟斤拷锟斤拷锟斤拷 `playbooks/capability-intake-handoff.md` 锟斤拷 `roadmap.md`锟斤拷锟窖★拷锟斤拷锟斤拷锟斤拷锟杰接碉拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷一锟斤拷锟斤拷锟斤拷为 `invest now / trial only / defer`锟斤拷锟斤拷锟酵碉拷频锟斤拷锟斤拷锟斤拷锟斤拷维锟斤拷锟缴憋拷锟竭碉拷锟斤拷 skill / MCP / 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷投锟斤拷姆锟斤拷锟?

- 锟斤拷锟斤拷 `self-evolution-log/ideas/research-decision-pack-template.md`锟斤拷锟斤拷锟斤拷锟斤拷选锟斤拷锟叫撅拷锟斤拷锟秸口达拷锟斤拷通锟饺斤拷锟斤拷锟斤拷为 `decision goal -> option evidence -> recommendation -> decision-switch triggers -> next executable move`锟斤拷同时锟斤拷锟斤拷 `playbooks/browser-research-briefing.md`锟斤拷`playbooks/research-action-pack.md`锟斤拷`PLAYBOOKS.md`锟斤拷`TOOLS.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟酵诧拷品/锟斤拷锟斤拷/路锟斤拷/锟斤拷锟斤拷锟皆憋拷锟斤拷锟斤拷锟叫★拷锟斤拷锟斤拷锟剿碉拷选锟斤拷锟斤拷锟缴诧拷锟缴革拷锟剿★拷锟斤拷锟斤拷锟窖硷拷锟斤拷执锟叫★拷锟侥断诧拷

- 锟斤拷锟斤拷 `self-evolution-log/ideas/capability-proof-pack-template.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷小锟斤拷证锟斤拷锟斤拷锟斤拷 + proof signals + false-ready trap + IO contract + next handoff锟斤拷锟斤拷锟斤拷 `playbooks/capability-intake-handoff.md`锟斤拷`TOOLS.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷锟斤拷 skill / MCP / 锟斤拷锟竭斤拷锟斤拷锟叫★拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟剿碉拷锟斤拷锟斤拷锟斤拷锟饺讹拷支锟斤拷锟斤拷实锟斤拷锟今”的假撅拷锟斤拷锟斤拷锟斤拷
- 锟斤拷锟斤拷 `self-evolution-log/ideas/office-output-proof-template.md`锟斤拷锟斤拷锟斤拷 `lock artifact -> freshness proof -> format/render proof -> handoff proof` 锟斤拷锟斤拷 `playbooks/document-delivery-pack.md`锟斤拷`playbooks/word-paper-fast-path.md` 锟斤拷 `PLAYBOOKS.md`锟斤拷锟斤拷锟斤拷 Word / PDF / Office 锟斤拷锟斤拷锟斤拷锟斤拷锟叫旧碉拷锟斤拷锟斤拷锟矫★拷锟斤拷锟侥硷拷锟斤拷锟接和斤拷凭锟侥硷拷锟斤拷锟节撅拷锟斤拷锟斤拷锟斤拷傻姆锟斤拷锟?

- 锟斤拷锟斤拷 `self-evolution-log/ideas/browser-page-state-checkpoints-template.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟街碉拷页锟斤拷状态锟戒化锟斤拷锟斤拷锟斤拷锟?`playbooks/browser-research-briefing.md`锟斤拷`playbooks/browser-upload-handoff.md`锟斤拷`playbooks/browser-download-handoff.md` 锟斤拷 `playbooks/web-form-execution.md`锟斤拷锟斤拷锟酵革拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷械锟?stale ref锟斤拷锟界步锟斤拷锟斤拷锟斤拷锟揭筹拷锟斤拷驯涞拷园锟斤拷锟阶刺拷锟斤拷锟斤拷锟斤拷锟斤拷姆锟斤拷锟斤拷锟斤拷锟?

- 锟斤拷锟斤拷 `playbooks/capability-intake-handoff.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 -> 锟斤拷锟斤拷锟斤拷锟铰凤拷锟?-> 锟斤拷小 smoke test -> 锟斤拷一执锟斤拷锟斤拷路锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷`TOOLS.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷锟揭碉拷 skill / 锟斤拷锟斤拷 / MCP 锟斤拷没锟斤拷锟斤拷锟斤拷锟斤拷煽锟街达拷锟斤拷锟斤拷锟斤拷锟斤拷亩喜锟?

- 锟斤拷锟斤拷 `self-evolution-log/ideas/multimedia-platform-spec-card-template.md`锟斤拷锟斤拷锟斤拷锟斤拷媒锟藉工锟斤拷锟斤拷前锟斤拷为 `Platform Spec Card -> Generation Brief -> prompt pack -> iteration log -> delivery pack -> acceptance`锟斤拷同时锟斤拷锟斤拷 `playbooks/multimedia-generation-workflow.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟酵凤拷锟斤拷图锟斤拷锟斤拷锟斤拷频锟斤拷图锟斤拷锟斤拷频锟斤拷锟斤拷锟叫的达拷锟斤拷锟斤拷锟斤拷锟斤拷时锟斤拷锟斤拷锟斤拷锟斤拷全锟斤拷锟酵斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷傻姆锟斤拷锟?

- 锟斤拷锟斤拷 `self-evolution-log/ideas/batch-rename-apply-guard-template.md`锟斤拷锟斤拷锟斤拷锟竭凤拷锟秸憋拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷/锟狡讹拷锟斤拷锟斤拷锟?`preview -> apply -> verify` 锟斤拷锟斤拷锟斤拷锟斤拷锟?`playbooks/local-batch-file-routing.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷目录锟斤拷锟斤拷锟斤拷锟较达拷前锟侥硷拷锟斤拷洗锟斤拷锟截诧拷锟斤拷锟斤拷锟斤拷锟斤拷锟饺革拷锟斤拷锟侥硷拷锟斤拷锟斤拷锟叫碉拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷募锟斤拷锟酵凤拷围漂锟狡凤拷锟斤拷

- 锟斤拷锟斤拷 `self-evolution-log/ideas/document-intake-brief-template.md`锟斤拷锟斤拷锟斤拷锟斤拷task goal -> source files -> output strategy -> constraints -> verification -> routing decision锟斤拷锟斤拷锟斤拷 `playbooks/document-task-routing.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷 PDF / Word / 锟斤拷锟斤拷 / 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟竭达拷锟斤拷路锟斤拷锟襟覆革拷原锟斤拷锟酵斤拷锟斤拷目锟疥不锟斤拷姆锟斤拷锟?

- 锟斤拷锟斤拷 `self-evolution-log/ideas/multimedia-delivery-pack-template.md`锟斤拷锟斤拷锟斤拷锟斤拷媒锟藉工锟斤拷锟斤拷锟斤拷 `Generation Brief -> prompt pack -> iteration log -> acceptance` 锟斤拷展为 `Generation Brief -> prompt pack -> iteration log -> delivery pack -> acceptance`锟斤拷同时锟斤拷锟斤拷 `playbooks/multimedia-generation-workflow.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷锟斤拷图 / 锟斤拷频 / 图锟斤拷锟斤拷频锟斤拷锟斤拷锟斤拷锟斤拷锟缴猴拷锟较达拷/锟斤拷锟斤拷前锟侥版本失锟斤拷锟斤拷锟截诧拷散锟斤拷锟斤拷末锟剿硷拷锟斤拷煞锟斤拷锟?

- 锟斤拷锟斤拷 `playbooks/local-batch-file-routing.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 ZIP/锟斤拷压锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷图片转锟斤拷锟斤拷锟斤拷锟斤拷展锟斤拷锟斤拷锟斤拷锟斤拷校锟斤拷汀锟斤拷募锟斤拷锟斤拷锟较达拷锟斤拷锟斤拷锟侥匡拷锟斤拷锟斤拷锟斤拷 `local-toolbox` / `batch-file-studio`锟斤拷同时锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷`TOOLS.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟酵憋拷锟斤拷锟侥硷拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟叫凤拷围锟斤拷锟藉、锟斤拷锟斤拷锊伙拷锟饺凤拷汀锟斤拷锟斤拷锟斤拷锟斤拷说锟斤拷募锟轿达拷锟斤拷锟?handoff-ready锟斤拷锟侥凤拷锟斤拷

- 锟斤拷锟斤拷 `ideas/desktop-action-proof-template.md`锟斤拷锟斤拷锟斤拷锟斤拷Final artifact / Primary proof / Secondary proof / False-completion trap / Handoff-ready锟斤拷锟斤拷锟斤拷 `playbooks/desktop-operations.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷锟斤拷源锟斤拷锟斤拷锟斤拷锟斤拷Office 锟诫本锟斤拷 GUI 锟斤拷锟斤拷锟叫★拷锟斤拷锟斤拷锟斤拷锟斤拷去锟剿碉拷目锟斤拷状态没锟斤拷锟斤拷锟斤拷伞锟斤拷募锟斤拷锟缴凤拷锟斤拷

- 锟斤拷锟斤拷 `playbooks/document-delivery-pack.md`锟斤拷锟斤拷锟斤拷锟斤拷source of truth -> delivery artifact -> output check -> next-step handoff锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷`playbooks/document-task-routing.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷 Word / PDF / Markdown / Office 锟侥碉拷锟斤拷锟斤拷锟斤拷末锟剿斤拷锟斤拷时锟侥达拷锟侥硷拷锟斤拷锟斤拷锟侥硷拷锟酵硷拷锟斤拷煞锟斤拷锟?

- 锟斤拷锟斤拷 `self-evolution-log/ideas/multimedia-prompt-pack-template.md`锟斤拷锟斤拷锟斤拷锟斤拷Generation Brief -> shared guardrails -> variant prompts -> acceptance -> next revision axis锟斤拷锟斤拷锟斤拷 `playbooks/multimedia-generation-workflow.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷锟斤拷图 / 锟斤拷频 / 图锟斤拷锟斤拷频锟斤拷锟斤拷锟侥匡拷锟饺凤拷系锟斤拷锟街达拷锟?prompt 之锟斤拷亩喜锟?
- 锟斤拷锟斤拷 `playbooks/research-action-pack.md`锟斤拷锟窖★拷Research Brief -> Action Pack -> 锟斤拷一执锟斤拷锟斤拷锟教★拷锟斤拷式锟教伙拷为锟叫撅拷锟斤拷锟斤拷锟斤拷谋锟阶硷拷锟斤拷硬悖拷锟斤拷锟斤拷锟?`PLAYBOOKS.md`锟斤拷`TOOLS.md`锟斤拷`playbooks/browser-research-briefing.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟劫癸拷锟斤拷锟叫撅拷锟斤拷锟斤拷锟斤拷/FAQ锟斤拷锟斤拷品锟皆比★拷职位锟叫撅拷锟斤拷珊锟揭拷止锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟侥凤拷锟斤拷
## 2026-03-11

- 锟斤拷锟斤拷 `ideas/research-action-pack-template.md`锟斤拷锟斤拷锟斤拷锟斤拷Research Brief -> Action Pack -> 锟斤拷一锟斤拷锟斤拷锟斤拷锟诫”锟斤拷式锟斤拷锟斤拷 `playbooks/browser-research-briefing.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟劫癸拷锟斤拷锟叫撅拷锟斤拷锟斤拷锟斤拷/FAQ锟斤拷职位锟叫撅拷锟斤拷锟侥碉拷转执锟斤拷锟藉单锟斤拷锟劫达拷锟街癸拷锟斤拷锟斤拷锟斤拷锟截革拷锟酵讹拷

- 锟斤拷锟斤拷 ideas/form-fill-pack-template.md锟斤拷锟窖革拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟街达拷锟角帮拷锟斤拷锟斤拷锟阶硷拷锟斤拷锟斤拷锟轿骋?Form Fill Pack 模锟藉，锟斤拷锟斤拷锟斤拷 playbooks/web-form-execution.md 锟斤拷 
oadmap.md锟斤拷锟斤拷锟酵癸拷锟斤拷锟斤拷锟诫、锟斤拷锟斤拷锟结交锟酵达拷锟较达拷锟洁步锟斤拷锟斤拷锟叫的憋拷锟斤拷卟隆锟斤拷锟斤拷锟狡拷锟斤拷锟斤拷锟斤拷峤伙拷锟斤拷锟?

- 锟斤拷锟斤拷 `ideas/browser-stable-automation-rule.md`锟斤拷锟斤拷锟斤拷锟斤拷锟洁步锟斤拷锟斤拷锟斤拷锟斤拷锟侥拷锟绞癸拷锟?`snapshot(refs=aria)` + 锟教讹拷 `targetId` + 每锟斤拷锟斤拷状态锟戒化刷锟斤拷 snapshot`锟斤拷锟斤拷锟斤拷 `TOOLS.md` 锟斤拷 `playbooks/web-form-execution.md`锟斤拷锟斤拷锟酵讹拷态页锟芥、锟洁步锟斤拷锟斤拷锟斤拷锟斤拷洗锟斤拷锟斤拷锟斤拷械锟?stale ref 锟斤拷绮斤拷锟斤拷锟斤拷锟斤拷锟斤拷

- 锟斤拷始锟斤拷 `self-evolution-log` 锟斤拷目锟结构
- 锟斤拷锟斤拷锟秸憋拷锟斤拷锟杰憋拷锟斤拷锟斤拷锟斤拷锟睫革拷锟斤拷锟诫法锟斤拷路锟斤拷图目录
- 准锟斤拷锟斤拷锟斤拷每锟秸★拷锟斤拷锟揭斤拷锟斤拷锟斤拷锟斤拷时锟斤拷锟斤拷锟斤拷锟?
- 锟睫革拷锟斤拷锟藉构锟斤拷锟脚憋拷锟斤拷锟杰憋拷锟侥硷拷锟斤拷锟斤拷硬锟斤拷锟诫，锟斤拷为锟皆讹拷锟斤拷取锟斤拷锟斤拷锟杰憋拷锟斤拷锟斤拷锟斤拷时锟斤拷锟斤拷戏锟斤拷锟?
- 锟睫革拷锟皆讹拷锟结交锟脚憋拷锟斤拷锟斤拷锟酵凤拷支 `main` 锟斤拷硬锟斤拷锟诫，锟斤拷为锟斤拷锟斤拷前 Git 锟斤拷支锟皆讹拷锟斤拷锟酵ｏ拷锟斤拷锟酵仓库环锟斤拷锟斤拷戏锟斤拷锟?
- 锟睫革拷锟斤拷锟藉构锟斤拷锟脚憋拷锟斤拷 GitHub 锟街匡拷锟街凤拷锟接诧拷锟斤拷耄拷锟轿拷锟斤拷榷锟饺★拷锟角帮拷挚锟?`origin` 远锟教碉拷址锟斤拷锟斤拷锟酵仓匡拷迁锟斤拷锟斤拷戏锟斤拷锟?

- 锟矫匡拷锟斤拷锟斤拷锟酵筹拷拼庸潭锟?5 锟斤拷锟轿拷远锟斤拷锟饺★拷锟斤拷锟斤拷鼙锟斤拷械锟饺拷锟斤拷锟金，硷拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟侥撅拷默漏锟斤拷示锟斤拷锟斤拷
- 锟睫革拷锟皆讹拷锟结交锟脚憋拷锟斤拷锟铰凤拷支/锟铰仓匡拷锟阶达拷锟斤拷锟斤拷时缺锟斤拷 upstream 锟斤拷锟斤拷锟解，失锟杰猴拷锟皆讹拷锟斤拷锟剿碉拷 `git push --set-upstream origin <branch>`
- 锟斤拷锟杰憋拷锟斤拷锟斤拷丶锟斤拷蚀咏疟锟斤拷锟接诧拷锟斤拷锟介到 scripts/weekly_summary.categories.json锟斤拷锟斤拷锟斤拷锟斤拷锟绞敝伙拷锟斤拷锟斤拷锟矫ｏ拷锟斤拷锟酵猴拷锟斤拷维锟斤拷锟斤拷戏锟斤拷锟?
- 锟斤拷 weekly_summary.ps1 锟斤拷锟接凤拷锟斤拷锟斤拷锟饺笔?锟斤拷时锟斤拷锟斤拷锟矫伙拷锟斤拷锟斤拷婢拷锟斤拷锟斤拷獾ワ拷锟斤拷锟斤拷锟斤拷募锟斤拷锟斤拷锟斤拷锟斤拷锟杰憋拷锟斤拷锟斤拷
- 锟斤拷 build_dashboard.ps1 锟斤拷锟接★拷锟斤拷锟杰憋拷时锟斤拷锟斤拷锟斤拷锟缴匡拷锟藉”锟侥斤拷锟斤拷锟斤拷锟剿ｏ拷锟斤拷锟斤拷锟绞硷拷锟斤拷锥锟斤拷锟斤拷锟斤拷锟斤拷募锟饺笔е憋拷锟绞э拷锟?
- 锟斤拷 auto_commit.ps1 锟斤拷锟斤拷 `origin` 远锟斤拷预锟斤拷锟斤拷锟斤拷确锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟铰仓匡拷锟绞硷拷锟绞憋拷锟斤拷锟斤拷锟斤拷锟斤拷铣杀锟?

- 锟斤拷 auto_commit.ps1 锟侥凤拷支锟斤拷锟斤拷锟?origin 远锟斤拷预锟斤拷前锟狡碉拷 commit 之前锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷前锟斤拷锟斤拷锟斤拷缺失时锟斤拷锟斤拷锟斤拷锟斤拷傻谋锟斤拷锟斤拷峤?
- 锟斤拷锟斤拷锟斤拷锟斤拷值锟截脚憋拷统一锟斤拷锟斤拷 preflight -> execute -> verify -> explain 模锟藉”写锟斤拷 roadmap锟斤拷锟斤拷为锟斤拷锟斤拷锟秸憋拷/锟杰憋拷/锟斤拷锟斤拷/锟皆讹拷锟结交锟斤拷路锟斤拷一锟铰伙拷锟捷斤拷锟斤拷锟斤拷

- 锟斤拷 weekly_summary.ps1 锟斤拷锟斤拷小 preflight / verify / explain锟斤拷缺锟秸憋拷目录时直锟接憋拷锟斤拷锟斤拷缺锟杰憋拷目录时锟皆讹拷锟斤拷锟斤拷锟斤拷写锟斤拷锟斤拷校锟斤拷丶锟斤拷陆诓锟斤拷锟斤拷锟结构锟斤拷锟缴癸拷摘要

- 锟斤拷 build_dashboard.ps1 锟斤拷锟斤拷小 preflight / verify / explain锟斤拷锟斤拷锟斤拷锟斤拷峁癸拷锟阶刺拷锟斤拷锟斤拷锟斤拷锟揭筹拷锟斤拷寰材э拷芊锟斤拷锟?
- 锟斤拷 auto_commit.ps1 锟斤拷统一锟结构锟斤拷状态锟斤拷锟斤拷锟?push 锟斤拷 SHA 校锟介，锟斤拷锟劫★拷锟结交锟缴癸拷锟斤拷远锟斤拷未锟斤拷锟诫”锟侥撅拷默失锟斤拷锟斤拷锟?
- 锟斤拷 weekly_summary.ps1 锟侥成癸拷锟斤拷锟酵骋晃?`status=ok` 锟结构锟斤拷摘要锟斤拷锟斤拷锟斤拷锟秸憋拷/锟杰憋拷/锟斤拷锟斤拷/锟皆讹拷锟结交锟斤拷路锟斤拷锟斤拷小一锟斤拷协锟斤拷
- 锟斤拷 roadmap 锟叫诧拷锟斤拷统一状态锟斤拷锟叫拷椋╜task` / `status` / `path` / `summary`锟斤拷锟斤拷为锟斤拷锟斤拷锟斤拷锟今健匡拷锟斤拷锟斤拷锟斤拷锟皆讹拷锟芥警预锟斤拷一锟斤拷锟斤拷锟斤拷
- 锟斤拷锟斤拷 `ideas/task-health-summary-template.md`锟斤拷锟斤拷锟斤拷小锟斤拷锟今健匡拷摘要协锟斤拷锟斤拷煽筛锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷秃锟斤拷锟斤拷陆疟锟斤拷锟斤拷锟酵骋蛔刺拷锟斤拷锟侥成憋拷
- 锟斤拷锟斤拷 `ideas/last-run-status-template.json`锟斤拷为锟斤拷锟斤拷值锟截脚憋拷锟斤拷一锟斤拷锟斤拷锟斤拷锟教碉拷锟斤拷锟斤拷锟斤拷锟阶刺ｏ拷澹拷锟斤拷秃锟斤拷锟斤拷锟斤拷锟?锟芥警锟斤拷锟侥憋拷锟斤拷锟斤拷锟斤拷锟斤拷锟?
- 锟斤拷 `build_dashboard.ps1` 锟斤拷锟斤拷 `status/build_dashboard.last-run.json` 锟斤拷锟斤拷锟斤拷锟阶刺拷锟斤拷蹋锟斤拷锟街わ拷锟阶刺拷锟?+ JSON锟斤拷双通锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷
- 锟斤拷 `weekly_summary.ps1` 锟斤拷锟斤拷 `status/weekly_summary.last-run.json` 锟斤拷锟斤拷锟斤拷锟阶刺拷锟斤拷蹋锟斤拷锟斤拷锟节讹拷锟斤拷锟斤拷锟侥伙拷锟斤拷锟斤拷路锟斤拷双通锟斤拷状态锟斤拷锟?
- 锟斤拷 `auto_commit.ps1` 锟斤拷锟斤拷 `status/auto_commit.last-run.json` 锟斤拷锟斤拷锟斤拷锟阶刺拷锟斤拷蹋锟斤拷锟斤拷锟斤拷峤伙拷锟铰凤拷锟剿拷锟阶刺拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟今健匡拷锟斤拷锟杰碉拷末锟斤拷盲锟斤拷
- 锟斤拷锟斤拷 `ideas/task-health-rollup-template.md`锟斤拷锟饺固伙拷 `status/*.last-run.json` 锟斤拷锟斤拷锟斤拷模锟藉，为锟斤拷锟斤拷锟斤拷锟今健匡拷锟斤拷锟杰脚憋拷锟斤拷锟斤拷页锟斤拷锟斤拷锟斤拷锟斤拷预锟斤拷锟饺讹拷锟斤拷锟斤拷
- 锟斤拷锟斤拷 `ideas/task-health-freshness-template.md`锟斤拷锟斤拷锟戒按锟斤拷锟斤拷锟斤拷锟街碉拷 freshness 锟斤拷值模锟藉，锟斤拷锟酵猴拷锟斤拷 `stale` 锟叫讹拷锟斤拷锟斤拷/漏锟斤拷锟斤拷锟斤拷
- 锟斤拷锟斤拷 `ideas/task-health-registry-template.json`锟斤拷锟斤拷式锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷状态锟侥硷拷锟斤拷 `allowNoop` 锟斤拷锟藉，锟斤拷锟酵猴拷锟斤拷锟斤拷锟斤拷锟斤拷锟杰讹拷锟侥硷拷锟斤拷约锟斤拷锟斤拷锟斤拷式锟斤拷锟?
- 锟斤拷锟斤拷锟斤拷式 `scripts/task_health.registry.json` 锟斤拷 `scripts/task_health.ps1`锟斤拷锟斤拷 registry + `status/*.last-run.json` + freshness 锟斤拷锟津串筹拷锟阶革拷锟斤拷执锟斤拷锟斤拷锟今健匡拷锟斤拷锟斤拷原锟斤拷
- 锟斤拷 `build_dashboard.ps1` 锟斤拷锟斤拷 `status/task_health.summary.md`锟斤拷锟斤拷锟斤拷锟今健匡拷锟斤拷锟斤拷锟阶次斤拷锟斤拷锟斤拷页锟斤拷锟斤拷图锟斤拷锟斤拷锟劫★拷锟斤拷状态锟斤拷锟斤拷锟缴硷拷锟斤拷锟斤拷锟斤拷囟喜锟?
- 锟斤拷锟斤拷 `ideas/document-task-routing-template.md`锟斤拷锟斤拷 PDF / Word / 锟斤拷锟斤拷 / 锟斤拷锟斤拷 / Markdown 锟斤拷锟斤拷锟斤拷锟轿骋伙拷锟斤拷锟斤拷锟斤拷锟斤拷锟侥ｏ拷澹拷锟斤拷透锟斤拷锟斤拷牡锟斤拷锟斤拷锟斤拷叽锟斤拷锟斤拷锟斤拷锟斤拷锟铰┬ｏ拷锟侥革拷锟斤拷
- 锟斤拷锟斤拷 `playbooks/document-task-routing.md`锟斤拷锟窖革拷锟斤拷锟侥碉拷锟斤拷锟斤拷锟斤拷取锟斤拷锟脚版、锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷Markdown 锟斤拷锟斤拷 5 锟斤拷路锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md` 锟斤拷 `TOOLS.md`
- 锟斤拷锟斤拷 `ideas/browser-research-briefing-template.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟窖?锟斤拷锟斤拷锟斤拷锟斤拷/锟斤拷页锟斤拷锟斤拷锟斤拷锟较筹拷锟斤拷为统一锟斤拷模锟藉，锟斤拷锟饺凤拷锟斤拷职位锟叫撅拷锟斤拷锟斤拷品锟皆比★拷锟侥碉拷转锟斤拷锟斤拷锟斤拷锟斤拷锟饺革拷锟斤拷锟斤拷实锟斤拷锟斤拷
- 锟斤拷锟斤拷 `ideas/career-application-prep-brief-template.md`锟斤拷锟窖★拷职位锟斤拷锟斤拷锟叫撅拷 -> 锟斤拷锟斤拷缺锟斤拷 -> Fill Readiness -> form pack/锟斤拷锟斤拷锟斤拷锟斤拷准锟斤拷锟斤拷锟教伙拷锟斤拷锟斤拷职锟洁复锟斤拷锟斤拷锟斤拷锟酵讹拷锟角白硷拷锟侥ｏ拷澹拷锟斤拷锟斤拷贪锟?Prep Brief 锟斤拷锟斤拷 `playbooks/careers-site-application.md`

- 锟斤拷锟斤拷锟斤拷锟斤拷锟?锟斤拷锟斤拷锟侥硷拷锟较达拷锟斤拷锟斤拷模锟藉，锟斤拷确锟较达拷前锟斤拷锟斤拷锟侥硷拷路锟斤拷锟斤拷Browser -> Windows 锟皆伙拷锟斤拷庸堋锟揭筹拷锟斤拷锟斤拷锟秸ｏ拷锟斤拷锟斤拷锟斤拷 desktop / careers playbook锟斤拷锟斤拷锟酵癸拷锟斤拷投锟斤拷锟诫复锟接憋拷锟斤拷锟斤拷锟斤拷锟较达拷锟叫的硷拷锟斤拷煞锟斤拷锟?
- 锟斤拷锟较达拷锟斤拷锟斤拷模锟斤拷锟斤拷式锟斤拷锟?`playbooks/browser-upload-handoff.md` 锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷洗锟斤拷锟斤拷锟轿拷筛锟斤拷玫亩锟斤拷锟斤拷锟斤拷锟?
- 锟斤拷锟斤拷 `ideas/multimedia-generation-brief-template.md`锟斤拷锟斤拷锟斤拷图 / 锟斤拷频锟斤拷锟斤拷锟斤拷锟斤拷前锟斤拷锟秸匡拷为统一 `Generation Brief` 模锟藉，锟斤拷锟酵讹拷锟斤拷 prompt 锟斤拷锟斤拷锟酵讹拷媒锟藉交锟斤拷失锟斤拷锟斤拷锟斤拷
- 锟斤拷锟斤拷锟斤拷式 `playbooks/multimedia-generation-workflow.md`锟斤拷锟窖讹拷媒锟斤拷锟斤拷锟斤拷锟斤拷锟轿?`锟截诧拷锟教碉拷 -> Generation Brief -> prompt pack -> acceptance` 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`
- 锟斤拷锟斤拷 `ideas/multimedia-iteration-log-template.md`锟斤拷锟斤拷锟斤拷锟斤拷媒锟藉工锟斤拷锟斤拷锟斤拷锟斤拷为 `锟截诧拷锟教碉拷 -> Generation Brief -> prompt pack -> iteration log -> acceptance`锟斤拷锟斤拷锟劫讹拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟叫版本锟斤拷锟桔和可革拷锟斤拷锟截材碉拷散锟斤拷锟斤拷锟?

- ??????? playbooks/browser-research-briefing.md?????????????锟斤拷??????????锟斤拷???????????? PLAYBOOKS.md ?? TOOLS.md????????????锟斤拷??锟斤拷?锟斤拷??????????????????????????????
- 锟斤拷锟斤拷 playbooks/career-prep-handoff.md锟斤拷锟斤拷职位页锟叫撅拷锟斤拷锟斤拷锟绞斤拷湛锟轿?Prep Brief锟斤拷锟斤拷锟斤拷缺锟节★拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 Fill Readiness 锟叫讹拷锟斤拷锟斤拷锟斤拷锟斤拷 PLAYBOOKS.md锟斤拷TOOLS.md 锟斤拷 careers-site-application.md锟斤拷锟斤拷锟酵癸拷锟斤拷投锟斤拷锟斤拷途锟斤拷锟斤拷锟较的凤拷锟斤拷锟斤拷锟斤拷
- 锟斤拷锟斤拷 `playbooks/resume-tailoring-from-jd.md`锟斤拷锟斤拷 JD / 锟劫凤拷职位页锟饺讹拷转锟斤拷 evidence map锟斤拷emphasis plan锟斤拷resume variant brief 锟斤拷 answer themes锟斤拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷锟斤拷锟酵癸拷锟斤拷投锟斤拷前锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷位锟斤拷锟较分伙拷锟侥凤拷锟斤拷锟斤拷锟斤拷
- 锟斤拷锟斤拷 `playbooks/resume-delivery-pack.md`锟斤拷锟窖革拷位锟斤拷锟斤拷锟斤拷锟斤拷锟侥╋拷锟斤拷湛诠潭锟轿拷锟斤拷锟斤拷锟斤拷锟斤拷锟?-> 锟斤拷锟斤拷锟侥硷拷 -> 锟斤拷锟叫ｏ拷锟?-> 锟较达拷锟斤拷锟接★拷锟斤拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷`TOOLS.md` 锟斤拷锟斤拷锟酵讹拷锟斤拷萍锟斤拷锟铰凤拷锟斤拷锟斤拷痛锟斤拷募锟斤拷洗锟斤拷锟斤拷锟斤拷募锟斤拷锟斤拷煤锟轿达拷锟街わ拷锟斤拷锟斤拷姆锟斤拷锟?
- 锟斤拷锟斤拷 `playbooks/browser-download-handoff.md`锟斤拷锟窖★拷锟斤拷锟斤拷锟斤拷锟斤拷卮锟斤拷锟?-> 锟斤拷锟斤拷锟斤拷锟斤拷 -> 锟侥硷拷校锟斤拷 -> 锟斤拷一锟斤拷锟教斤拷锟接★拷锟斤拷锟斤拷为锟斤拷准锟斤拷锟截斤拷锟斤拷锟斤拷锟教ｏ拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷`TOOLS.md` 锟斤拷 roadmap锟斤拷锟斤拷锟斤拷 PDF/JD/锟斤拷锟斤拷锟侥硷拷锟洁复锟斤拷锟斤拷锟斤拷锟叫的硷拷锟斤拷锟斤拷锟斤拷锟侥硷拷锟斤拷锟矫凤拷锟斤拷
- 锟斤拷锟斤拷 `playbooks/downloaded-file-routing.md`锟斤拷锟窖★拷锟斤拷锟斤拷锟截憋拷锟斤拷锟侥硷拷 -> 锟斤拷执锟斤拷目锟斤拷锟斤拷锟斤拷锟斤拷牡锟?/ 锟斤拷职 / 锟斤拷锟斤拷锟斤拷锟斤拷 / 锟斤拷媒锟斤拷 / 锟斤拷锟斤拷锟斤拷獭锟斤拷锟斤拷锟轿拷锟阶悸凤拷晒锟斤拷颍锟斤拷锟斤拷锟斤拷锟斤拷锟缴猴拷停锟节憋拷锟斤拷锟侥硷拷锟斤拷锟斤拷锟斤拷锟斤拷路锟接诧拷锟较伙拷锟竭达拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟?
- 锟斤拷锟斤拷 `playbooks/windows-file-dialog-handoff.md`锟斤拷锟斤拷 Windows 锟斤拷/锟斤拷锟斤拷/锟斤拷锟斤拷为/选锟侥硷拷锟斤拷 锟皆伙拷锟斤拷锟斤拷锟轿骋伙拷锟斤拷锟斤拷锟斤拷蹋锟斤拷锟斤拷锟斤拷锟?`PLAYBOOKS.md` 锟斤拷 `TOOLS.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷洗锟斤拷锟斤拷亍锟絆ffice 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷应锟斤拷锟侥硷拷选锟斤拷锟叫的硷拷锟斤拷煞锟斤拷锟?
- 锟斤拷锟斤拷 `playbooks/web-form-execution.md`锟斤拷锟斤拷通锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷为 `锟斤拷锟斤拷准锟斤拷 -> 锟街讹拷映锟斤拷 -> 页锟斤拷锟斤拷锟街?-> 锟斤拷确锟结交锟竭斤拷` 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷锟斤拷锟酵多步锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷洗锟斤拷锟斤拷锟斤拷筒莞锟?锟结交锟竭界不锟斤拷时锟侥硷拷锟斤拷煞锟斤拷锟?
- 锟斤拷锟斤拷 `playbooks/openclaw-agent-delegation.md`锟斤拷锟窖革拷锟斤拷锟斤拷锟斤拷锟斤拷锟街凤拷锟斤拷锟教伙拷为 direct / ACP / local-tool-chain 锟斤拷锟斤拷默锟斤拷路锟竭ｏ拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md` 锟斤拷 `TOOLS.md`锟斤拷锟斤拷锟酵达拷锟斤拷锟斤拷一锟斤拷始选锟斤拷执锟斤拷路锟斤拷锟斤拷锟铰的凤拷锟斤拷锟斤拷锟斤拷锟斤拷证锟斤拷锟斤拷
- 锟斤拷锟斤拷 `playbooks/local-file-delivery-handoff.md`锟斤拷锟窖★拷锟斤拷锟斤拷锟侥硷拷锟斤拷锟斤拷锟斤拷/锟斤拷锟斤拷锟斤拷 -> reveal/open/review/唯一锟斤拷锟斤拷锟侥硷拷选锟斤拷 -> 锟斤拷一锟斤拷锟教斤拷锟接★拷锟斤拷锟斤拷为锟斤拷准锟斤拷锟斤拷锟斤拷锟教ｏ拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷`TOOLS.md` 锟斤拷 `desktop-operations.md`锟斤拷锟斤拷锟酵硷拷锟斤拷/锟侥碉拷/锟斤拷锟斤拷锟侥硷拷/图片锟斤拷锟斤拷锟叫的达拷锟侥硷拷锟斤拷锟斤拷锟侥硷拷锟斤拷末锟剿硷拷锟斤拷煞锟斤拷锟?
- 锟斤拷 research / prep / delivery / form / upload 锟斤拷 4 锟斤拷默锟较达拷锟斤拷锟斤拷路锟教伙拷锟斤拷 `playbooks/openclaw-agent-delegation.md`锟斤拷锟斤拷锟劫革拷锟接伙拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟窖★拷怨锟斤拷锟斤拷颉⒌锟斤拷锟酵撅拷锟斤拷锟斤拷喜愕硷拷碌姆锟斤拷锟?
- 锟斤拷锟斤拷 `ideas/completion-proof-template.md`锟斤拷锟窖革拷锟斤拷锟斤拷锟斤拷锟斤拷锟缴憋拷准统一锟秸匡拷为锟斤拷锟秸诧拷锟斤、锟斤拷/锟斤拷证锟斤拷锟脚号★拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟?handoff-ready 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 completion proof 锟斤拷锟斤拷锟斤拷锟?`playbooks/openclaw-agent-delegation.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟?/ 锟斤拷锟斤拷 / 锟侥碉拷锟斤拷路锟叫的硷拷锟斤拷煞锟斤拷锟?
- 锟斤拷锟斤拷 `playbooks/completion-proof.md`锟斤拷锟窖革拷锟斤拷锟斤拷锟斤拷锟斤拷锟缴憋拷准锟接★拷锟斤拷锟斤拷执锟叫成癸拷锟斤拷锟斤拷锟斤拷为锟斤拷锟斤拷锟秸诧拷锟斤拷 + 强证锟斤拷锟脚猴拷 + handoff-ready 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷`TOOLS.md` 锟斤拷 roadmap锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟?/ 锟斤拷锟斤拷 / 锟侥碉拷锟斤拷路锟叫的硷拷锟斤拷煞锟斤拷锟?
- 锟斤拷 completion proof 锟斤拷嵌锟斤拷 `playbooks/browser-download-handoff.md`锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷杀锟阶硷拷战锟轿拷锟斤拷锟饺凤拷锟斤拷锟斤拷募锟?+ 强证锟斤拷锟脚猴拷 + 锟斤拷确锟斤拷一锟斤拷锟教★拷锟斤拷锟斤拷锟斤拷压锟斤拷锟斤拷锟斤拷预锟斤拷/锟斤拷示锟斤拷锟斤拷为锟斤拷傻姆锟斤拷锟?
- ?? completion proof ????? `playbooks/local-file-delivery-handoff.md`????????????????????????????????????????? + ?????? + handoff-ready???????????????????????????????????????
- 锟斤拷 completion proof 锟斤拷嵌锟斤拷 `playbooks/browser-upload-handoff.md`锟斤拷锟斤拷锟较达拷锟斤拷锟斤拷锟斤拷锟斤拷锟缴憋拷准锟秸斤拷为锟斤拷页锟斤拷锟斤拷呀锟斤拷锟侥匡拷锟斤拷募锟?+ 锟斤拷锟斤拷一锟斤拷锟斤拷证锟斤拷 + handoff-ready锟斤拷锟斤拷锟斤拷锟斤拷压锟酵癸拷锟斤拷投锟捷★拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟结交锟叫的硷拷锟斤拷煞锟斤拷锟?

- ???? playbooks/word-paper-fast-path.md???? Word / ???? / ???? .docx ???????? inspect -> style-report -> lane selection ????????????????? PLAYBOOKS.md??TOOLS.md ?? roadmap???????????????????????????????????????????
- ?? completion proof ????? `playbooks/windows-file-dialog-handoff.md`???? Open / Save / Save As / Select Folder ??????????????????? + ???y??? + handoff-ready????????????????? / ???? / ?????锟斤拷?锟斤拷????????

- 锟斤拷锟斤拷锟斤拷锟斤拷榷锟斤拷远锟斤拷锟斤拷锟斤拷锟斤拷一锟斤拷锟斤拷锟斤拷 rowser-research-briefing.md锟斤拷rowser-upload-handoff.md锟斤拷rowser-download-handoff.md锟斤拷锟斤拷 snapshot(refs=aria) + 锟教讹拷 	argetId + 锟截硷拷状态锟戒化锟斤拷刷锟斤拷 snapshot 锟接憋拷锟斤拷锟斤拷锟斤拷锟斤拷展锟斤拷锟叫撅拷 / 锟斤拷锟斤拷 / 锟较达拷锟斤拷锟斤拷锟斤拷频锟斤拷路锟斤拷锟斤拷锟斤拷 stale ref锟斤拷锟界步锟斤拷锟斤拷锟斤拷投锟教筹拷锟斤拷鼗娣碉拷锟?


- 锟斤拷锟斤拷 `self-evolution-log/ideas/career-form-fill-pack-handoff-template.md`锟斤拷锟斤拷锟斤拷 `Career Prep Handoff -> Career Form Fill Pack -> web-form-execution` 锟斤拷锟斤拷 `playbooks/career-prep-handoff.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟酵癸拷锟斤拷锟斤拷锟斤拷锟洁复锟接憋拷锟斤拷锟叫边凤拷锟斤拷锟较憋拷锟筋、锟较达拷目锟疥不唯一锟斤拷锟斤拷锟斤拷锟街段伙拷锟斤拷锟?draft-ready 锟竭界不锟斤拷锟斤拷傻姆锟斤拷锟?


- 锟斤拷锟斤拷 `playbooks/research-evidence-pack.md`锟斤拷锟斤拷锟斤拷锟斤拷 `PLAYBOOKS.md`锟斤拷`TOOLS.md`锟斤拷`browser-research-briefing.md`锟斤拷`research-action-pack.md` 锟斤拷 `roadmap.md`锟斤拷锟斤拷锟叫撅拷锟斤拷锟斤拷印锟斤拷锟?锟叫讹拷锟斤拷锟斤拷锟斤拷一锟斤拷锟斤拷锟缴★拷证锟捷帮拷锟斤拷锟斤拷锟接层，锟斤拷锟斤拷 source anchor锟斤拷锟斤拷锟矫边斤拷锟?`verbatim / paraphrase / re-check-live` 锟斤拷锟斤拷证锟捷革拷锟斤拷模式锟斤拷锟斤拷锟劫癸拷锟斤拷锟叫撅拷锟斤拷锟斤拷锟斤拷/FAQ锟斤拷锟斤拷锟斤拷证锟捷碉拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟截凤拷页锟斤拷锟斤拷锟斤拷锟斤拷失锟斤拷
- 锟斤拷 ideas/desktop-persisted-state-proof-template.md 锟斤拷式锟斤拷锟?playbooks/desktop-persisted-state-proof.md锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟絎indows 锟侥硷拷锟皆伙拷锟斤拷锟?Office 锟斤拷锟斤拷锟铰凤拷锟斤拷选锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷恕锟斤拷锟揭伙拷锟斤拷战锟轿拷锟斤拷锟斤拷锟斤拷锟斤拷志没锟斤拷锟斤拷锟斤拷慰砂锟饺拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟?Save / Save As / Export / Apply 锟斤拷锟斤拷锟斤拷募锟斤拷锟缴★拷

- 将桌面/Office 编辑后保存导出的默认接力链正式写入 `PLAYBOOKS.md` 与 `TOOLS.md`：`desktop-operations -> desktop-persisted-state-proof -> windows-file-dialog-handoff (if needed) -> office-output-proof/local-file-delivery-handoff`，把 persisted-state proof 从“已有 playbook”推进为真实任务里的默认执行规则，减少 Save/Export 后只看界面变化或文件存在就误判完成的返工
