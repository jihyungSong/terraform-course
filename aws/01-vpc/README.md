# Info
* Terraform VPC Example


# Step
1. 변수 설정
vpc.tfvars 파일 확인 
실행 환경에 맞게 변경  

```
prefix      =       "test"
region      =       "us-east-1"
vpc_cidr    =       "10.0.0.0/16"
```

1. init  
명령실행은 해당 디렉토리에서 실행  

```
terraform init
```

2. plan  
```
terraform apply --var-file=vpc.tfvars
```  

3. apply  
```
terraform apply --var-file=vpc.tfvars
```  

3. 실행 내용 확인

선택한 Region 에 VPC 생성된 내용 확인 

3. destroy
```
terraform destroy --var-file=vpc.tfvars
```