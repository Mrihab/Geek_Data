export ENVIRONMENT=$1

usage() {
    echo "Usage:  $0 <ENVIRONMENT>"
    exit 1
}

if [ $# -ne 1 ]
then
    usage
fi

echo ""
echo "Deploy Tomcat with Ansible"
ansible-playbook --extra-vars="env=${ENVIRONMENT}" /data/tomcat_deploy.yml


echo "Check java"
ps -ef | grep java

echo "Check tomcat status"
service tomcat9 status


echo "check page"
curl http://localhost:8080/sample/

echo "Check tomcat logs"
cat /var/log/tomcat8/catalina.out
