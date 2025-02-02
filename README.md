# Deploying a Virtual Machine on Google Cloud Platform

## Configure the Google Cloud Storage (GCS) Backend for Terraform Statement Management

Here’s a Terraform script to set up a Google Cloud Storage (GCS) backend for Terraform state management. This setup includes:

- main.tf → Defines the Google Cloud backend infrastructure.
- variables.tf → Contains input variables.
- terraform.tfvars → Provides values for the variables.

### Step: Authenticate & Initialize

- Authenticate Terraform with Google Cloud
- Before running Terraform, authenticate with Google Cloud using a service account:

#### 1.	Create a Service Account:
```bash
gcloud iam service-accounts create terraform-backend --display-name "Terraform Backend"
```

#### 2.	Grant Storage Admin Role:
```bash
gcloud projects add-iam-policy-binding your-gcp-project-id \
    --member="serviceAccount:terraform-backend@your-gcp-project-id.iam.gserviceaccount.com" \
    --role="roles/storage.admin"
```

#### 3.	Generate and Download Credentials:
```bash
gcloud iam service-accounts keys create terraform-key.json \
    --iam-account=terraform-backend@your-gcp-project-id.iam.gserviceaccount.com
```

#### 4.	Set Environment Variable:
```bash
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/terraform-key.json"
```

#### 5. Deploy the Setup

- Now, run Terraform commands to create the backend:
```bash
terraform init
terraform apply -auto-approve
```

This will:
✅ Create a GCS bucket
✅ Enable versioning for state management
✅ Set IAM roles for state storage

Once deployed, Terraform will use GCS as the remote backend.

---

## Deploy the Virtual Machine and Its Components
