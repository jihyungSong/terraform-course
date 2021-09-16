# Info
Terraform VPC + EC2 with EBS instance Example

![](./img/09-ebs-diagram.png)

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
* SSH 허용을 위한 Admin 용 Security Group 과 HTTP 웹 접속 허용을 위한 Web Security Group, 총 두개 Security Group 생성
* Admin Security Group 에는 SSH(20) 포트를 본인 Cloud9 Public IP 허용하는 Rule 생성
* Web Security Group 에는 HTTP(80) 포트를 모두 허용 하는 Rule 생성
* 각 Resource 를 생성하는 코드를 모두 Module 로 제작
 

#### EC2 with EBS Volume
* Instance 에 Volume 사용 설정 완료된 AMI 이미지 제작
    * 추가 Volume 사용을 위한 파일시스템 포맷 및 마운트
    * Nginx 웹서버 설치 및 설정
    * 추가 Volume 이 마운트된 디렉토리에 HTML index 파일 생성
    * 위 설정이 완료된 Instance 와 EBS 볼륨 모두 스냅샷 + AMI 생성
* 각 Public Subnet 에 미리 제작된 AMI 를 사용하여 EC2 Instance 와 EBS Volume 배포.
* EC2 Instance 마다 EBS 데이터 Volume 생성후 Attach
* 각 EC2 Instance 생성 후, User data 를 통해 index.html 테스트 웹 파일에 추가 정보 append

# Step

## 1. AMI 생성
인스턴스에 EBS 가 실제 사용 가능 환경을 갖추려면, OS 설정이 필요.
OS 설정이 추가된 AMI 이미지를 생성 후 배포.  

### 1) AMI 를 만들기 위해서 먼저 인스턴스를 배포한다.  

** Instance 정보**
* 이미지 : Ubuntu 20.04
* Instance Type: t2.micro (or t2.small)
* Network : Default VPC
* Storage: 10GB 크기의 gp3 EBS 볼륨 추가. Device(/dev/sdb). Delete on Termination 체크
* Tags : Name 지정

### 2) Instance 접속

초기 접속시에는 ubuntu 라는 유저.  
OS 설정 작업의 편의성을 위해 root 로 전환
```
> sudo su - 
```

### 3) data volume (xvdb) attach 확인

```
> lsblk
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
loop0     7:0    0 33.3M  1 loop /snap/amazon-ssm-agent/3552
loop1     7:1    0 55.5M  1 loop /snap/core18/1997
loop2     7:2    0 70.4M  1 loop /snap/lxd/19647
loop3     7:3    0 32.3M  1 loop /snap/snapd/11588
xvda    202:0    0    8G  0 disk 
└─xvda1 202:1    0    8G  0 part /
xvdb    202:16   0   10G  0 disk 
```

### 4) Block device 포맷

파일 시스템 xfs 로 생성

```
> sudo mkfs -t xfs /dev/xvdb
meta-data=/dev/xvdb              isize=512    agcount=4, agsize=655360 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=1, sparse=1, rmapbt=0
         =                       reflink=1
data     =                       bsize=4096   blocks=2621440, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
log      =internal log           bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
```

### 5) Mount 할 디렉토리 생성 

```
> mkdir /data
```

### 6) Filesystem Mount 

```
> sudo mount /dev/xvdb /data
```

마운트 된 내역 확인.  

```
> df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       7.7G  1.3G  6.5G  17% /
devtmpfs        484M     0  484M   0% /dev
tmpfs           490M     0  490M   0% /dev/shm
tmpfs            98M  788K   98M   1% /run
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs           490M     0  490M   0% /sys/fs/cgroup
/dev/loop0       34M   34M     0 100% /snap/amazon-ssm-agent/3552
/dev/loop2       71M   71M     0 100% /snap/lxd/19647
/dev/loop1       56M   56M     0 100% /snap/core18/1997
/dev/loop3       33M   33M     0 100% /snap/snapd/11588
tmpfs            98M     0   98M   0% /run/user/1000
/dev/xvdb        10G  104M  9.9G   2% /data
```


### 7) /etc/fstab 에 파일시스템 마운트 저장

xvdb 블럭 디바이스의 UUID 확인
```
> sudo blkid
/dev/xvda1: LABEL="cloudimg-rootfs" UUID="e8070c31-bfee-4314-a151-d1332dc23486" TYPE="ext4" PARTUUID="5198cbc0-01"
/dev/loop0: TYPE="squashfs"
/dev/loop1: TYPE="squashfs"
/dev/loop2: TYPE="squashfs"
/dev/loop3: TYPE="squashfs"
/dev/xvdb: UUID="28e8e1d8-943d-4a5f-9232-276c48c9e428" TYPE="xfs"
```

/etc/fstab 내용 편집
```
> sudo vim /etc/fstab

LABEL=cloudimg-rootfs   /        ext4   defaults,discard        0 1
UUID=28e8e1d8-943d-4a5f-9232-276c48c9e428  /data  xfs  defaults,nofail  0  2
```

