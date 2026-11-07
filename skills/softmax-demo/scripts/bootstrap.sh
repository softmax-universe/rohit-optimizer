#!/usr/bin/env bash
set -euo pipefail
umask 077
: "${SOFTMAX_RESEARCH_DIR:=$HOME/workspaces/rohit-optimizer}"
: "${SOFTMAX_POLICY_DIR:=$HOME/workspaces/rohit-gota-policy}"
: "${SOFTMAX_RESEARCH_REF:=main}"
: "${SOFTMAX_RESEARCH_REPO:=https://github.com/softmax-universe/rohit-optimizer.git}"
: "${SOFTMAX_POLICY_REPO:?The provisioner must supply the user-owned policy repository URL}"
command -v git >/dev/null
command -v uv >/dev/null
canonical_origin() {
  local origin="${1%.git}"
  case "$origin" in
    https://github.com/Metta-AI/rohit-optimizer) origin="https://github.com/softmax-universe/rohit-optimizer" ;;
  esac
  printf '%s' "$origin"
}
clone_workspace() {
  local remote="$1" destination="$2" branch="$3"
  if [ -e "$destination" ]; then
    local configured_remote
    configured_remote="$(git -C "$destination" config --get remote.origin.url)"
    test "$(canonical_origin "$configured_remote")" = "$(canonical_origin "$remote")"
    git -C "$destination" status --short
  else
    mkdir -p "$(dirname "$destination")"
    git clone "$remote" "$destination"
    if [ -n "$branch" ]; then
      git -C "$destination" fetch --depth 1 origin "$branch"
      git -C "$destination" checkout --detach FETCH_HEAD
    fi
  fi
}
clone_workspace "$SOFTMAX_RESEARCH_REPO" "$SOFTMAX_RESEARCH_DIR" "$SOFTMAX_RESEARCH_REF"
clone_workspace "$SOFTMAX_POLICY_REPO" "$SOFTMAX_POLICY_DIR" ""
uv sync --frozen --project "$SOFTMAX_RESEARCH_DIR" --python 3.12
"$SOFTMAX_RESEARCH_DIR/.venv/bin/coworld" --help >/dev/null
printf 'Research revision: '
git -C "$SOFTMAX_RESEARCH_DIR" rev-parse HEAD
printf 'Policy revision: '
if git -C "$SOFTMAX_POLICY_DIR" rev-parse --verify HEAD >/dev/null 2>&1; then
  git -C "$SOFTMAX_POLICY_DIR" rev-parse HEAD
else
  printf '%s\n' 'Empty repository; the first policy commit will initialize it.'
fi
printf '%s\n' 'CLI installed. Configure scoped auth before running experiments; no experiment was submitted.'
