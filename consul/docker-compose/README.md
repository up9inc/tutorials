# Using Consul and UP9, to infer test-suites from traffic with Docker-Compose

This repo has an example showing how to automaticaly create tests, contracts, observability and more that are inferred from traffic and represent real-life application behavior. 

The repo includes all of the services and configuration files required to run the demo microservice app (WeaveSock) with HashiCorp Consul as a Service Mesh. 

If you'd like to see the demo app running and Consul in action, simply - run `docker-compose up` in the repo folder. The repo doesn't include any configuration related to UP9.


## Requirements 
* An UP9 account - If you don't have one already, you can sign up for free here: https://up9.app/signup
* UP9 CLI installed - `npm install -g up9`

# Context
UP9 uses Envoy configuration to subscribe and unsubsribe to traffic events. Once Envoy (which is running as part of Consul) runs with the provided configuration, UP9 can observe traffic and infer numerous artifacts including tests, contracts, mocks and observability.

## Steps

* Log in to your UP9 account on https://up9.com/.
* Authenticate your UP9 CLI - In your terminal window - `up9 auth:login`
* Create the nessesary Envoy configuration files: `up9 tap:create-docker-compose-consul 19001 <give-it-a-name>`
* Run `docker-compose -f docker-compose.yaml -f docker-compose-up9.yaml up`

### NOTES: 
When configuring tapping - 
* please tap following services - carts, catalogue, front-end, orders, payment, shipping, user
* please don't tap edge-router, db and rabbitmq services
* when asked for Consul address - use 10.20.0.2
