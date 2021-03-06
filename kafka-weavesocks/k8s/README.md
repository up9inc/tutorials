# UP9 / Microservices / Kafka Demo Environment 

This repository includes:
- Installing a demo microservices application (Weavesock), on a Kubernetes cluster
- A quick tutorial of how to use UP9

## Prerequisites
- Minikube and Helm
- UP9 CLI and an UP9 account

See the sections below how to install and set up the prerequisites

# Deploy the Demo Application (Weavesock)

```bash
kubectl apply -f . -n sock-shop
```

Wait until the cluster is fully running before continuing. The Kafka pod will restart 2-5 times, don't worry about it.

```bash
kubectl get pods -A
```

## Test the Application
To access the front-end of the application:

Use the following command to identify the cluster IP:
```bash
minikube ip
<cluster-ip>
```
Use the IP on any browser: http://\<cluster-ip\>:30007 **(\<cluster-ip\> is the result of using the `minikube ip` command)**

![alt text](assets/working.png "Title")

If the browser is refusing to connect, check to see if the cluster is running. If you've allocated enough memory and CPUs and give enough time for the cluster to run, you should see the application.

## Install UP9 on the Demo Application
In your UP9 dashboard (https://up9.app), create a new workspace and select the prefered installation method.

![UP9 installation by Helm](assets/helm.png)
Please make sure you choose the correct Helm version, copy this text, and run it in your terminal window.

### Select Namespaces or Services 
A few seconds after your pods are running, your browser screen should change, asking you to select the namespaces or services that UP9 will observe, listening to their traffic.
Select: `sock-shop` and follow the on-screen instructions

UP9 works by observing traffic. To generate traffic, you can simply use the application, but we recommend running a small load test: 

```bash
$ kubectl apply -R -f job/.
```
That's it UP9 is installed

# Installing and Setting Up the Prerequisite

## Install Minikube and Helm

If you already have a Minikube or a Kubernetes cluster you can skip the part about downloading and installing Minikube in your local environment. 

### Pre-requisites: Installing Minikube and Helm
In this tutorial we are using Helm and Minikube. If you don't have these installed already, follow the instructions in the next paragraph.
#### MacOS
```bash
$ brew install minikube helm
```
#### Other OSs
Install Minikube: https://minikube.sigs.k8s.io/docs/start/
Install HELM: https://helm.sh/docs/intro/install/ 

### Starting Minikube
Here's an example how to start Minikube:
```bash
$ minikube start --driver=hyperkit --memory=16384 --cpus=4 --disk-size=100g
```

## Install UP9

**Brew:**
```bash
$ brew tap up9inc/brew && brew install up9
```
**NPM:**
```bash
$ npm i -g up9
```
If you don't have an account in UP9, sign up to get an account here: https://up9.app/signup. Having an UP9 account is immediate and free.

```bash
$ up9 auth:login
```
