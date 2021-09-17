# Info
Terraform VPC + EC2 with EFS Example

![](./img/10-efs-diagram.png)

#### VPC
* VPC CIDR 은 10.0.0.0/16 
* Subnet CIDR 은 10.X.0.0/24 
* Subnet 은 본인이 선택한 Region 의 Availability Zone 수 만큼 생성 (ex. us-east-1 -> 4 Availability Zones -> 4 Subnets)
* 각 Availability Zone 별로 Public Subnet, Private Subnet 페어로 한개씩 존재하도록 생성
* Internet Gateway 생성 후 VPC 에 Attach
* Route Table 은 Public 과 Private Route Table 한개씩 총 2개 생성
* Public Route Table 은 Internet Gateway 로 통신 가능하도록 Route 추가 후 Public Subnet 4개와 연결 (Associatation)
* Private Route Table 은 Route 추가 없이 Private Subnet 4개와 연결 (Associatation)
* NAT Gateway 용 EIP 생성
* Public Subnet 에 NAT Gateway 생성
* Private Route Table 에 외부 통신을 위해서 NAT Gateway 로 통신 가능하도록 Route 추가
* SSH 허용을 위한 Admin 용 Security Group 과 HTTP 웹 접속 허용을 위한 Web Security Group, EFS 통신을 위한 EFS Security Group 총 세개의 Security Group 생성
* Admin Security Group 에는 SSH(20) 포트를 본인 Cloud9 Public IP 허용하는 Rule 생성
* Web Security Group 에는 HTTP(80) 포트를 모두 허용 하는 Rule 생성
* EFS Security Group 에는 NFS 통신을 위한 TCP(2049) 포트 허용하는 Rule 생성
* 각 Resource 를 생성하는 코드를 모두 Module 로 제작
 
#### EFS
* EFS Filesystem 생성 
* 각 Subnet 마다 Mount Target 생성 후 EFS Security Group 적용

#### EC2 with EFS
* Instance 에 EFS Filesystem 사용 설정 완료된 AMI 이미지 제작
    * NFS 마운트
    * Nginx 웹서버 설치 및 설정
    * 마운트된 디렉토리에 HTML index 파일 생성
    * 위 설정이 완료된 Instance 를 AMI 로 생성
* 각 Public Subnet 에 위에서 생성한 AMI 로 EC2 Instance 배포


# Step

Terraform 코드를 두번으로 나누어 각각 실행한다. 
* [01-efs](./01-efs) : VPC 및 네트워킹 생성, EFS 생성 모듈 포함
* [02-ec2](./02-ec2): EC2 배포 모듈 포함

먼저 01-efs 디렉토리로 이동하여 Terraform 실행 수행.  
VPC 와 EFS 파일 시스템이 준비되면, 해당 VPC 에서 AMI 생성 작업.  
AMI 생성이 완료되면, 02-ec2 디렉토리로 이동하여 Terraform 실행 수행.
