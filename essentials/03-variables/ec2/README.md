# Step

## 1. init  
Init 명령으로 Terraform 수행을 위한 provider plugin 초기화 및 다운로드 수행

```
terraform init
```

## 2. plan  
Plan 명령으로 Terraform 수행 전 실행 시뮬레이션 확인
```
terraform plan -var-file ec2.tfvars
```  

## 3. apply  
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
