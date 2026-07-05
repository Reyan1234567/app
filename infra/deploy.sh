set -euo pipefail

cd "$EC2_APP_DIR"

INTERNAL_HEALTH_URL="${INTERNAL_HEALTH_URL:-http://127.0.0.1:8080/api/v1/health}"
PUBLIC_HEALTH_URL="${PUBLIC_HEALTH_URL:-https://lumenlabs.site/api/v1/health}"

git pull origin "$DEPLOY_BRANCH"

cd "infra"
docker compose up -d --build
docker compose ps

echo "Checking internal health..."
curl -f "$INTERNAL_HEALTH_URL"

echo "Checking public HTTPS health..."
curl -f "$PUBLIC_HEALTH_URL"

echo "Deployment completed successfully."
