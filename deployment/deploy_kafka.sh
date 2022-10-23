vm="vm109"

ssh st133@st133${vm}.rtb-lab.pl \
  "sudo mkdir -p /vol1/zk-data; sudo mkdir -p /vol2/zk-txn-logs; sudo mkdir -p /vol3/kafka-data;" \
  "sudo chown -R 1000:1000 /vol1/zk-data; sudo chown -R 1000:1000 /vol2/zk-txn-logs; sudo chown -R 1000:1000 /vol3/kafka-data;"

./deploy.sh "kafka-configuration" "vm109" "docker-compose"
