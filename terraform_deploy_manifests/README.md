# Infrastructure as Code with Terraform - Standardize your deployment workflow
To deploy infrastructure with Terraform:
1. Scope - Identify the infrastructure for your project.
2. Author - Write the configuration for your infrastructure.
3. Initialize - Install the plugins Terraform needs to manage the infrastructure.
4. Plan - Preview the changes Terraform will make to match your configuration.
5. Apply - Make the planned change

![Alt text](image.png)

# Initialize the directory
When you create a new configuration — or check out an existing configuration from version control — you need to initialize the directory with terraform init.

Initializing a configuration directory downloads and installs the providers defined in the configuration, which in this case is the aws provider.