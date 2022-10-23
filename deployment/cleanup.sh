vm=$1

echo ">>>>>>>>> Cleaning up $vm..."

echo "Destroying docker containers in $vm"
ssh "st133@st133${vm}.rtb-lab.pl" \
  "sudo docker rm --force \$(sudo docker ps -a -q) ;" \
  "sudo docker volume rm \$(sudo docker volume ls -q) ;" \
  "echo 'Removing code in $vm' ;" \
  "rm -rf code ;" \
  "echo 'Removing remaining directories in $vm' ;" \
  "sudo rm -rf /vol1/zk-data/* ;" \
  "sudo rm -rf /vol2/zk-txn-logs/* ;" \
  "sudo rm -rf /vol3/kafka-data/* ;" \
  "sudo rm -rf /vol4/mongo-data/* ;"