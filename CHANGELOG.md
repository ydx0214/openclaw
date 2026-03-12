# Changelog

## 2026-03-12

- 新增 `playbooks/browser-export-proof.md`，并接入 `PLAYBOOKS.md`、`TOOLS.md`、`playbooks/browser-download-handoff.md`、`playbooks/web-form-execution.md` 与 `roadmap.md`，把异步导出类浏览器任务固定为“export trigger + ready-state proof + local-file proof + next-route”，减少报表/后台/导出中心场景里把 toast、spinner、ready button 或旧文件误判为完成的返工

- 新增 `playbooks/multimedia-delivery-pack.md`，并接入 `multimedia-generation-workflow.md`、`PLAYBOOKS.md`、`TOOLS.md` 与 `roadmap.md`，把多媒体任务的末端收口固定为“主交付版本 + 可复用 prompt 资产 + 下一交接动作 + completion proof”，减少封面图/短视频/图生视频任务在上传、发布、审阅前再次手工挑版本和丢失 winning prompt 的返工

- 新增 `self-evolution-log/ideas/desktop-persisted-state-proof-template.md`，并接入 `playbooks/desktop-operations.md`、`PLAYBOOKS.md` 与 `roadmap.md`，把桌面/Office 编辑后的完成标准进一步收紧为“已保存/已应用 + 至少一条持久化证明”，减少文档修改、设置变更和本地 GUI 编辑里“界面看起来改了但实际没写入”的返工

- 新增 `playbooks/office-output-proof.md`，并接入 `document-delivery-pack.md`、`word-paper-fast-path.md`、`paper-formatting.md`、`PLAYBOOKS.md` 与 `TOOLS.md`，把 Word / PDF / Excel / Markdown-to-Office 交付任务的完成标准收紧为“唯一交付件 + freshness + 必要格式证明 + 下一步交接”，减少旧导出复用、错文件 handoff 和仅凭文件存在就误判完成的风险

- ���� `playbooks/multimedia-prompt-pack.md`�������� `PLAYBOOKS.md` �� `self-evolution-log/roadmap.md`���Ѷ�ý�帴������ӡ�brief ���е� prompt ����һ���Դ���ı�������Ϊ `shared guardrails -> variant prompts -> acceptance checklist -> next revision axis` �Ŀɸ����������ɰ���������ͼ / ��Ƶ / ͼ����Ƶ������� prompt ������汾�Ƚ�ʧ��

- ���� `playbooks/career-form-fill-pack.md`�������� `playbooks/career-prep-handoff.md`��`playbooks/careers-site-application.md`��`playbooks/web-form-execution.md`��`PLAYBOOKS.md` �� `roadmap.md`���ѹ���Ͷ���С�������׼������������ҳ��ִ�С�֮���ɢ�������ս���һ���ɸ���ִ�а������ٶಽ��������߷����ϱ���ϴ�Ŀ�겻Ψһ�������ֶλ���ķ���

- ���� `self-evolution-log/ideas/capability-investment-gate-template.md`�������� `playbooks/capability-intake-handoff.md` �� `roadmap.md`���ѡ��������ܽӵ�����������һ������Ϊ `invest now / trial only / defer`�����͵�Ƶ��������ά���ɱ��ߵ��� skill / MCP / ��������������Ͷ��ķ���

- ���� `self-evolution-log/ideas/research-decision-pack-template.md`��������ѡ���о����տڴ���ͨ�Ƚ�����Ϊ `decision goal -> option evidence -> recommendation -> decision-switch triggers -> next executable move`��ͬʱ���� `playbooks/browser-research-briefing.md`��`playbooks/research-action-pack.md`��`PLAYBOOKS.md`��`TOOLS.md` �� `roadmap.md`�����Ͳ�Ʒ/����/·��/�����Ա������С������˵�ѡ�����ɲ��ɸ��ˡ������Ѽ���ִ�С��Ķϲ�

- ���� `self-evolution-log/ideas/capability-proof-pack-template.md`����������С��֤������ + proof signals + false-ready trap + IO contract + next handoff������ `playbooks/capability-intake-handoff.md`��`TOOLS.md` �� `roadmap.md`�������� skill / MCP / ���߽����С������������˵��������ȶ�֧����ʵ���񡱵ļپ�������
- ���� `self-evolution-log/ideas/office-output-proof-template.md`������ `lock artifact -> freshness proof -> format/render proof -> handoff proof` ���� `playbooks/document-delivery-pack.md`��`playbooks/word-paper-fast-path.md` �� `PLAYBOOKS.md`������ Word / PDF / Office ���������оɵ������á����ļ����Ӻͽ�ƾ�ļ����ھ�������ɵķ���

- ���� `self-evolution-log/ideas/browser-page-state-checkpoints-template.md`�������������������ֵ�ҳ��״̬�仯������� `playbooks/browser-research-briefing.md`��`playbooks/browser-upload-handoff.md`��`playbooks/browser-download-handoff.md` �� `playbooks/web-form-execution.md`�����͸�������������е� stale ref���粽�������ҳ���ѱ䵫�԰���״̬���������ķ�������

- ���� `playbooks/capability-intake-handoff.md`������������������ -> �������·�� -> ��С smoke test -> ��һִ����·������ `PLAYBOOKS.md`��`TOOLS.md` �� `roadmap.md`�������ҵ� skill / ���� / MCP ��û��������ɿ�ִ���������Ķϲ�

- ���� `self-evolution-log/ideas/multimedia-platform-spec-card-template.md`��������ý�幤����ǰ��Ϊ `Platform Spec Card -> Generation Brief -> prompt pack -> iteration log -> delivery pack -> acceptance`��ͬʱ���� `playbooks/multimedia-generation-workflow.md` �� `roadmap.md`�����ͷ���ͼ������Ƶ��ͼ����Ƶ�����еĴ���������ʱ��������ȫ���ͽ�����������ɵķ���

- ���� `self-evolution-log/ideas/batch-rename-apply-guard-template.md`�������߷��ձ�����������/�ƶ������ `preview -> apply -> verify` ��������� `playbooks/local-batch-file-routing.md` �� `roadmap.md`����������Ŀ¼�������ϴ�ǰ�ļ���ϴ���ز����������ȸ����ļ������е�����������ļ���ͷ�ΧƯ�Ʒ���

- ���� `self-evolution-log/ideas/document-intake-brief-template.md`��������task goal -> source files -> output strategy -> constraints -> verification -> routing decision������ `playbooks/document-task-routing.md` �� `roadmap.md`������ PDF / Word / ���� / ���������������ߴ���·���󸲸�ԭ���ͽ���Ŀ�겻��ķ���

- ���� `self-evolution-log/ideas/multimedia-delivery-pack-template.md`��������ý�幤������ `Generation Brief -> prompt pack -> iteration log -> acceptance` ��չΪ `Generation Brief -> prompt pack -> iteration log -> delivery pack -> acceptance`��ͬʱ���� `playbooks/multimedia-generation-workflow.md` �� `roadmap.md`��������ͼ / ��Ƶ / ͼ����Ƶ���������ɺ��ϴ�/����ǰ�İ汾ʧ�����ز�ɢ����ĩ�˼���ɷ���

- ���� `playbooks/local-batch-file-routing.md`���������� ZIP/��ѹ����������������ͼƬת��������չ��������У��͡��ļ�����ϴ������Ŀ������� `local-toolbox` / `batch-file-studio`��ͬʱ���� `PLAYBOOKS.md`��`TOOLS.md` �� `roadmap.md`�����ͱ����ļ������������з�Χ���塢����ﲻ��ȷ�͡��������˵��ļ�δ���� handoff-ready���ķ���

- ���� `ideas/desktop-action-proof-template.md`��������Final artifact / Primary proof / Secondary proof / False-completion trap / Handoff-ready������ `playbooks/desktop-operations.md` �� `roadmap.md`��������Դ��������Office �뱾�� GUI �����С���������ȥ�˵�Ŀ��״̬û������ɡ��ļ���ɷ���

- ���� `playbooks/document-delivery-pack.md`��������source of truth -> delivery artifact -> output check -> next-step handoff������ `PLAYBOOKS.md`��`playbooks/document-task-routing.md` �� `roadmap.md`������ Word / PDF / Markdown / Office �ĵ�������ĩ�˽���ʱ�Ĵ��ļ������ļ��ͼ���ɷ���

- ���� `self-evolution-log/ideas/multimedia-prompt-pack-template.md`��������Generation Brief -> shared guardrails -> variant prompts -> acceptance -> next revision axis������ `playbooks/multimedia-generation-workflow.md` �� `roadmap.md`��������ͼ / ��Ƶ / ͼ����Ƶ�����Ŀ��ȷ�ϵ���ִ�� prompt ֮��Ķϲ�
- ���� `playbooks/research-action-pack.md`���ѡ�Research Brief -> Action Pack -> ��һִ�����̡���ʽ�̻�Ϊ�о�������ı�׼���Ӳ㣬������ `PLAYBOOKS.md`��`TOOLS.md`��`playbooks/browser-research-briefing.md` �� `roadmap.md`�����ٹ����о�������/FAQ����Ʒ�Աȡ�ְλ�о���ɺ�Ҫ�ֹ�������������ķ���
## 2026-03-11

- ���� `ideas/research-action-pack-template.md`��������Research Brief -> Action Pack -> ��һ�������롱��ʽ���� `playbooks/browser-research-briefing.md` �� `roadmap.md`�����ٹ����о�������/FAQ��ְλ�о����ĵ�תִ���嵥���ٴ��ֹ��������ظ��Ͷ�

- ���� ideas/form-fill-pack-template.md���Ѹ������������ִ��ǰ������׼������Ϊͳһ Form Fill Pack ģ�壬������ playbooks/web-form-execution.md �� 
oadmap.md�����͹������롢�����ύ�ʹ��ϴ��ಽ�����еı���߲¡�����Ư�������ύ����

- ���� `ideas/browser-stable-automation-rule.md`���������ಽ���������Ĭ��ʹ�� `snapshot(refs=aria)` + �̶� `targetId` + ÿ����״̬�仯ˢ�� snapshot`������ `TOOLS.md` �� `playbooks/web-form-execution.md`�����Ͷ�̬ҳ�桢�ಽ��������ϴ������е� stale ref ��粽���������

- ��ʼ�� `self-evolution-log` ��Ŀ�ṹ
- �����ձ����ܱ��������޸����뷨��·��ͼĿ¼
- ׼������ÿ�ա����ҽ�������ʱ�������
- �޸����幹���ű����ܱ��ļ�����Ӳ���룬��Ϊ�Զ���ȡ�����ܱ�������ʱ����Ϸ���
- �޸��Զ��ύ�ű������ͷ�֧ `main` ��Ӳ���룬��Ϊ����ǰ Git ��֧�Զ����ͣ����Ͳֿ⻷����Ϸ���
- �޸����幹���ű��� GitHub �ֿ��ַ��Ӳ���룬��Ϊ���ȶ�ȡ��ǰ�ֿ� `origin` Զ�̵�ַ�����Ͳֿ�Ǩ����Ϸ���

- �ÿ������ͳ�ƴӹ̶� 5 ���Ϊ�Զ���ȡ�����ܱ��е�ȫ����𣬼������������ľ�Ĭ©��ʾ����
- �޸��Զ��ύ�ű����·�֧/�²ֿ��״�����ʱȱ�� upstream �����⣬ʧ�ܺ��Զ����˵� `git push --set-upstream origin <branch>`
- ���ܱ�����ؼ��ʴӽű���Ӳ����鵽 scripts/weekly_summary.categories.json���������ʱֻ������ã����ͺ���ά����Ϸ���
- �� weekly_summary.ps1 ���ӷ������ȱʧ/��ʱ�����û�����澯�����ⵥ�������ļ���������ܱ�����
- �� build_dashboard.ps1 ���ӡ����ܱ�ʱ�������ɿ��塱�Ľ������ˣ������ʼ���׶��������ļ�ȱʧֱ��ʧ��
- �� auto_commit.ps1 ���� `origin` Զ��Ԥ������ȷ�����������²ֿ��ʼ��ʱ���������ϳɱ�

- �� auto_commit.ps1 �ķ�֧����� origin Զ��Ԥ��ǰ�Ƶ� commit ֮ǰ����������ǰ������ȱʧʱ��������ɵı����ύ
- ��������ֵ�ؽű�ͳһ���� preflight -> execute -> verify -> explain ģ�塱д�� roadmap����Ϊ�����ձ�/�ܱ�/����/�Զ��ύ��·��һ�»��ݽ�����

- �� weekly_summary.ps1 ����С preflight / verify / explain��ȱ�ձ�Ŀ¼ʱֱ�ӱ�����ȱ�ܱ�Ŀ¼ʱ�Զ�������д����У��ؼ��½ڲ�����ṹ���ɹ�ժҪ

- �� build_dashboard.ps1 ����С preflight / verify / explain��������ṹ��״̬ժҪ��������ҳ���徲Ĭʧ�ܷ���
- �� auto_commit.ps1 ��ͳһ�ṹ��״̬����� push �� SHA У�飬���١��ύ�ɹ���Զ��δ���롱�ľ�Ĭʧ�����
- �� weekly_summary.ps1 �ĳɹ����ͳһΪ `status=ok` �ṹ��ժҪ�������ձ�/�ܱ�/����/�Զ��ύ��·����Сһ��Э��
- �� roadmap �в���ͳһ״̬���Э�飨`task` / `status` / `path` / `summary`����Ϊ�������񽡿��������Զ��澯Ԥ��һ������
- ���� `ideas/task-health-summary-template.md`������С���񽡿�ժҪЭ����ɿɸ������������ͺ����½ű�����ͳһ״̬����ĳɱ�
- ���� `ideas/last-run-status-template.json`��Ϊ����ֵ�ؽű���һ�������̵��������״̬ģ�壬���ͺ�������/�澯���ı����������
- �� `build_dashboard.ps1` ���� `status/build_dashboard.last-run.json` �������״̬���̣���֤��״̬�� + JSON��˫ͨ����������
- �� `weekly_summary.ps1` ���� `status/weekly_summary.last-run.json` �������״̬���̣�����ڶ������Ļ�����·��˫ͨ��״̬���
- �� `auto_commit.ps1` ���� `status/auto_commit.last-run.json` �������״̬���̣������ύ��·��˫ͨ��״̬������������񽡿����ܵ�ĩ��ä��
- ���� `ideas/task-health-rollup-template.md`���ȹ̻� `status/*.last-run.json` ������ģ�壬Ϊ�������񽡿����ܽű�����ҳ��������Ԥ���ȶ�����
- ���� `ideas/task-health-freshness-template.md`�����䰴�������ֵ� freshness ��ֵģ�壬���ͺ��� `stale` �ж�����/©������
- ���� `ideas/task-health-registry-template.json`����ʽ����������״̬�ļ��� `allowNoop` ���壬���ͺ����������ܶ��ļ���Լ������ʽ���
- ������ʽ `scripts/task_health.registry.json` �� `scripts/task_health.ps1`���� registry + `status/*.last-run.json` + freshness ���򴮳��׸���ִ�����񽡿�����ԭ��
- �� `build_dashboard.ps1` ���� `status/task_health.summary.md`�������񽡿������״ν�����ҳ����ͼ�����١���״̬�����ɼ�������ضϲ�
- ���� `ideas/document-task-routing-template.md`���� PDF / Word / ���� / ���� / Markdown �������Ϊͳһ����������ģ�壬���͸����ĵ������ߴ���������©У��ĸ���
- ���� `playbooks/document-task-routing.md`���Ѹ����ĵ�������ȡ���Ű桢����������Markdown ���� 5 ��·�������������� `PLAYBOOKS.md` �� `TOOLS.md`
- ���� `ideas/browser-research-briefing-template.md`�����������ѯ/��������/��ҳ�������ϳ���Ϊͳһ��ģ�壬���ȷ���ְλ�о�����Ʒ�Աȡ��ĵ�ת���������ȸ�����ʵ����
- ���� `ideas/career-application-prep-brief-template.md`���ѡ�ְλ�����о� -> ����ȱ�� -> Fill Readiness -> form pack/��������׼�����̻�����ְ�ิ�������Ͷ��ǰ׼��ģ�壬�����̰� Prep Brief ���� `playbooks/careers-site-application.md`

- ���������/�����ļ��ϴ�����ģ�壬��ȷ�ϴ�ǰ�����ļ�·����Browser -> Windows �Ի���ӹܡ�ҳ������գ������� desktop / careers playbook�����͹���Ͷ���븴�ӱ��������ϴ��еļ���ɷ���
- ���ϴ�����ģ����ʽ��� `playbooks/browser-upload-handoff.md` ������ `PLAYBOOKS.md`��������������ϴ�����Ϊ�ɸ��õĶ�������
- ���� `ideas/multimedia-generation-brief-template.md`������ͼ / ��Ƶ��������ǰ���տ�Ϊͳһ `Generation Brief` ģ�壬���Ͷ��� prompt �����Ͷ�ý�彻��ʧ������
- ������ʽ `playbooks/multimedia-generation-workflow.md`���Ѷ�ý���������Ϊ `�ز��̵� -> Generation Brief -> prompt pack -> acceptance` �������������� `PLAYBOOKS.md`
- ���� `ideas/multimedia-iteration-log-template.md`��������ý�幤��������Ϊ `�ز��̵� -> Generation Brief -> prompt pack -> iteration log -> acceptance`�����ٶ������������а汾���ۺͿɸ����زĵ�ɢ�����

- ??????? playbooks/browser-research-briefing.md?????????????��??????????��???????????? PLAYBOOKS.md ?? TOOLS.md????????????��??��?��??????????????????????????????
- ���� playbooks/career-prep-handoff.md����ְλҳ�о������ʽ�տ�Ϊ Prep Brief������ȱ�ڡ����������� Fill Readiness �ж��������� PLAYBOOKS.md��TOOLS.md �� careers-site-application.md�����͹���Ͷ����;�����ϵķ�������
- ���� `playbooks/resume-tailoring-from-jd.md`���� JD / �ٷ�ְλҳ�ȶ�ת�� evidence map��emphasis plan��resume variant brief �� answer themes�������� `PLAYBOOKS.md`�����͹���Ͷ��ǰ������������λ���Ϸֻ��ķ�������
- ���� `playbooks/resume-delivery-pack.md`���Ѹ�λ���������ĩ���տڹ̶�Ϊ���������� -> �����ļ� -> ���У�� -> �ϴ����ӡ��������� `PLAYBOOKS.md`��`TOOLS.md` �����Ͷ���Ƽ���·�����ʹ��ļ��ϴ������ļ����ú�δ��֤�����ķ���
- ���� `playbooks/browser-download-handoff.md`���ѡ���������ش��� -> �������� -> �ļ�У�� -> ��һ���̽��ӡ�����Ϊ��׼���ؽ������̣������� `PLAYBOOKS.md`��`TOOLS.md` �� roadmap������ PDF/JD/�����ļ��ิ�������еļ��������ļ����÷���
- ���� `playbooks/downloaded-file-routing.md`���ѡ������ر����ļ� -> ��ִ��Ŀ��������ĵ� / ��ְ / �������� / ��ý�� / ������̡�����Ϊ��׼·�ɹ��򣬼���������ɺ�ͣ�ڱ����ļ���������·�Ӳ��ϻ��ߴ������������
- ���� `playbooks/windows-file-dialog-handoff.md`���� Windows ��/����/����Ϊ/ѡ�ļ��� �Ի������Ϊͳһ�������̣������� `PLAYBOOKS.md` �� `TOOLS.md`������������ϴ����ء�Office ����������Ӧ���ļ�ѡ���еļ���ɷ���
- ���� `playbooks/web-form-execution.md`����ͨ������������������Ϊ `����׼�� -> �ֶ�ӳ�� -> ҳ�����֤ -> ��ȷ�ύ�߽�` �������������� `PLAYBOOKS.md`�����Ͷಽ����������ϴ������Ͳݸ�/�ύ�߽粻��ʱ�ļ���ɷ���
- ���� `playbooks/openclaw-agent-delegation.md`���Ѹ����������ַ����̻�Ϊ direct / ACP / local-tool-chain ����Ĭ��·�ߣ������� `PLAYBOOKS.md` �� `TOOLS.md`�����ʹ�����һ��ʼѡ��ִ��·�����µķ���������֤����
- ���� `playbooks/local-file-delivery-handoff.md`���ѡ������ļ�������/������ -> reveal/open/review/Ψһ�����ļ�ѡ�� -> ��һ���̽��ӡ�����Ϊ��׼�������̣������� `PLAYBOOKS.md`��`TOOLS.md` �� `desktop-operations.md`�����ͼ���/�ĵ�/�����ļ�/ͼƬ�����еĴ��ļ������ļ���ĩ�˼���ɷ���
- �� research / prep / delivery / form / upload �� 4 ��Ĭ�ϴ�����·�̻��� `playbooks/openclaw-agent-delegation.md`�����ٸ��ӻ������������ѡ�Թ����򡢵���;�����ϲ㵼�µķ���
- ���� `ideas/completion-proof-template.md`���Ѹ����������ɱ�׼ͳһ�տ�Ϊ���ղ����/��֤���źš������������ handoff-ready ���������� completion proof ������� `playbooks/openclaw-agent-delegation.md` �� `roadmap.md`��������������� / ���� / �ĵ���·�еļ���ɷ���
- ���� `playbooks/completion-proof.md`���Ѹ����������ɱ�׼�ӡ�����ִ�гɹ�������Ϊ�����ղ��� + ǿ֤���ź� + handoff-ready ������������������ `PLAYBOOKS.md`��`TOOLS.md` �� roadmap����������� / ���� / �ĵ���·�еļ���ɷ���
- �� completion proof ��Ƕ�� `playbooks/browser-download-handoff.md`����������������������ɱ�׼�ս�Ϊ����ȷ�����ļ� + ǿ֤���ź� + ��ȷ��һ���̡�������ѹ������Ԥ��/��ʾ����Ϊ��ɵķ���
- ?? completion proof ????? `playbooks/local-file-delivery-handoff.md`????????????????????????????????????????? + ?????? + handoff-ready???????????????????????????????????????
- �� completion proof ��Ƕ�� `playbooks/browser-upload-handoff.md`�����ϴ����������ɱ�׼�ս�Ϊ��ҳ����ѽ���Ŀ���ļ� + ����һ����֤�� + handoff-ready��������ѹ�͹���Ͷ�ݡ����������������ύ�еļ���ɷ���

- ???? playbooks/word-paper-fast-path.md???? Word / ???? / ???? .docx ???????? inspect -> style-report -> lane selection ????????????????? PLAYBOOKS.md??TOOLS.md ?? roadmap???????????????????????????????????????????
- ?? completion proof ????? `playbooks/windows-file-dialog-handoff.md`???? Open / Save / Save As / Select Folder ??????????????????? + ???y??? + handoff-ready????????????????? / ???? / ?????��?��????????

- ��������ȶ��Զ��������һ������ rowser-research-briefing.md��rowser-upload-handoff.md��rowser-download-handoff.md���� snapshot(refs=aria) + �̶� 	argetId + �ؼ�״̬�仯��ˢ�� snapshot �ӱ���������չ���о� / ���� / �ϴ�������Ƶ��·������ stale ref���粽������Ͷ�̬ҳ���ػ淵��


- ���� `self-evolution-log/ideas/career-form-fill-pack-handoff-template.md`������ `Career Prep Handoff -> Career Form Fill Pack -> web-form-execution` ���� `playbooks/career-prep-handoff.md` �� `roadmap.md`�����͹��������ิ�ӱ����б߷����ϱ���ϴ�Ŀ�겻Ψһ�������ֶλ���� draft-ready �߽粻����ɵķ���


- ���� `playbooks/research-evidence-pack.md`�������� `PLAYBOOKS.md`��`TOOLS.md`��`browser-research-briefing.md`��`research-action-pack.md` �� `roadmap.md`�����о�����ӡ���/�ж�������һ�����ɡ�֤�ݰ������Ӳ㣬���� source anchor�����ñ߽�� `verbatim / paraphrase / re-check-live` ����֤�ݸ���ģʽ�����ٹ����о�������/FAQ������֤�ݵ������������������ط�ҳ��������ʧ��
