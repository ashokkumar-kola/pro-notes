# ----------------------------------------------------------------------------- #


# CLOUD

- Delivery of computing services
- Over the internet
- Pay as you go

  - servers
  - storage devices
  - networking
  - software 
  - analytics
  - intelligence


# ----------------------------------------------------------------------------- #


# ☁️ Deployment Models (Cloud Types)

---

## 🌍 Public Cloud
- **What:** Services/resources owned & operated by third-party providers.
- **Access:** Shared by multiple customers.
- **Examples:** AWS, Azure, GCP.

---

## 🏢 Private Cloud
- **What:** Cloud infrastructure used exclusively by one organization.
- **Access:** Can be on-premises or hosted by a third party.
- **Examples:** VMware private cloud.

---

## 🔗 Hybrid Cloud
- **What:** Combines public & private clouds.
- **Use:** Workloads move between both for flexibility.
- **Examples:** On-prem + AWS Direct Connect.

---

## 👥 Community Cloud
- **What:** Shared by several orgs with common concerns (security, compliance).
- **Use:** Specific community needs (e.g., government agencies).
- **Examples:** GovCloud, academic collaborations.

---

## 🌐 Multi‑Cloud
- **What:** Uses multiple cloud providers.
- **Use:** Avoid vendor lock-in, improve reliability.
- **Examples:** AWS + Azure + GCP.

---


# ----------------------------------------------------------------------------- #


# ☁️ Cloud Service Models

---

## 🏗️ Infrastructure‑as‑a‑Service (IaaS)
- **What:** Virtual machines, storage, networks, virtualization.
- **User:** Manages OS & applications.
- **Examples:** `EC2`, `EBS`, `VPC`, `S3`, `Direct Connect`, `ELB`, `Route 53`

---

## ⚙️ Platform‑as‑a‑Service (PaaS)
- **What:** Frameworks & dev tools.
- **Provider:** Manages OS & middleware.
- **Examples:** `Elastic Beanstalk`, `App Runner`, `Fargate`, `RDS`, `DynamoDB`, `API Gateway`

---

## 📦 Software‑as‑a‑Service (SaaS)
  - **What:** Full applications delivered via web.
  - **User:** Uses the software, no infra/mgmt.
  - **Examples:** `Office 365`, `Salesforce`.

---

## ⚡ Function‑as‑a‑Service (FaaS) / Serverless
  - **What:** Event-driven code, no server mgmt.
  - **Provider:** Scales automatically, pay per execution.
  - **Examples:** `AWS Lambda`, `Step Functions`, `EventBridge`, `SQS`, `SNS`

---

## 🐳 Container‑as‑a‑Service (CaaS)
  - **What:** Manages & orchestrates container deployments.
  - **Examples:** `ECS`, `EKS`, `Fargate`.

---


# ----------------------------------------------------------------------------- #
	

# 🧩 Virtualization Types

---

## 💻 OS Virtualization
- **What:** Run multiple operating systems on one physical machine.
- **Example:** Virtual machines (`VMs`).

---

## 🖥️ Server Virtualization
- **What:** Divide one physical server into multiple isolated virtual servers.
- **Example:** Hypervisors like `VMware ESXi`.

---

## 📦 Storage Virtualization
- **What:** Combine multiple storage devices into a single storage pool.
- **Use:** Easier management, higher availability.

---

## 🌐 Network Virtualization
- **What:** Combine hardware & software to create virtual networks.
- **Use:** `VLANs`, software-defined networking (`SDN`).

---


# ----------------------------------------------------------------------------- #


EC2 – Virtualization
Lambda – Serverless
Elastic Beanstalk – Orchestration
Fargate – Containers
Batch – Processing
Outposts – On‑premises
Wavelength – Edge
App Runner – Microservices 

## COMPUTE

# -------------------------------------------------------------------------------------------------------------- #


# EC2 – Virtualization

	- Elastic Compute Cloud

