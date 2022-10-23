name=$1
vm=$2
deploy_type=$3 # docker or docker-compose

echo ">>>>>>>>> Shutting down $name on $vm with ${deploy_type}..."

if [ ${deploy_type} = "docker" ]
then
  ssh st133@st133${vm}.rtb-lab.pl "sudo docker stop ${name};"
else
  ssh st133@st133${vm}.rtb-lab.pl "cd code/${name} ; sudo docker-compose down;"
fi
