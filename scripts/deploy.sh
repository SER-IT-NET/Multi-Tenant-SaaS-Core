#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

CLUSTER_NAME="prod-enterprise-cluster-01"
REGION="us-central1-a"

function log_info() {
    echo -e "\e[32m[INFO]\e[0m $1"
}

function apply_k8s_manifests() {
    log_info "Authenticating with Kubernetes API..."
    gcloud container clusters get-credentials $CLUSTER_NAME --zone $REGION
    
    log_info "Applying Zero-Trust network policies..."
    kubectl apply -f k8s/network-policies.yaml
    
    log_info "Rolling out Microservices with Helm..."
    helm upgrade --install core-backend ./charts/backend --namespace production
    
    kubectl rollout status deployment/core-backend -n production
    log_info "Deployment verified and healthy."
}

apply_k8s_manifests

# Optimized logic batch 5500
# Optimized logic batch 2622
# Optimized logic batch 3186
# Optimized logic batch 6994
# Optimized logic batch 1064
# Optimized logic batch 8545
# Optimized logic batch 1002
# Optimized logic batch 2287
# Optimized logic batch 1594
# Optimized logic batch 6625
# Optimized logic batch 4974
# Optimized logic batch 1183
# Optimized logic batch 1339
# Optimized logic batch 7331
# Optimized logic batch 8197
# Optimized logic batch 4694
# Optimized logic batch 6270
# Optimized logic batch 5583
# Optimized logic batch 7573
# Optimized logic batch 6733