= Instance Types 
	- Predefined compute configurations
		- t4g Burstable Performance Instance
		- m6i (General Purpose Instance)
		- c7n (Compute Optimized Instance)
		
		- r7i (Memory Optimized)
		- 4i, d3en (Storage Optimized)
		- p5, inf2, g6 (Accelerated Computing)

= AMI (Amazon Machine Image)template
	- A pre-configured OS + app stack to launch instances.
		- OS
		- Software and Application Stack
		- Configuration Settings

= EBS (Elastic Block Store)	
	- Persistent storage volumes for EC2.
		- Persistent Storage
		- Block-level Storage
		- Scalable and Flexible
		- Multiple Volumes
		- Backup & Snapshot
		
		- Instance storage (temporary storage)
		
	- Types of EBS Volumes
		- General Purpose SSD (gp3)
		- Provisioned IOPS SSD (io2)
		- Throughput Optimized HDD (st1)
		- Cold HDD (sc1)
		
= Auto Scaling	
	- Automatically adjusts number of instances based on load.
	
= Load Balancer	
	- Distributes traffic across multiple instances.
	
	- Methods
		- Round Robin
		- Least Connections
		- IP Hash
		- Weighted Load
		
	- Types of Load Balancers in AWS
		- Classic Load Balancer (CLB)
		- Application Load Balancer (ALB)
		- Network Load Balancer (NLB)
		- Gateway Load Balancer (GLB)

= Elastic IP	
	- Static IP addresses for EC2 instances.
		- Static IP
		- Reassignable
		- Cost Consideration
	
= Security Groups	
	- Virtual firewalls to control traffic.
		- controls the inbound and outbound traffic to/from your EC2 instances
		
	- Key Features
		- Stateful
		- Rules-Based
		- Multiple Security Groups
		- Default Security Group
	
= Placement Groups	
	- Influence how instances are placed on underlying hardware.
		
	- Types of Placement Groups:
		- Cluster Placement Group
		- Spread Placement Group
		- Partition Placement Group

= Dedicated Hosts/Instances	
	- Physically isolated servers for compliance and licensing.
		- Physical Server
		- Licensing - BYOL
		- Full Control
		
		- Isolated Instances
		- No Co-Location
		- BYOL
	
= Virtualization Types
	- HVM (Hardware Virtual Machine): 
		- Fully virtualized instances using hardware extensions.

	- PV (Paravirtual): 
		- Lightweight, older method (mostly deprecated).

	- Nitro Hypervisor: 
		- Lightweight, secure hypervisor on Nitro System (default for newer instances).
		
= Security Components
	- IAM roles for EC2 (access to AWS services).

	- Security groups & NACLs (network security).

	- SSM Agent for remote command/control without SSH.

	
# -------------------------------------------------------------------------------------------------------------- #


Lambda – Serverless

= Architecture
	- Fully Managed Compute
	- Stateless Functions
	- Ephemeral Storage
	- Lambda@Edge

= Event-Driven	
	- Triggers via events (e.g., API Gateway, S3, DynamoDB, CloudWatch).
		- API Gateway
		- S3
		- DynamoDB
		- EventBridge
		- CloudWatch
		- SNS/SQS

= Runtimes	
	- Supports Node.js, Python, Java, Go, .NET, Ruby, and custom runtimes.

= Layers	
	- Reusable code libraries across functions.

= Provisioned Concurrency	
	- Keeps functions warm for consistent low latency.

= Versions & Aliases	
	- Manage multiple versions of a function.

= Environment Variables	
	- Store config secrets securely.

= VPC Support	
	- Access resources in your private VPC.

= IAM Roles	
	- Securely grant permissions to other AWS services.

= Destinations	
	- Route results to queues, topics, or other Lambdas.
	
= Security Components
	- IAM Roles & Policies
	- Resource-Based Policies
	- VPC Integration
	- AWS KMS


# -------------------------------------------------------------------------------------------------------------- #

Elastic Beanstalk – Orchestration

# -------------------------------------------------------------------------------------------------------------- #

Fargate – Containers

# -------------------------------------------------------------------------------------------------------------- #

Batch – Processing

