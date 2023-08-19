# Multi-service-web-application
Design and deployment of a highly available web application on AWS using Terraform. The application utilizes multiple AWS services and consider cost optimization.

# Deploy WordPress with Amazon RDS
WordPress is a highly popular content management system (CMS) that is used for over 30% of all sites on the internet. It is most commonly used for blogs but can also be used for running e-commerce sites, message boards, and many other popular use cases.

# What you will accomplish
WordPress requires a MySQL database to store its data.
 
In the modules that follow, we will see how to configure a WordPress installation using Amazon RDS for MySQL. To configure this WordPress site, we will create the following resources in AWS:
 1. An Amazon EC2 instance to install and host the WordPress application
 2. An Amazon RDS for MySQL database to store your WordPress data

# Here, in below steps we have shown to deploy wordpress with MySQL RDS with single EC2.
# But if you go to terraform manifests we have used HA env with 2 EC2 in each AZs in private subntes integrated with Internet Facing ALB which act as a front-end for our wordpress application. Using ALB DNS we can call our application/website. Later, we can add integrate Route53 DNS with SSL to secure our website.
# Also, we can have Autoscaling Enabled with Load Balancer to distribute the traffic so as to reduce the latency during peak hours.

# Cost Optimization
We can go with saving plan or reserved instance approaoch for long term and also we can save our compute cost by scheduling running EC2 instances.

# Security
We can go with WAF on top of our Application Load Balanacer to secure the application.

# Implementation
a. Open the AWS Management Console. When the screen loads, enter RDS in the search bar, then select RDS to open the service console.

![Alt text](image.png)

b. Choose the Create database button to get started.
![Alt text](image-1.png)

c. The first step is to choose the database engine you want to use. Amazon RDS supports six different engines, from popular open-source options like MySQL and PostgreSQL, to commercial options like Oracle and Microsoft SQL Server, to a cloud-native option called Amazon Aurora that was custom-built to take advantage of the cloud.
 
WordPress uses MySQL, so select Standard create for the database creation method and choose the MySQL engine.

![Alt text](image-2.png)

d. In the Templates section of the creation wizard, there is an option to only show options that are available in the AWS Free Tier. Select this option to complete the learning in this guide without incurring costs.

In a production setup, you may want to use features of Amazon RDS that are outside the Free Tier. These include:

A larger database instance class, for improved performance
Multi-AZ deployments, for automatic failover and recovery in the event of an infrastructure issue
Provisioned IOPS for disk storage, for faster I/O performance

![Alt text](image-3.png)

e. Next, you will specify the authentication settings for your MySQL deployment. These include the database name and the master username and password.

In the Settings section, enter wordpress as your DB instance identifier. Then specify the master username and password for your database. Choose a strong, secure password to help protect your database. Store the username and password for safekeeping as you will need it in a later module.

![Alt text](image-4.png)

f. After setting your username and password, you can select key details about your MySQL deployment. This includes the instance configuration and storage details.
 
The default settings will work for this guide. You will use a small instance class that is suitable for testing or small-scale applications, and it fits within the AWS Free Tier. If you don’t want to use the AWS Free Tier, you could set a larger instance class or alter the storage configuration options.

![Alt text](image-5.png)

![Alt text](image-6.png)

g. Next, you can configure connectivity and network settings. Amazon RDS instances must be created in an Amazon VPC, which is a logically separate network where your provisioned resources will live.

VPCs are an advanced topic outside the scope of this guide. Fortunately, AWS has created a default VPC in each Region in your account. The default VPC is already selected for you, and you can launch your Amazon RDS instance in this VPC.

![Alt text](image-7.png)

h. Finally, Amazon RDS provides a number of additional configuration options to customize your deployment. You need to make one change in this area. Select the Additional configuration line to expand the options. Set the Initial database name to wordpress. This will ensure Amazon RDS creates the database in your MySQL instance upon initialization. You will use this database name when connecting to your database.

![Alt text](image-8.png)

![Alt text](image-9.png)

i. Retain the default settings for the remainder of options. At the bottom of the creation wizard, AWS will show you estimated monthly costs for your Amazon RDS database. If you are still eligible for the Amazon RDS Free Tier, you will see a note that the database will be free to you for up to 12 months.
Choose the Create database button to create your database.

![Alt text](image-10.png)

j. You should see a success notice indicating that your database is being created.

![Alt text](image-11.png)

a. To create your EC2 instance, go to Amazon EC2 in the AWS Management Console. Choose the Launch instance button to open the instance creation wizard.

![Alt text](image-12.png)

b. On the first page, enter wordpress app as your instance name.

![Alt text](image-13.png)

c. Next, choose an Amazon Machine Image (AMI). The AMI you choose will determine the base software that is installed on your new EC2 instance. This includes the operating system (Amazon Linux, Red Hat Enterprise Linux, Ubuntu, Microsoft Server, etc.), and the applications that are installed on the machine.

