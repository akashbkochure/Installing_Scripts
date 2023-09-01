# Installation-Kubernetes
#Mise à jour 
sudo apt-get update 
#Installation du paquet transport 
https sudo apt-get install -y apt-transport-https 
#Installation de docker 
sudo apt install -y docker.io 
sudo systemctl start -y docker sudo systemctl enable -y docker  
#Installation du paquet Curl 
sudo apt-get install -y curl 
#On utilise curl pour installer un paquet depuis un URL, une clé qu'on ajoute ensuite avec la commande add 
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpd | sudo apt-key add 
#On sauvegarde un fichier nommé kubernetes.list contenant deb https://... etc 
sudo echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list 
#Mise à jour des paquets 
sudo apt-get update
#On installe les components de Kubernetes 
sudo apt-get install -y kubelet kubeadm kubectl kubernetes-cni 
#ON initialise la node master après avoir désactivé le swap sur les autres devices sudo swapoff -a sudo kubeadm init 
#On copie les commandes suivantes pour démarrer notre cluster 
mkdir -p $HOME/.kube 
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config 
sudo chown $(id -u):$(id -g) $HOME/.kube/config  
#On récupère les nods puis les appliquent 
sudo kubetcl apply -f https://raw;githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml 
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml 
sudo kubectl get pods --all-namespaces 
sudo apt-get update
