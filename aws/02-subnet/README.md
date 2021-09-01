# Info
* Terraform VPC Subnet Example
![](./02-subnet-diagram.png)

# Step

## 1. 변수 설정
subnet.tfvars 파일 확인 
실행 환경에 맞게 변경  

```
# subnet.tfvars 파일

prefix              =       "test"
region              =       "us-east-1"
vpc_cidr            =       "10.0.0.0/16"

public_subnets      =       [
    {cidr = "10.0.1.0/24", availability_zone = "us-east-1a"},
    {cidr = "10.0.2.0/24", availability_zone = "us-east-1b"},
    {cidr = "10.0.3.0/24", availability_zone = "us-east-1c"},
    {cidr = "10.0.4.0/24", availability_zone = "us-east-1d"},
]

private_subnets = [
    {cidr = "10.0.11.0/24", availability_zone = "us-east-1a"},
    {cidr = "10.0.12.0/24", availability_zone = "us-east-1b"},
    {cidr = "10.0.13.0/24", availability_zone = "us-east-1c"},
    {cidr = "10.0.14.0/24", availability_zone = "us-east-1d"},
]
```

## 2. init  
Init 명령으로 Terraform 수행을 위한 provider plugin 초기화 및 다운로드 수행

```
terraform init
```

## 3. plan  
Plan 명령으로 Terraform 수행 전 실행 시뮬레이션 확인
```
terraform apply --var-file=subnet.tfvars
```  

## 4. apply  
Apply 명령으로 Terraform 을 통한 Resource 생성 수행
```
terraform apply --var-file=subnet.tfvars
```  

## 5. 실행 내용 확인
선택한 Region 에 VPC 생성된 내용 확인 


# Resource 삭제

## 1. destroy
Destroy 명령으로 생성된 VPC 삭제 수행
```
terraform destroy --var-file=subnet.tfvars
```
