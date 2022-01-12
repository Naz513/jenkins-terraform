echo '********** Yum Update **********'
sudo yum update -y
echo '********** fetching jenkins.repo **********'
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
echo '********** getting jenkins key **********'
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
echo '********** yum upgrade **********'
sudo yum upgrade -y
echo '********** amazon-linux **********'
sudo amazon-linux-extras install epel -y
echo '********** yum update **********'
sudo yum update -y
echo '********** install jenkins **********'
sudo yum install jenkins java-1.8.0-openjdk-devel -y
echo '********** run systemctl commands **********'
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl status jenkins
sleep 30
echo '************************************'
echo '********** Admin Password **********'
echo '************************************'
sudo cat /var/lib/jenkins/secrets/initialAdminPassword