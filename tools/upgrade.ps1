# 从上游仓库获取最新提交（不合并）
git fetch upstream
# 切换到主分支main
git checkout main
# 合并上游main分支到本地main分支
git merge upstream/main
# 将本地提交变基到上游main分支（可能需要解决冲突）
git rebase upstream/main
# 解决冲突后继续变基流程
git rebase --continue
# 将更新后的main分支推送到远程仓库origin
git push origin main