# -------------------------------------------------------------------------------------------------------------- #

Outposts – On‑premises

# -------------------------------------------------------------------------------------------------------------- #

Wavelength – Edge

# -------------------------------------------------------------------------------------------------------------- #

App Runner – Microservices 

# -------------------------------------------------------------------------------------------------------------- #


# 1️⃣ EC2 — Virtualization
	Type: Virtual Machines (IaaS).
	Use: Provision and manage virtual servers.
	Key Point: Full OS control, flexible instance types.
	Use Cases: Web servers, custom apps, databases.

# 2️⃣ Lambda — Serverless
	Type: FaaS (Function as a Service).
	Use: Run code without managing servers.
	Key Point: Event-driven, pay-per-execution.
	Use Cases: APIs, data processing, automation.

# 3️⃣ Elastic Beanstalk — Orchestration
	Type: PaaS (Platform as a Service).
	Use: Deploy and scale web apps automatically.
	Key Point: Handles provisioning (EC2, Load Balancers, Auto Scaling).
	Use Cases: Fast app deployment with minimal ops.

# 4️⃣ Fargate — Containers
	Type: Serverless Containers.
	Use: Run containers without managing servers.
	Key Point: Works with ECS or EKS.
	Use Cases: Microservices, batch jobs, containerized apps.

# 5️⃣ Batch — Processing
	Type: Batch Computing.
	Use: Run batch processing jobs at any scale.
	Key Point: Automatically provisions compute resources.
	Use Cases: Data processing pipelines, rendering, big compute tasks.

# 6️⃣ Outposts — On-premises Hybrid
	- Type: Hybrid Cloud.
	- Use: Bring AWS services to your on-premises data center.
	- Key Point: Same APIs & tools as AWS region.
	- Use Cases: Low-latency apps, data residency, local processing.

# 7️⃣ Wavelength — Edge Computing
	T- ype: Edge.
	- Use: Bring AWS services closer to mobile/5G devices.
	- Key Point: Ultra-low latency for edge apps.
	- Use Cases: AR/VR, IoT, smart cars, real-time gaming.

# 8️⃣ App Runner — Microservices
	- Type: Fully Managed App Service.
	- Use: Run containerized web apps & APIs with auto-scaling.
	- Key Point: Build-and-run for microservices without infrastructure management.
	- Use Cases: Web apps, APIs, backends.


 
[ End Users & Devices ]
       ↓       
[ Wavelength ] — ultra-low latency at edge (5G)
       ↓       
[ Outposts ] — AWS services on-premises
       ↓       
[ App Runner ] — run containerized microservices
       ↓       
[ Lambda ] — run event-driven serverless code
       ↓
[ Fargate ] — run containers serverlessly
       ↓       
[ Batch ] — run batch processing jobs
       ↓       
[ Elastic Beanstalk ] — orchestrates app deployment (automatically managing and coordinating)
       ↓       
[ EC2 ] — base virtual servers


##################################################################################################################


Storage & Content Delivery

S3 – Object

EBS – Block

EFS – File

Glacier – Archival

FSx – Windows‑FS

CloudFront – CDN



[ Users Around The World ]
       ↓
   [ CloudFront CDN ] — delivers cached static/dynamic content fast
       ↓
[ S3 ] — store objects (web assets, backups, data lakes)
[ EBS ] — attach block storage to EC2 instances
[ EFS ] — shared file system for Linux apps
[ FSx ] — managed Windows file server
[ Glacier ] — archival, long-term cold storage



##################################################################################################################


## 🗄️ Database Services

RDS – Relational

Aurora – MySQL‑compatible

DynamoDB – NoSQL

Redshift – Data‑warehouse

Neptune – Graph

DocumentDB – Mongo‑compatible

QLDB – Ledger


# 1️⃣ RDS — Relational Database Service
	- Type: Relational.
	- Use: Managed SQL databases (MySQL, PostgreSQL, Oracle, SQL Server, MariaDB).
	- Key Point: Automated backups, patching, scaling.
	- Use Cases: OLTP apps, transactional workloads.

