# Info
* Terraform VPC Example

![](./01-vpc-diagram.png)

* VPC CIDR: 10.0.0.0/16 


# Step

## 1. 변수 설정
vpc.tfvars 파일 확인 
실행 환경에 맞게 변경  

```
# vpc.tfvars 파일

prefix      =       "test"
region      =       "us-east-1"
vpc_cidr    =       "10.0.0.0/16"
```
* Prefix 는 알맞게 변경
* Region 은 본인이 사용할 region 코드로 변경

## 2. init  
Init 명령으로 Terraform 수행을 위한 provider plugin 초기화 및 다운로드 수행

```
terraform init
```

## 3. plan  
Plan 명령으로 Terraform 수행 전 실행 시뮬레이션 확인
```
terraform apply --var-file=vpc.tfvars
```  

## 4. apply  
Apply 명령으로 Terraform 을 통한 Resource 생성 수행
```
terraform apply --var-file=vpc.tfvars
```  

## 5. 실행 내용 확인
선택한 Region 에 VPC 생성된 내용 확인 


# Resource 삭제

## 1. destroy
Destroy 명령으로 생성된 VPC 삭제 수행
```
terraform destroy --var-file=vpc.tfvars
```
