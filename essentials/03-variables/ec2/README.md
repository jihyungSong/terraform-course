# Step

## 1. 변수 설정
ec2.tfvars 파일 확인 
실행 환경에 맞게 변경  

```
# webserver.tfvars 파일

prefix = "<<PREFIX>>"
region = "<<REGION>>"

ami_id = "<<AMI_ID>>"
instance_type = "<<INSTANCE_TYPE>>"
keypair_name = "<<KEYPAIR_NAME>>"

```
* Prefix 는 알맞게 변경
* Region 은 본인이 사용할 region 코드로 변경
* AMI ID : Amazon Linux 2 AMI 의 UUID
* Instance Type : t2.micro
* Ec2 instance 에 설정할 keypair 명 설정


## 2. init  
Init 명령으로 Terraform 수행을 위한 provider plugin 초기화 및 다운로드 수행

```
terraform init
```

## 3. plan  
Plan 명령으로 Terraform 수행 전 실행 시뮬레이션 확인
```
terraform plan -var-file ec2.tfvars
```  

## 4. apply  
Apply 명령으로 Terraform 을 통한 Resource 생성 수행
```
terraform apply -var-file ec2.tfvars
```  

# Resource 삭제

## 1. destroy
Destroy 명령으로 생성된 VPC 삭제 수행
```
terraform destroy -var-file ec2.tfvars
```
