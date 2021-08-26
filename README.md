# Project1-ELK
## Automated ELK Stack Deployment
The files in this repository were used to configure the network depicted below.

Project1-ELK/Diagram/Diagram.png
![image](https://user-images.githubusercontent.com/83889228/131019810-6c5ff6b3-5cce-4b08-ab6d-e17e2879c947.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the my-playbook file may be used to install only certain pieces of it, such as Filebeat.
my-playbook.yml 
filebeat-playbook.yml,
metricbeat-playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
- Beats in Use
- Machines Being Monitored
- How to Use the Ansible Build

### Description of the Topology
The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.
Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
Load balancers ensure availability and protect against DDos allowing traffic to be distributed evenly across the network.
Jumpbox secures all of the admins and requires only a single system update.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the jumpbox and system network.
Filebeat watches log events and collects them while forwarding it to the elasticsearch.
Metricbeat records and collects metrics from the operating system and sends the metrics and statistical information out to elasticsearch.

The configuration details of each machine may be found below.

| Name   | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway | 10.0.0.4  | Linux      |
| Web-1  | DvWA        | 10.0.0.5  | Linux
| Web-2  |    DvWA     | 10.0.0.6   | Linux
| DiamondNet  |  DvWA  | 10.1.0.5    | Linux




### Access Policies
The machines on the internal network are not exposed to the public Internet. 
Only the JUMPBOX machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
Personal IP address.
# Machines within the network can only be accessed by SSH.
The Jumobox allows access to the ELK VM, with the IP address: 10.0.0.4.
The JumpBox & 10.0.0.4
A summary of the access policies in place can be found in the table below.
| Name   | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes       | 10.0.0.4  |
| Web-1     |     No     |   10.0.0.5   |
|  Web-2   |      No     | 10.0.0.6     |
| DiamondNet (ELK) | Yes-Kibana | 10.1.0.5 |
### Elk Configuration
Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because
It allows for complete automatic maintenance and automation without any errors.
 What is the main advantage of automating configuration with Ansible? 
Allows admins to automate multiple complex IT tasks.

The playbook implements the following tasks:

1. Install Docker: Installed since it is required by ansible to control the state of Docker containers. 
2. Install Python3_pip: A package used to install Python software.
3. Installing Docker Module: Within this module the docker modules have specified tasks on the components that need to be downloaded.
4. Increase Memory Usage: Within the elk YML the following task vm.max_map_count to 262144 should be inputed due to the ELK docker image having low memory.
5. Download Image/Launch Elk: Downloads and initiates the container within the specified ports.
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
![image](https://user-images.githubusercontent.com/83889228/131019879-374a7177-a589-4873-af35-72433ace2716.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
Web-1 10.0.0.5 
Web-2 10.0.0.6
ELK 10.1.0.5
We have installed the following Beats on these machines:
Filebeat and Metricbeat were installed on these two machines via YML playbook within the ansible container.
These Beats allow us to collect the following information from each machine:
Metricbeat collects data from the operating system metrics such as CPU, memory, data connected to services running on the server. While filebeat can audit, monitor server logs and collect all other log events within the server. Both utilize powerful tools to monitor traffic and collect data to protect the servers.
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 
SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to /etc/ansible/roles/install-elk.yml .
- Update the hosts file to include the group [elk] and the destination IP address.
- Run the playbook, and navigate to http://[your.VM.IP]:5601/app/kibana to check that the installation worked as expected.

Which file is the playbook? The roles file is the playbook and you copy it to.. Where do you copy it?_
The roles file is the file where you can find the playbook and it can be copied to /etc/ansible/roles/install-elk.yml.

The file you uppdate to make Ansible run the playbook on a specific machine is the hosts file. 

You can also specify the machine to install the elk server on filebeat/metricbeat by installing filebeat/metricbeat configuration file and adjusting the host to the destination IP address. These configuration files can be found by following this path /etc/ansible/filebeat-config.yml or /etc/ansible/metricbeat-config.yml. 


Which URL do you navigate to in order to check that the ELK server is running?

 http://[your.VM.IP]:5601/app/kibana

