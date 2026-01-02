variable "vsphere_user" {
  description = "vSphere User"
}

variable "vsphere_password" {
  description = "vSphere Password"
  sensitive   = true
}

variable "vsphere_server" {
  description = "vSphere Server Name or IP"
}

variable "vsphere_datacenter" {
  description = "vSphere Datacenter Name"
}

variable "vsphere_host" {
  description = "vSphere Host Name or IP"
}

variable "datastore_name" {
  description = "vSphere Datastore Name"
}

variable "network_name" {
  description = "vSphere Network Name"
}

variable "template_name" {
  description = "VM Template Name"
}

variable "vm_name" {
  description = "vCenter VM Name"
}

variable "num_cpus" {
  description = "Number of CPUs"
  type        = number
}

variable "memory" {
  description = "RAM in MB"
  type        = number
}

variable "disk_label" {
  description = "Disk Label"
}

variable "computer_name" {
  description = "Guest OS Computer Name"
}

variable "workgroup" {
  description = "Guest OS Workgroup"
}

variable "admin_password" {
  description = "Guest OS Admin Password"
  sensitive   = true
}

variable "time_zone" {
  description = "Guest OS Time Zone"
  type        = number
}

variable "auto_logon" {
  description = "Enable Auto Logon"
  type        = bool
}

variable "auto_logon_count" {
  description = "Auto Logon Count"
  type        = number
}

variable "ipv4_address" {
  description = "VM IPv4 Address"
}

variable "ipv4_netmask" {
  description = "VM IPv4 Netmask"
  type        = number
}

variable "ipv4_gateway" {
  description = "VM IPv4 Gateway"
}

variable "dns_server_list" {
  description = "DNS Server List"
  type        = list(string)
}