# 2️⃣ Aurora — MySQL/PostgreSQL-Compatible
	- Type: High-performance Relational.
	- Use: AWS’s own fully managed, cloud-native version of MySQL/PostgreSQL.
	- Key Point: Up to 5x faster than standard MySQL.
	- Use Cases: High-availability enterprise apps.

# 3️⃣ DynamoDB — NoSQL
	- Type: NoSQL (Key-Value & Document).
	- Use: Fully managed serverless NoSQL DB.
	- Key Point: Single-digit millisecond performance at scale.
	- Use Cases: Gaming, IoT, user sessions, shopping carts.

# 4️⃣ Redshift — Data Warehouse
	- Type: OLAP / Data Warehouse.
	- Use: Analyze huge datasets (petabytes) using SQL.
	- Key Point: Columnar storage, fast analytics.
	- Use Cases: BI, reporting, analytics dashboards.

# 5️⃣ Neptune — Graph Database
	- Type: Graph.
	- Use: Store and query highly connected data (nodes & edges).
	- Key Point: Supports Property Graph (TinkerPop) & RDF/SPARQL.
	- Use Cases: Social networks, fraud detection, recommendation engines.

# 6️⃣ DocumentDB — MongoDB-Compatible
	- Type: Document.
	- Use: Managed JSON document store.
	- Key Point: Compatible with MongoDB API.
	- Use Cases: Content management, catalog apps.

# 7️⃣ QLDB — Ledger Database
    - Type: Ledger.
	- Use: Immutable, cryptographically verifiable transaction log.
	- Key Point: Centralized blockchain-like audit trail.
	- Use Cases: Supply chain, financial systems, compliance logs.


[ Relational DBs ]
   ├─ [ RDS ] — general SQL (MySQL, PostgreSQL, Oracle, MariaDB, SQL Server)
   ├─ [ Aurora ] — AWS high-performance MySQL/PostgreSQL

[ NoSQL DBs ]
   ├─ [ DynamoDB ] — key-value & document
   ├─ [ DocumentDB ] — MongoDB-compatible

[ Specialized DBs ]
   ├─ [ Redshift ] — analytics data warehouse (OLAP)
   ├─ [ Neptune ] — graph database (relationships)
   ├─ [ QLDB ] — ledger with immutable audit trail



##################################################################################################################


Networking & Content Delivery

VPC – Isolation

Route 53 – DNS

API Gateway – REST

CloudFront – CDN

Direct Connect – Dedicated

VPN – Encrypted

Transit Gateway – Hub


[ On-Premises Network ]
   ├─ [ Direct Connect ] — dedicated line
   ├─ [ VPN ] — secure tunnel
           ↓
[ Transit Gateway ]
   ├─ Hub for connecting VPCs & on-prem
           ↓
[ VPC ] — isolated private network
           ↓
[ API Gateway ] — expose REST/WebSocket APIs
[ Route 53 ] — DNS resolution & routing
[ CloudFront ] — global content delivery & caching



##################################################################################################################


Security, Identity & Compliance

IAM – Authentication

KMS – Encryption

GuardDuty – Threat‑detection

Inspector – Vulnerability

Macie – Data‑discovery

Shield – DDoS

WAF – Firewall

Secrets Manager – Credentials


# 🔑 1️⃣ IAM — The Foundation
	- Where: Base layer for all access.
	- Protects: Who can sign in and what they can do.
	- On top of: Everything. IAM policies wrap around all AWS services.
	- ➡️ Example: IAM controls who can use KMS keys, manage GuardDuty findings, or update WAF rules.


# 🗝️ 2️⃣ KMS — Encryption Layer
	- Where: Wraps data at rest.
	- Protects: Encrypts storage (S3, EBS, RDS, backups).
	- Under: Used by Glue, Athena, Redshift, EC2, Lambda, etc.
	- Enforced by: IAM policies decide who can use keys.

