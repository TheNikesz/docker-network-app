# Utworzenie kontenera T1
docker run -itd --name T1 alpine

# Utworzenie bridge1
docker network create -d bridge --subnet 10.0.10.0/24 bridge1

# Utworzenie T2
docker run -itd --name T2 -p 80:80 -p 10.0.10.0:8000:8000 nginx

#  Podlaczenie T2 do bridge1
docker network connect bridge1 T2

# Utworzenie D1 i podlaczenie go do bridge1 oraz nadanie mu aliasu host1
docker run -itd --name D1 --network-alias host1 --net bridge1 --ip 10.0.10.254 alpine

# Utworzenie bridge2
docker network create -d bridge bridge2

# Pozowolenie na bezposrednia komunikacje pomiedzy bridge2 i hostem macierzystym
iptables -A FORWARD -i bridge2 -o enp0s3 -j ACCEPT

# Utworzenie D2, dodanie mu aliasu apa1 i podlaczenie go do bridge1
docker run -itd --name D2 --network-alias apa1 --net bridge1 -p 10.0.10.0:8080:8080 -p 10.0.2.15:8081:8081 httpd

# Podlaczenie D2, dodanie mu aliasu apa2 do bridge2
docker network connect bridge2 --alias apa2 D2

# Utworzenie i podlaczenie S1 do bridge2 oraz nadanie mu aliasu host2
docker run -itd --name S1 --network-alias host2 --net bridge2 ubuntu