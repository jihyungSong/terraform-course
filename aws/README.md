# Info
Terraform with AWS 실습

#### Contents

#### 1. VPC
VPC 생성 예제.  
[VPC 실습 바로가기](./01-vpc)

#### 2. Subnet
Subnet 생성 예제.  
Public 과 Private 으로 나뉘어 생성.  
[Subnet 실습 바로가기](./02-subnet)

#### 3. Internet Gateway
Internet Gateway 생성 예제.  
VPC 의 외부 통신을 위한 Internet GW 생성.  
[Internet Gateway 실습 바로가기](./03-internet-gw)

#### 4. Route Table
Route Table 생성 예제.  
Public Subnet 과 Private Subnet 의 별도 네트워크 경로 설정.  
[Route Table 실습 바로가기](./04-route-table)

#### 5. NAT Gateway
NAT Gateway 생성 예제.  
Private Subnet 의 외부 통신을 위한 NAT GW 생성.  
[NAT Gateway 실습 바로가기](./05-nat-gw)

#### 6. Security Group
Security Group 생성 예제.  
SSH 접속과 Web 접속을 위한 Security Group 설정.  
[Security Group 실습 바로가기](./06-security-group)

#### 7. Modules
1~6 번 과정에서 작성한 Terraform Configuration 구현을 Module 형식으로 변경 실습 예제.  
[Modules 실습 바로가기](./07-modules)

#### 8. EC2
EC2 Instance 생성 예제.  
위에서 생성한 VPC 의 각 Subnet 에 EC2 Instance 배포.  
[EC2 실습 바로가기](./08-ec2)

#### 9. EBS
EBS(Elastic Block Store) 생성 예제.  
EC2 와 함께 EBS 데이터 볼륨 배포 및 웹 서비스 설정 AMI 생성.  
[EBS 실습 바로가기](./09-ebs)

#### 10. EFS
EFS(Elastic File System) 생성 예제.  
EFS 의 File System 과 Mount Target 생성 및 EC2 와 연결 설정 AMI 생성.  
[EFS 실습 바로가기](./10-efs)

#### 11. S3
S3(Simple Storage Service) 생성 예제.  
S3 Bucket 과 샘플 이미지 Object 업로드 및 EC2 웹서버와 연동.  
[S3 실습 바로가기](./11-s3)

#### 12. ALB
ALB (Application Load Balancer) 생성 예제.  
각 Subnet 에 웹서버가 설정된 AMI를 통해 EC2 Instance 배포 후, ALB - Target Group 연결 설정.  
[ALB 실습 바로가기](./12-alb)

#### 13. Auto Scaling Group
Auto Scaling Group 생성 예제.  
웹서버가 설정된 AMI 로 설정된 Launch Template 설정.   
Launch Template 과 ALB 를 활용한 Auto Scaling Group 배포.  
[Auto Scaling Group 실습 바로가기](./13-auto-scaling-group)