# 🕵️ 3️⃣ GuardDuty — Continuous Watchdog
	- Where: Monitors your entire AWS account & network.
	- Protects: Detects unusual activity (e.g., compromised IAM keys).
	- On top of: CloudTrail, VPC Flow Logs, DNS Logs.
	- Feeds: Insights to SIEM or automated remediation.

# 🔍 4️⃣ Inspector — Vulnerability Lens
	- Where: Runs inside your compute layer (EC2, containers).
	- Protects: Finds OS/app vulnerabilities & misconfigurations.
	- On top of: Your workloads — scans your running instances.

# 🧩 5️⃣ Macie — Sensitive Data Lens
	- Where: Sits over S3 buckets.
	- Protects: Discovers & flags sensitive info (e.g., PII).
	- On top of: S3 — helps you decide where to encrypt tighter with KMS.

# 🛡️ 6️⃣ Shield — Network Edge
	- Where: Protects network-facing endpoints.
	- Protects: From DDoS attacks.
	- On top of: CloudFront, Route 53, Elastic Load Balancer.
	- Works with: WAF for deeper filtering.

# 🔥 7️⃣ WAF — Application Layer Firewall
	- Where: Frontline for web traffic.
	- Protects: HTTP/HTTPS requests (Layer 7).
	- On top of: API Gateway, CloudFront, ALB.
	- Works with: Shield for full edge protection.

# 🔐 8️⃣ Secrets Manager — Credential Vault
	- Where: Protects application secrets.
	- Protects: DB passwords, API keys.
	- Under: Your apps & Lambda functions — replaces hardcoded secrets.
	- IAM controls: Who can retrieve/update secrets.



| Service             | Purpose                  | Protects                |
| ------------------- | ------------------------ | ----------------------- |
| **IAM**             | AuthZ & AuthN            | Identities, permissions |
| **KMS**             | Encryption keys          | Data at rest            |
| **GuardDuty**       | Detect threats           | Accounts & workloads    |
| **Inspector**       | Find vulnerabilities     | EC2, containers         |
| **Macie**           | Classify sensitive data  | S3                      |
| **Shield**          | Block DDoS               | Public endpoints        |
| **WAF**             | Filter malicious traffic | Web apps                |
| **Secrets Manager** | Manage secrets           | Credentials & tokens    |





IAM : [AWS SERVICES]

	KMS : [S3, EBS, RDS, Backups]

	GuardDuty : [Cloud Trail, VPC Flow Logs, DNS Logs]

	WAF Rules : [CloudFront, ALB, API Gateway]

	Inspector : [EC2, Containers]

	Macie : [S3]

	SHIELD : [CloudFront, Route 53, Elastic Load Balancer]

	WAF : 

	SECRET MANAGER



[ Internet ]
   ↓
[ Shield ] + [ WAF ] — filter malicious traffic
   ↓
[ CloudFront / ALB ]
   ↓
[ App Servers (EC2, Lambda) ]
   ↓      ↘︎
[ Inspector ]   ↘︎ scans for vulnerabilities
[ IAM + Secrets Manager ] — secure who runs app & secrets
   ↓
[ Data in S3 / RDS ]
   ↓
[ KMS ] — encrypts stored data
   ↘︎
[ Macie ] — finds sensitive data in S3
   ↘︎
[ GuardDuty ] — watches entire account for threats




##################################################################################################################



Analytics & Streaming

Kinesis – Streaming

Athena – Query

Glue – ETL

Redshift – Warehouse

EMR – Hadoop

QuickSight – BI dashboard

DataPipeline – Scheduling 



✅ Full Data Pipeline Flow

1️⃣ Kinesis → S3

	Kinesis (Data Streams / Firehose) continuously collects real-time streaming data — e.g., IoT sensor data, app logs, clickstreams.

	Kinesis Data Firehose delivers this data automatically into S3 buckets in near real-time.

	Key point: Raw data lands securely in S3 for storage and further processing.


