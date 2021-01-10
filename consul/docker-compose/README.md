# Infer tests, mocks & observability from traffic with UP9, Consul & Docker-Compose

This repo demonstrates how to create traffic-inferred tests, contracts, observability and more that represent real-life application behavior. 

The repo includes:
* A demo microservice app (WeaveSock) 
* HashiCorp Consul configuration file 

## Requirements 
* An UP9 account - If you don't have one already, you can sign up for free here: https://up9.app/signup
* UP9 CLI installed - `npm install -g up9`
* Docker-compose installed

## Context
UP9 uses only Envoy configuration to subscribe and unsubsribe to traffic events. Once Envoy (which is running as part of Consul) runs with the provided configuration, UP9 can observe traffic and infer numerous artifacts including tests, contracts, mocks and observability.

## Steps

* Log in to your UP9 account on https://up9.com/.
* Authenticate your UP9 CLI - In your terminal window - `up9 auth:login`
* Create the nessesary Envoy configuration files: `up9 tap:create-docker-compose-consul 19001 default`
* Run `docker-compose -f docker-compose.yaml -f docker-compose-up9.yaml up`