umount 명령으로 현재 마운트된 것 언마운트
```
> umount /data
```

mount 명령을 통해 다시 재 마운트 시행.  
/etc/fstab 에 작성 내역이 정상이면 마운트 동작 이상 없이 될 것.
```
> mount -a
```

### 8) nginx 웹서버 설치

아래 명령을 순서대로 입력
```
> sudo apt update -y
> sudo apt install -y nginx
> sudo systemctl start nginx
> sudo systemctl enable nginx
```


### 9) 웹서버 html 기본 디렉토리를 /data 디렉토리로 변경

sites-enabled/default 파일 변경
```
> vim /etc/nginx/sites-enabled/default

# sites-enabled/default

server {
    ...
    
    # root /var/www/html; -> 해당 부분 주석 처리 후 변경
    root /data/html;
    ...
}
```

### 10) /data 디렉토리에 기본 index.html 파일 생성
```
> cd /data
> mkdir html
> cd html
```


```
vim index.html

<h1>Hello!</h1>
```

### 11) nginx 재부팅
```
> systemctl restart nginx
```

nginx 서버 동작 확인

```
> systemctl status nginx
```

### 12) 웹브라우저 접속시 정상 작동 확인

해당 인스턴스의 Public IP 를 복사해 웹브라우저에서 접속 여부 확인.

  
### 13) AMI 생성 

Instance 선택 -> Actions -> Image and Templates -> Create Image

### 14) AMI 로 Instance 배포 확인

AMI 선택 -> Actions -> Launch  

Launch 시, Instance 생성 화면으로 전환.  

Instance Type, Tags 등을 설정 후 배포.  
배포 후 브라우저 접속하여 웹페이지 정상 서비스 확인.  


## 2. Terraform 실행

### 1) 변수 설정
ebs.tfvars 파일 확인 
실행 환경에 맞게 변경

```
# ebs.tfvars 파일

prefix              =       "test"
region              =       "us-east-1"
vpc_cidr            =       "10.0.0.0/16"

public_subnets      =       [
    {cidr = "10.0.1.0/24", availability_zone = "us-east-1a"},
    {cidr = "10.0.2.0/24", availability_zone = "us-east-1b"},
    {cidr = "10.0.3.0/24", availability_zone = "us-east-1c"},
    {cidr = "10.0.4.0/24", availability_zone = "us-east-1d"},
]

private_subnets     =       [
    {cidr = "10.0.11.0/24", availability_zone = "us-east-1a"},
    {cidr = "10.0.12.0/24", availability_zone = "us-east-1b"},
    {cidr = "10.0.13.0/24", availability_zone = "us-east-1c"},
    {cidr = "10.0.14.0/24", availability_zone = "us-east-1d"},
]

admin_access_cidrs      =   ["<<YOUR_LOCAL_IP_CIDR>>"]

ami_id                  =   "<<AMI_ID>>"
data_vol_snapshot_id    =   "<<DATA_VOLUME_SNAPSHOT_ID>>"

instance_type           =   "t3.micro"
keypair_name            =   "<<YOUR_KEYPAIR_NAME>>"
data_volume_size        =   "15"


```
* Prefix 는 알맞게 변경
* Region 은 본인이 사용할 region 코드로 변경
* Subnet 의 Availability Zone 값은 Region 에 맞게 변경
* SSH 접속 허용할 IP 값 변경
* EC2 instance 의 AMI 와 추가 데이터 볼륨 생성을 위한 Snapshot ID 설정
* EC2 instance 에 설정할 keypair 명 설정
* 데이터용 EBS 볼륨 사이즈 설정


### 2) Terraform init  
Init 명령으로 Terraform 수행을 위한 provider plugin 초기화 및 다운로드 수행

```
terraform init
```

### 4) Terraform plan  
Plan 명령으로 Terraform 수행 전 실행 시뮬레이션 확인
```
terraform apply --var-file=ebs.tfvars
```  

### 5) Terraform apply  
Apply 명령으로 Terraform 을 통한 Resource 생성 수행
```
terraform apply --var-file=ebs.tfvars
```  

## 3. Terraform 실행 내용 확인
* 선택한 Region 에 VPC, Subnet, Internet Gateway, Route Table, NAT Gateway, Security Group, instance 생성 내용 확인.  
* Instance 에 EBS 볼륨 Attach 상태 확인.   
* 생성된 Instance 에 웹서버 설치 확인. Instance 의 Public IP(또는 Public DNS) 로 브라우저에서 테스트 페이지 접속 확인. 


# Resource 삭제

### Terraform destroy
Destroy 명령으로 생성된 EC2 Instance, EBS 볼륨 및 VPC 삭제 수행
```
terraform destroy --var-file=ebs.tfvars
```
