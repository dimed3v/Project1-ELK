# Project1-ELK
## Automated ELK Stack Deployment
The files in this repository were used to configure the network depicted below.

![image](https://github.com/dimed3v/Project1-ELK/blob/d2926840e1e6ae4073a5c8f828672fe8ee8ce7ac/Diagram/Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.
- [Install-elk playbook.yml](https://github.com/dimed3v/Project1-ELK/blob/94898de887f03d6f30273f56e9b0fa470efdddc4/Ansible/install-elk.yml) 
- [Filebeat-playbook.yml](https://github.com/dimed3v/Project1-ELK/blob/fe7f3fb3ec92c117f82a9e4ae6eff948e7622bd7/Ansible/filebeat-playbook.yml)
- [Metricbeat-playbook.yml](https://github.com/dimed3v/Project1-ELK/blob/5d089c2fc5ec01e066b849d060a8a7462575232d/Ansible/metricbeat-playbook.yml) 
- [DvWA](https://github.com/dimed3v/Project1-ELK/blob/b78a1ccdea8a47a5ea48eb324acf0dd1ea3a87d9/Ansible/dvwa.yml)

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
- _The JumpBox server is a gateway gaining access can be done remotely, primarly by using ssh with a verified key with accesss._ 
- _Load balancers ensure availability and protect against DDos allowing traffic to be distributed evenly across the network.
Jumpbox secures all of the admins and requires only a single system update._

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the jumpbox and system network.
- _Filebeat watches system log events and collects them while forwarding it to the elasticsearch._
- _Metricbeat records and collects metrics from the operating system and sends the metrics and statistical information out to elasticsearch._

The configuration details of each machine may be found below.

| Name   | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway | Personal IP | Linux      |
| Web-1  | DvWA        | 10.0.0.5  | Linux
| Web-2  |    DvWA     | 10.0.0.6   | Linux
| DiamondNet (ELK)  |  ELK  | 10.1.0.5    | Linux




### Access Policies
The machines on the internal network are not exposed to the public Internet. Only the Jumpbox machine can accept connections from the Internet.

- Access to this machine is only allowed from the following IP addresses: 
  - _Personal IP address (of the JumpBox)._
- Machines within the network can only be accessed by SSH. The Jumpbox allows access to the ELK VM, with the following IP address: 
  - _10.0.0.4._

A summary of the access policies in place can be found in the table below.
| Name   | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes-SSH       | Personal IP (JumpBox)  |
| Web-1     |     No     |   10.0.0.5   |
|  Web-2   |      No     | 10.0.0.6     |
| DiamondNet (ELK) | Yes-Kibana | 10.1.0.5 |
### Elk Configuration
Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _It allows for complete automatic maintenance and automation to help reduce any errors._
- What is the main advantage of automating configuration with Ansible? 
  - _Allows admins to automate multiple complex IT tasks._

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
- Web-1: 10.0.0.5 
- Web-2: 10.0.0.6
- ELK: 10.1.0.5

- We have installed the following Beats on these machines:
  - Filebeat and Metricbeat installed via YML playbook.

These installed files allow us to collect the following information from each machine:
- Metricbeat collects data from the operating system metrics such as CPU, memory, and data connected to services running on the server. 
- While filebeat can audit, monitor server logs and collect all other log events within the server. Both utilize powerful tools to monitor traffic and collect data to protect the servers.
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 
- _SSH into the control node and follow the steps below..._ 
- Copy the install-elk.yml file to /etc/ansible/roles .
- Update the [hosts](https://github.com/dimed3v/Project1-ELK/blob/cfc2e6e0636616a8455f891dce454719c3672753/Ansible/hosts-file.txt) file to include the group [elk] and the destination IP address.
- As shown in the example below:
![image](https://user-images.githubusercontent.com/83889228/131023515-1e988573-36f7-4c9d-bd13-c43d299f3ffb.png)
- Run the playbook, and navigate to http://[your.elkVM.IP]:5601/app/kibana to check that the installation worked as expected.
- If successful the kibana webpage should display like so: 
  - ![image](https://user-images.githubusercontent.com/83889228/131222401-7757c92e-6635-4f5c-9307-18d6ad7861a2.png)

Answer the following questions to fill in the blanks:

- Which file is the playbook? Where do you copy it?
  - The file for the filebeat playbook is filebeat-playbook.yml, and should be copied to the following path: /etc/filebeat. 
  - The file for the metricbeat playbook is metricbeat-playbook.yml, and should be copied to the following path: /etc/metricbeat.

- Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?
  - You update the /etc/ansible/hosts file to make the Ansible run on a specific machine. You update each playbook file (metric, filebeat etc..) and edit the hosts line by replacing the IP address to specify what machines the playbook runs on.

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
### Installing Elk to Navigate Kibana
- First within the JumpBox Provisioner run the following command to get/install the Elk playbook:
  - `Curl` https://github.com/dimed3v/Project1-ELK/blob/f92dd415459a8d6fc9c0329f0f299ea8087b1882/Ansible/install-elk.yml > /etc/ansible/roles/install-elk.yml
- Next, edit the hosts file in /etc/ansible/ with the provided information below:
  - ![image](https://user-images.githubusercontent.com/83889228/131221997-5fb8cdc0-1eef-46e9-946a-c75576e3c89e.png)
- Next, you will run the playbook by running the following command:
  - `ansible-playbook install-elk.yml`
- Following the install of your elk playbook, check that the elk installation works by going to the browser:
  - http://[your.elkVM.IP]:5601/app/kibana
  - ![image](https://user-images.githubusercontent.com/83889228/131222401-7757c92e-6635-4f5c-9307-18d6ad7861a2.png)
### Installing FileBeat
- Download the playbook by running:
  - `curl` https://github.com/dimed3v/Project1-ELK/blob/301edaf377d04219e42e63cc06ff2e645d480a8e/Ansible/filebeat-playbook.yml > /etc/ansible/roles/filebeat-playbook.yml 
  - The image below is the information that should be displayed:
  - ![image](https://user-images.githubusercontent.com/83889228/131222755-66a1b00f-e73b-485d-8c76-0edde59254e5.png)
 ### Installing MetricBeat
 - Download the playbook by running: 
   - `curl` https://github.com/dimed3v/Project1-ELK/blob/5f1ada2c752500f9aaa7a5144a74423c2797496e/Ansible/metricbeat-playbook.yml > /etc/ansible/roles/metricbeat-playbook.yml
   - The image below is the information that should be displayed: 
   - ![image](https://user-images.githubusercontent.com/83889228/131222954-310c8018-cd5e-46bc-a768-4099f27c4f15.png)
- _After all these steps are completed, you should now have access to filebeat data and metricbeat data within the kibana UI._