2️⃣ S3 → Glue

	The raw data in S3 often needs to be cleaned, transformed, and organized.

	Glue Crawlers scan S3 buckets to detect schema and create a Data Catalog (table metadata).

	Glue Jobs run ETL scripts (Python/Scala) to transform raw data — e.g., parsing JSON logs, filtering records, joining data 
	— then output processed data back to S3 in a structured format (e.g., Parquet).
	

3️⃣ S3 → Athena / Redshift

	Athena: Runs ad hoc SQL queries directly on the processed data in S3 using the Glue Data Catalog for schema definitions. 
	No infrastructure — fully serverless.

	Redshift: If the use case needs high-performance, complex analytics, 
	you load the cleaned data from S3 into Redshift (using COPY command, Glue jobs, or Redshift Spectrum).

	Redshift Spectrum: Even lets you query S3 directly from Redshift for blended warehousing.
	

4️⃣ Athena / Redshift → QuickSight

	QuickSight connects to Athena or Redshift as a data source.

	Users create interactive dashboards, charts, and reports based on the query results.

	Supports scheduled refreshes, secure sharing, and ML-powered insights.



Kinesis → S3 → Glue → Athena/Redshift → QuickSight



Stage		Service		Purpose	Connection
Ingest		Kinesis		Stream real-time data	Pushes data into S3
Store		S3		Durable storage	Landing zone for raw & processed data
Catalog & ETL	Glue		Discover, transform, prepare	Crawlers catalog S3 data, Jobs transform it
Query		Athena		Query in S3	Uses Glue Catalog as schema
Warehouse	Redshift	High-performance analytics	Loads S3 data for advanced SQL
Visualize	QuickSight	BI dashboards	Connects to Athena/Redshift



##################################################################################################################



Developer Tools & DevOps

CloudFormation – IaC

CDK – Code‑IaC 

CodeCommit – Git

CodeBuild – Build

CodeDeploy – Deploy

CodePipeline – CI/CD

X‑Ray – Tracing

SystemsManager – Management

CloudWatch – Monitoring 

CloudTrail – Auditing



# ################################################################################################################ #



## Machine Learning & AI


SageMaker – ML

Rekognition – Vision

Lex – Chatbot

Polly – Text‑Speech

Comprehend – NLP

Translate – Localization

Forecast – Time‑series

Personalize – Recommendation



# ################################################################################################################ #



Mobile, IoT & Edge

Cognito – Auth

API Gateway – REST

Device Farm – Testing

IoT Core – Messaging

Greengrass – Edge



##################################################################################################################



Media Services
Elastic Transcoder – Media‑encode

MediaConvert – Video‑transcode

MediaLive – Streaming



##################################################################################################################



Management & Governance
Organizations – Hierarchy

Config – Compliance

Trusted Advisor – Best‑practice

Control Tower – Landing‑zone

Service‑Quotas – Limits

Health – Status



##################################################################################################################



Business Applications
WorkSpaces – DaaS

AppStream 2.0 – App‑streaming

Chime – Meetings

WorkMail – Email

WorkDocs – Docs



##################################################################################################################



## Blockchain & Ledger

Managed Blockchain – Blockchain

QLDB – Ledger



##################################################################################################################



AR/VR
Sumerian – AR/VR



##################################################################################################################





##################################################################################################################





##################################################################################################################




##################################################################################################################





##################################################################################################################




Automated DevOps & CI/CD

Automate provisioning and deployment pipelines; 
use Infrastructure as Code 
(e.g., Terraform, CloudFormation).



##################################################################################################################















My Computer 
    |
    | HTTPS --- SSL (certificate) / TLS (handshake)
    | VPN --- OpneVPN, IPsec, WireGuard
    |
    v
Internet [HTTP/HTTPS]
    |
    | HTTP  [None - 80 - Plaintext]
    | HTTPS [SSL/TLS - 443 - Encrypted] 
    |
    v
VPN (Encrypted IPsec Tunnel)
    |
    |--- 50 connections > 2 tunnels per connection > Static/BGP
    |
    v
Direct Connect [Dedicated Network Connection]
    |
    |--- 50 connections
    |--- Speed: 1 Gbps to 100 Gbps
    |
    v
