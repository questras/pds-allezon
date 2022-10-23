./shutdown.sh "load-balancing-configuration" "vm110" "docker"

# Databases
./shutdown.sh "kafka-configuration" "vm109" "docker-compose"
./shutdown.sh "redis-configuration" "vm108"  "docker"
./shutdown.sh "mongo-configuration" "vm107" "docker-compose"

# Services
./shutdown.sh "user-tags" "vm101" "docker"
./shutdown.sh "user-profiles" "vm102" "docker"
./shutdown.sh "statistics" "vm103" "docker"
