####################################################################
#
# Variables used. All have defaults
#
####################################################################

# KK Playground. Cluster must be called 'demo-eks'
variable "cluster_name" {
  type        = string
  description = "Name of the cluster"
  default     = "demo-eks"
}

# KK Playground. Cluster role must be called 'eksClusterRole'
variable "cluster_role_name" {
  type        = string
  description = "Name of the cluster role"
  default     = "eksClusterRole"
}

# In KK playground and for some EKS labs, the role is not predefined.
# In some other EKS labs, the service role exists already.
# This variable is initialized as an environment variable source
# by check-environment.sh if it is required to be "true"
variable "use_predefined_role" {
  type        = bool
  description = "Whether to use predefined cluster service role, or create one."
  default     = false
}

# KK Playground. Node role must be called 'eksWorkerNodeRole'
variable "node_role_name" {
  type        = string
  description = "Name of node role"
  default     = "eksWorkerNodeRole"
}

variable "node_ami_id" {
  type        = string
  description = "Node AMI ID override, for example an image available in Floci. Null uses the AWS public SSM parameter."
  default     = "ami-0abcdef1234567890"

  validation {
    condition     = var.node_ami_id == null || can(regex("^ami-[0-9a-f]+$", var.node_ami_id))
    error_message = "node_ami_id must be null or an AMI ID starting with ami- followed by hexadecimal characters."
  }
}

# KK Playground. Policy role must be called 'eksPolicy'
variable "additional_policy_name" {
    type = string
    description = "Name of IAM::Policy created for additional permissions"
    default = "eksPolicy"
}

variable "node_group_desired_capacity" {
  type        = number
  description = "Desired capacity of Node Group ASG."
  default     = 3
}
variable "node_group_max_size" {
  type        = number
  description = "Maximum size of Node Group ASG. Set to at least 1 greater than node_group_desired_capacity."
  default     = 4
}

variable "node_group_min_size" {
  type        = number
  description = "Minimum size of Node Group ASG."
  default     = 1
}

