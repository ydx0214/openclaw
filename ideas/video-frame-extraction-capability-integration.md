# Video Frame Extraction Capability Integration

## Capability Overview

- **Skill**: video-frames (ffmpeg-based)
- **Location**: `C:\Users\19766\AppData\Roaming\npm\node_modules\openclaw\skills\video-frames`
- **Preconditions**: ffmpeg 已安装 (verified: ffmpeg version 8.0.1)
- **Use case**: 从视频中提取单帧或片段，用于内容分析、封面提取、素材检查

## Task Family

1. **视频内容研究** - 从下载/在线视频中提取关键帧用于分析
   - 例：分析小红书/抖音视频的封面风格、画面元素
   - 例：从产品视频中提取关键帧作为参考图

2. **视频封面提取** - 从视频中提取高质量静态帧
   - 例：从已有视频中提取封面图用于其他平台
   - 例：提取最佳帧作为图生视频的源图

3. **视频素材检查** - 验证视频内容或质量
   - 例：检查下载的视频是否符合预期
   - 例：从长视频中定位特定时间点的画面

## Integration Points

### 现有工作流接入

1. **多媒体工作流 (multimedia-generation-workflow)**:
   - 在 source-asset-readiness 之前，可以先用 video-frames 提取视频关键帧
   - 适用于"已有视频素材，需要提取帧作为图生视频源图"的场景

2. **小红书研究 (xiaohongshu-mcp-workflow)**:
   - 在内容分析阶段，可以提取视频笔记的封面帧用于参考
   - 适用于竞品分析、内容趋势分析

3. **浏览器下载后处理 (browser-download-handoff)**:
   - 视频下载后，可选择提取帧作为后续分析的输入

## Usage Pattern

### 基础命令

```bash
# 提取第一帧
ffmpeg -i /path/to/video.mp4 -vframes 1 -q:v 2 /tmp/frame.jpg

# 在指定时间戳提取帧
ffmpeg -i /path/to/video.mp4 -ss 00:00:05 -vframes 1 -q:v 2 /tmp/frame-5s.jpg

# 提取视频中间帧
ffmpeg -i /path/to/video.mp4 -ss 00:00:10 -vframes 1 /tmp/middle.jpg

# 提取多帧（每1秒）
ffmpeg -i /path/to/video.mp4 -vf fps=1 /tmp/frames/frame-%03d.jpg
```

### 常用参数

- `-ss`: 时间位置 (支持 00:00:00 格式)
- `-vframes`: 提取帧数
- `-q:v`: 质量 (1=最好, 31=最差, 2-5 推荐)
- `-vf fps=N`: 每秒提取 N 帧

## Proof of Completion

1. 帧图片文件存在于指定路径
2. 文件大小 > 1KB (非空文件)
3. 图片可正常打开/读取

## Handoff to Next Workflow

- **给图生视频**: 提取的帧 -> multimedia-source-asset-readiness
- **给内容分析**: 提取的帧 -> research-evidence-pack
- **给封面选择**: 提取的多帧 -> multimedia-iteration-log

## False-Completion Traps

- ❌ 只检查视频存在就认为提取成功
- ❌ 忽略时间戳参数导致提取的是黑屏/白屏
- ❌ 没有验证图片是否可以正常读取

## Decision: Playbook vs Template

当前评估：**作为 template 接入现有 playbook 即可**，不需要独立 playbook，因为 video-frame extraction 是其他工作流的中间步骤，不是独立任务终点。

建议接入位置：
1. `playbooks/multimedia-source-asset-readiness.md` - 作为视频源素材的预处理步骤
2. `playbooks/xiaohongshu-mcp-workflow.md` - 作为视频内容分析的预处理步骤
3. `PLAYBOOKS.md` - 增补 "video-frame-extraction" 为可用能力

## Next Steps

- [ ] 在 multimedia-source-asset-readiness 中增补视频帧提取指引
- [ ] 在 xiaohongshu-mcp-workflow 中增补视频帧提取场景
- [ ] 更新 PLAYBOOKS.md 增补此能力
