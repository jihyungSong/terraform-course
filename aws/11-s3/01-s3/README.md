# Info
Terraform VPC + S3 + EC2 Example

![](./img/11-s3-diagram.png)

#### S3
* S3 Bucket 생성 
* Bucket 생성 후 Sample 이미지 업로드 및 Public 설정


# Step

## 1. Terraform 실행

### 1) 변수 설정
s3.tfvars 파일 확인 
실행 환경에 맞게 변경

```
# s3.tfvars 파일

prefix              =       "<<YOUR_PREFIX>>"

```

* Prefix 는 알맞게 변경


### 2) Terraform init  
Init 명령으로 Terraform 수행을 위한 provider plugin 초기화 및 다운로드 수행

```
terraform init
```

### 4) Terraform plan  
Plan 명령으로 Terraform 수행 전 실행 시뮬레이션 확인
```
terraform apply --var-file=s3.tfvars
```  

### 5) Terraform apply  
Apply 명령으로 Terraform 을 통한 Resource 생성 수행
```
terraform apply --var-file=s3.tfvars
```  

## 3. Terraform 실행 내용 확인
* S3 Bucket 생성 여부 확인.


## 5. Bucket 에 Sample 이미지 업로드
웹서버에서 서비스될 Sample 이미지 파일을 Bucket에 업로드한다. 

### 1) Bucket 에 폴더 생성

생성된 Bucket 선택 -> Create Folder 클릭 -> Folder 명은 "img" 로 설정 후 Create 버튼 클릭
생성된 "img" 디렉토리로 이동

### 2) Sample 이미지 업로드

Sample 이미지 주소 : 

- - -

모든 작업이 완료되었으면, 02-ec2 로 이동하여 EC2 생성 코드를 수행해보자. [바로가기](../02-ec2)

- - - 


# Resource 삭제

*해당 삭제는 02-ec2 까지 완료한 이후 정리작업을 수행한다.*

### Terraform destroy
Destroy 명령으로 생성된 VPC 및 EFS 삭제 수행
```
terraform destroy --var-file=s3.tfvars
```