Amazon Route 53 - DNS
    |
    |--- Public DNS --> Web Apps
    |
    |--- Private DNS --> Internal Services
    |
    v
CloudFront [Edge Location]
    |
    v
Transit Gateway [Centralized Hub]
    |
    v
VPC - Route Tables [Controls routing of traffic] 
    | 
    |--- VPCs per account: 5
    |--- Subnets per VPC: 200
    |--- IP Address per VPC: 5,000 private IPs per subnet (default)
    |
    v
    Subnets
        |
        |--- Public Subnet 
        |     |
        |     |--- Network ACLs [Firewall - in and out]
        |     |
        |     |--- IGW [Internet Access] - (10.0.1.0/24)
        |     |
        |     |--- Load Balancers
        |     |
        |     |--- EC2 Instances - Security Groups [Firewall] - Elastic IP (EIP)
        |     |
        |     |--- EC2 Instances - Security Groups [Firewall] - Elastic IP (EIP)
        |
        |--- Private Subnet
        |     |
        |     |--- Network ACLs [Firewall - in and out]
        |     |
        |     |--- NAT [Internet Outbound Access] - (10.0.2.0/24)
        |     |
        |     |--- Load Balancers
        |     |
        |     |--- EC2 Instances - Security Groups [Firewall] - Elastic IP (EIP)
        |     |
        |     |--- EC2 Instances - Security Groups [Firewall] - Elastic IP (EIP)
    |
    v
VPC Peering [Connect VPCs]
    |
    v
VPC
    |
    v
    Subnets
        |
        |--- Public Subnet
        |     |
        |     |--- Network ACLs [Firewall - in and out]
        |     |
        |     |--- IGW [Internet Access]
        |     |
        |     |--- EC2 Instances - Security Groups [Firewall]
        |     |
        |     |--- EC2 Instances - Security Groups [Firewall]
        |
        |--- Private Subnet
        |     |
        |     |--- Network ACLs [Firewall - in and out]
        |     |
        |     |--- NAT [Internet Outbound Access]
        |     |
        |     |--- EC2 Instances - Security Groups [Firewall]
        |     |
        |     |--- EC2 Instances - Security Groups [Firewall]
    |
    v
VPC Endpoints
    |
    v
Flow Logs
    |
    v
Multicast Support
    |
    v
Bandwidth Control
    |
    v
CloudWatch
    |
    v
Geo Routing
    |
    v
Direct Connect [Inter-Region Peering]























Frontend: 
	EC2 + CloudFront
	S3 + CloudFront

Backend: 
	Lambda + API Gateway

Database: 
	Relational: RDS (MySQL, PostgreSQL, Oracle)
	NoSQL: DynamoDB or MongoDB

Auth: 
	Cognito

Monitoring: 
	CloudWatch

Security: 
	IAM + WAF

Messaging: 
	SNS/SQS





# AWS

REGIONS : 

	AVAILABILITY ZONES : [Minimum 3 per region]

		VPC: 

			PUBLIC SUBNET : [2]

			PRIVATE SUBNET : [2]





	AWS EDGE LOCATIONS




	CLOUD FRONT - CDN(CONTENT DELIVERY NETWORK) SERVICE




	LOCAL ZONE




	WAVELENGTH ZONE





	OUTPOST







AWS ACCOUNT
IAM
BILLING



AZ
EC2 RDS


REGION
DYNAMO-DB S3



ACCROSS REGION
ROUTE 53







AWS STORAGE - EBS vs S3 vs EFS


AMAZON ELASTIC BLOCK STORE
	- Block Storage
	- Must be Attached to EC2
	- Host File System 
  

AMAZON SIMPLE STORAGE
	- OBJECT STORAGE
	- Flat Structure
	- API Access to Data (HTTP/HTTPS)
	- 

AMAZON ELASTIC FILE SYSTEM
	- Shared File System
	- Mounted on EC2 / On-premises servers
	- Serves File System






37 + AWS REGIONS

115 + Direct Connect Locations










