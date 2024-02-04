# Instalación de Cluster Kubernetes usando Talos Linux

## Referencia
* https://www.virtualizationhowto.com/2024/01/proxmox-kubernetes-install-with-talos-linux/

## Descarga de imagen de Talos
Descarga desde [las release talos](https://github.com/siderolabs/talos/releases) el fichero metal-amd64.iso (para intel o amd)
## Instala el talos CTL
```shell
curl -sL https://talos.dev/install | sh
```
## Creación de máquinas virtuales
Con el sistema virtualización que tú quieras, mientras que las VM's tengan visión entre ellas.
Por ejemplo en VirtualBox usa la red Adaptador Puente.
Una máquina la dejarás para el control plane y otra para worker por ejemplo.
Requisitos mínimos:
2 cores
2 GB Ram
10 GB disco
ISO de arranque -> metal-amd64.iso

## Copia el fichero .env.example a .env
cp .env.example .env
## Arranque de la vm de control plane
Arranca esa máquina y verás que ofrece el resumen de uso.
Fíjate en la IP y modifica el .env para cambiar el CONTROL_PLANE_IP a esa IP
```shell
source .env
```
## Ejecuta la generación de la configuración
```shell
./00_create_config.sh
```
## Ejecuta aplicación de la configuración al nodo controlplane
```shell
./01_apply_control_plane.sh
```
## Comprueba que el control plane se ha creado correctamente
Comprueba que el Kubelet está en Healthy y el Stage en Booting
## Arranca el cluster
```shell
./02_bootstrap_cluster.sh
```
## Comprueba que el cluster se ha creado correctamente
Kubelet en Healthy, Stage en Running, APISERVER en Healthy y Ready en True 
## Pilla la configuración de kubectl del cluster
```shell
./03_get_kubeconfig.sh
```
## Comprueba que ves el nodo con kubectl

```shell
./04_get_nodes.sh
```
## Arranca la máquina de worker
Pilla la ip de Worker del resumen que te da talos, modifica el fichero .env, 
para meter la ip del worker en la línea del WORKER_IP
```shell
source .env
```
## Cambiar el hostname del worker
Modifica el fichero w.yaml para poner el nombre de host que tú quieras al worker 
```shell
./05_change_hostname.sh
```
## Aplica los cambios al worker 
```shell
./07_apply_worker.sh
```

## Comprueba que ves los nodos con kubectl
```shell
./04_get_nodes.sh
```