Many AMIs are general-purpose AMIs for running many different applications, but some are purpose-built for specific use cases, such as the Deep Learning AMI or various AWS Marketplace AMIs.

The Amazon Linux distro is a popular choice, so choose the Amazon Linux 2 AMI (HVM) in the AMI selection view.

![Alt text](image-14.png)

Scroll down to select an EC2 instance type. An instance type is a particular configuration of CPU, memory (RAM), storage, and network capacity.

AWS has a huge selection of instance types that cover many different workloads. Some are geared toward memory-intensive workloads, such as databases and caches, while others are aimed at compute-heavy workloads, such as image processing or video encoding.

Amazon EC2 allows you to run 750 hours per month of a t2.micro instance under the AWS Free Tier. Select this option for this guide so that you won’t incur any costs on your bill.

a. Select the t2.micro instance.
![Alt text](image-15.png)

You will see a details page on how to configure a key pair for your instance. You will use the key pair to SSH into your instance, which will give you the ability to run commands on your server.

a. Open the key pair (login) section and choose Create new key pair for your instance.
![Alt text](image-16.png)

b. Give your key pair a name. Then choose the Create key pair button, which will download the .pem file to your machine. You will use this file in the next module.
![Alt text](image-17.png)

You need to configure a security group before launching your instance. Security groups are networking rules that describe the kind of network traffic that is allowed to your EC2 instance. You want to allow two kinds of traffic to your instance:

SSH traffic from your current IP address so you can use the SSH protocol to log in to your EC2 instance and configure WordPress
HTTP traffic from all IP addresses so that users can view your WordPress site.
 
a. To configure this, select Allow SSH traffic from My IP and select Allow HTTP traffic from the internet.
![Alt text](image-18.png)
![Alt text](image-19.png)

b. In the Network settings section, choose the Edit button. Scroll down to Firewall (security groups) and enter wordpress for the Security group name.
![Alt text](image-20.png)
![Alt text](image-21.png)

It is now time to launch your EC2 instance.
a. Choose the Launch instance button to create your EC2 instance.
![Alt text](image-22.png)
You have successfully launched your EC2 instance. In the next module, we will configure your Amazon RDS database to work with your EC2 instance.

First, you will modify your Amazon RDS database to allow network access from your EC2 instance.
In the previous module, you created security group rules to allow SSH and HTTP traffic to your WordPress EC2 instance. The same principle applies here. This time, you want to allow certain traffic from your EC2 instance into your Amazon RDS database.
a. To configure this, go to the Amazon RDS databases page in the AWS console. Choose the MySQL database you created in the earlier module in this guide.
![Alt text](image-23.png)

b. Scroll to the Connectivity & security tab in the display and choose the security group listed in VPC security groups. The console will take you to the security group configured for your database.
![Alt text](image-24.png)

c. Select the Inbound rules tab, then choose the Edit inbound rules button to change the rules for your security group.
![Alt text](image-25.png)

d. The default security group has a rule that allows all inbound traffic from other instances in the default security group. However, since your WordPress EC2 instance is not in that security group, it will not have access to the Amazon RDS database.
Change the Type property to MYSQL/Aurora, which will update the Protocol and Port range to the proper values. Then, remove the current security group value configured for the Source.
![Alt text](image-26.png)
![Alt text](image-27.png)

e. For Source, enter wordpress. The console will show the available security groups that are configured. Choose the wordpress security group that you used for your EC2 instance.
![Alt text](image-28.png)

f. After you choose the wordpress security group, the security group ID will be filled in. This rule will allow MySQL access to any EC2 instance with that security group configured.
When you’re finished, choose the Save rules button to save your changes.
![Alt text](image-29.png)

Now that your EC2 instance has access to your Amazon RDS database, you will use SSH to connect to your EC2 instance and run some configuration commands.
 

a. Go to the EC2 instances page in the console. You should see the EC2 instance you created for the WordPress installation. Select it and you will see the Public IPv4 address and the Public IPv4 DNS in the instance description.
![Alt text](image-30.png)

b. Previously, you downloaded the .pem file for the key pair of your instance. Locate that file now. It will likely be in a Downloads folder on your desktop.
 
For Mac or Linux users:
 
Open a terminal window. If you are on a Mac, you can use the default Terminal program that is installed, or you can use your own terminal.
 
In your terminal, run the following commands to use SSH to connect to your instance. Replace the “<path/to/pem/file>” with the path to your file, e.g., “~/Downloads/wordpress.pem”, and the “<publicIpAddress>” with the public IP address for your EC2 instance.
1. chmod 400 <path/to/pem/file> 
2. ssh -i <path/to/pem/file> ec2-user@<public_IP_DNSAddress>

You should see the following in your terminal to indicate that you connected successfully:
![Alt text](image-31.png)

For Windows users:
 
You will need to use PuTTY, an SSH client for Windows, to connect to your EC2 instance. For instructions on doing this, see this guide for Connecting to your Linux instance from Windows using PuTTY. You will need the .pem file you downloaded and the public IP address of your EC2 instance.
In this step, you connected to your EC2 instance using SSH. In the next step, you will connect to your Amazon RDS database from your EC2 instance and create a database user for the WordPress application.
You should have an active SSH session to your EC2 instance in the terminal. Now, you will connect to your MySQL database.
 
