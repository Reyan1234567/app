set -euo pipefail

cd "$EC2_APP_DIR"
git pull origin "$DEPLOY_BRANCH"

cd infra
docker compose up -d --build
docker compose ps
