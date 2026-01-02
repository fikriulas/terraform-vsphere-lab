# Terraform vSphere Windows VM Deployment

This project contains Terraform configuration to deploy and customize Windows Virtual Machines on VMWare vSphere. It automates the provisioning of resources, including virtual hardware configuration (CPU, RAM, Disk) and guest OS customization (Network, Hostname, Admin Password).

## Prerequisites

Before you begin, ensure you have the following:

- **Terraform**: Installed on your local machine (v1.0+ recommended).
- **vSphere Access**: Credentials for a vCenter Server (`vcenter.dataflowx.int` or similar).
- **Windows Template**: A valid Windows VM template available in your vSphere environment.

## Getting Started

1.  **Clone the repository:**
    ```bash
    git clone <repository_url>
    cd terraform-vsphere-demo
    ```

2.  **Initialize Terraform:**
    Download the required provider plugins.
    ```bash
    terraform init
    ```

## Configuration

This project uses `variables.tf` to define parameters. You should use a `terraform.tfvars` file to set your specific environment values.

> [!WARNING]
> Never commit `terraform.tfvars` containing sensitive secrets (passwords) to version control. Add it to your `.gitignore`.

### Required Variables

Copy the example below into a file named `terraform.tfvars` and update the values:

```hcl
# vCenter Connection
vsphere_server     = "vcenter.example.com"
vsphere_user       = "administrator@vsphere.local"
vsphere_password   = "YourStrongPassword!"  # Sensitive
vsphere_datacenter = "DatacenterName"
vsphere_host       = "esxi-host.example.com"

# Infrastructure
datastore_name     = "DatastoreName"
network_name       = "VM Network"
template_name      = "Windows-Template-Name"

# VM Configuration
vm_name            = "terraform-vm-01"
num_cpus           = 2
memory             = 4096 # MB
disk_label         = "disk0"

# Guest OS Customization
computer_name      = "WIN-VM-01"
workgroup          = "WORKGROUP"
admin_password     = "LocalAdminPass!"      # Sensitive
time_zone          = 90                     # 90 = Turkey Standard Time
auto_logon         = true
auto_logon_count   = 1

# Network Settings
ipv4_address       = "192.168.1.100"
ipv4_netmask       = 24
ipv4_gateway       = "192.168.1.1"
dns_server_list    = ["8.8.8.8", "8.8.4.4"]
```

## Usage

1.  **Plan:**
    Preview the changes Terraform will make.
    ```bash
    terraform plan
    ```

2.  **Apply:**
    Provision the infrastructure.
    ```bash
    terraform apply
    ```
    Confirm with `yes` when prompted.

3.  **Destroy:**
    Clean up resources when no longer needed.
    ```bash
    terraform destroy
    ```

## Resources Created

- **vsphere_virtual_machine**: Creates a new VM by cloning the specified template.
    - Configures CPU and Memory.
    - Connects to the specified Network Adapter.
    - Creates a disk on the specified Datastore.
    - Performs Guest OS Customization (Sysprep) to set:
        - Hostname, Workgroup, Admin Password, Timezone.
        - Static IP Address, Gateway, and DNS servers.