First, run the following command in your terminal to install a MySQL client to interact with the database.
1. sudo yum install -y mysql

Next, find the hostname for your Amazon RDS database in the AWS console. In the details of your Amazon RDS database, the hostname will be shown as the Endpoint in the Connectivity & security section.

a. Go to the Amazon RDS databases page in the AWS console. You should see the wordpress database you created for the WordPress installation. Select it to find the hostname for your Amazon RDS database.
![Alt text](image-32.png)
b. In the details of your Amazon RDS database, the hostname will be shown as the Endpoint in the Connectivity & security section.
![Alt text](image-33.png)
In your terminal, enter the following command to set an environment variable for your MySQL host. Be sure to replace “your-endpoint” with the hostname of your RDS instance.

1. export MYSQL_HOST="your-endpoint"

Next, run the following command in your terminal to connect to your MySQL database. Replace “user” and “password” with the master username and password you configured when creating your Amazon RDS database.

1. mysql --user="user" --password="password" wordpress

Finally, create a database user for your WordPress application and give the user permission to access the wordpress database.

Run the following commands in your terminal:

1. CREATE USER 'wordpress' IDENTIFIED BY 'wordpress-pass';
2. GRANT ALL PRIVILEGES ON wordpress.* TO wordpress;
3. FLUSH PRIVILEGES;
4. Exit

As a best practice, you should use a better password than wordpress-pass to secure your database.
Write down both the username and password that you configure, as they will be needed in the next module when setting up your WordPress installation.

To run WordPress, you need to run a web server on your EC2 instance. The open source Apache web server is the most popular web server used with WordPress.

To install Apache on your EC2 instance, run the following command in your terminal:

1. sudo yum install -y httpd

To run WordPress, you need to run a web server on your EC2 instance. The open source Apache web server is the most popular web server used with WordPress.

To install Apache on your EC2 instance, run the following command in your terminal:

1. sudo yum install -y httpd

In this step, you will download the WordPress software and set up the configuration.

First, download and uncompress the software by running the following commands in your terminal:

1. wget https://wordpress.org/latest.tar.gz
2. tar -xzf latest.tar.gz

If you run ls to view the contents of your directory, you will see a tar file and a directory called wordpress with the uncompressed contents.

1. $ ls
2. latest.tar.gz  wordpress

Change the directory to the wordpress directory and create a copy of the default config file using the following commands:

1. cd wordpress
2. cp wp-config-sample.php wp-config.php

Then, open the wp-config.php file using the nano editor by running the following command.

1. vi wp-config.php

You need to edit two areas of configuration.

First, edit the database configuration by changing the following lines:

1. // ** MySQL settings - You can get this info from your web host ** //
2. /** The name of the database for WordPress */
3. define( 'DB_NAME', 'database_name_here' );
4. 
5. /** MySQL database username */
6. define( 'DB_USER', 'username_here' );
7. 
8. /** MySQL database password */
9. define( 'DB_PASSWORD', 'password_here' );
10. 
11. /** MySQL hostname */
12. define( 'DB_HOST', 'localhost' );

The values should be:

1. DB_NAME: “wordpress”
2. DB_USER: The name of the user you created in the database in the previous module
3. DB_PASSWORD: The password for the user you created in the previous module
4. DB_HOST: The hostname of the database that you found in the previous module

The second configuration section you need to configure is the Authentication Unique Keys and Salts. It looks as follows in the configuration file:

1. /**#@+
2. * Authentication Unique Keys and Salts.
3. *
4. * Change these to different unique phrases!
5. * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/  WordPress.org secret-key service}
6.  * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
7.  *
8.  * @since 2.6.0
9. */
10. define( 'AUTH_KEY',         'put your unique phrase here' );
11. define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
12. define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
13. define( 'NONCE_KEY',        'put your unique phrase here' );
14. define( 'AUTH_SALT',        'put your unique phrase here' );
15. define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
16. define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
17. define( 'NONCE_SALT',       'put your unique phrase here' );

You can save and exit from vim.

With the configuration updated, you are almost ready to deploy your WordPress site. In the next step, you will make your WordPress site live.

In this step, you will make your Apache web server handle requests for WordPress.

First, install the application dependencies you need for WordPress. In your terminal, run the following command.

1. sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2

Second, change to the proper directory by running the following command:

2. cd /home/ec2-user

Then, copy your WordPress application files into the /var/www/html directory used by Apache.

3. sudo cp -r wordpress/* /var/www/html/

Finally, restart the Apache web server to pick up the changes.
4. sudo service httpd restart

You should see the WordPress welcome page and the five-minute installation process.
![Alt text](image-34.png)

That’s it. You have a live, publicly accessible WordPress installation using a fully managed MySQL database on Amazon RDS.