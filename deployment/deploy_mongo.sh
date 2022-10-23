vm="vm107"

ssh st133@st133${vm}.rtb-lab.pl \
  "sudo mkdir -p /vol4/mongo-data ;" \
  "sudo chown -R 1000:1000 /vol4/mongo-data ;"

./deploy.sh "mongo-configuration" "vm107" "docker-compose"
