OBSERVABILITY
INTRO TO OBSERVABILITY

observability is the abilit to understand and measure the state of a system
based on data generated by the system.


 
Observality allows you generate actionable outputs from unexpected scenarios
in dynamic environments.

BENEFITS:

﻿﻿better insights on the internal processes on your system or application.
﻿﻿makes trouble shooting easier.
﻿﻿detects hard problems.
This helps us understands the internal processes of our system.
In a microservice environment,the need for observabilty is very much needed 
because unlike a monolith service, it's easier to detect and troubleshoot 
problems because all components are in a single application or system,but 
in a microservice environment where application components are seperated, 
Observability plays a vital role in keeping eye on each component of our
microservices. when it comes to troubleshooting, we will not only want to 
know why our application entered a specific state,what component is 
responsible and how can we avoid this certain situation in the future. 
It gives us the flexibility of understanding about unpredictable events.

observability have three components:

logging: records of series of events in an application or system. logs come
with two components:
timestamp of the event.
information or details about the event.
Logging is the most common tool used in observation for most systems and 
applcations. However, it comes with excess of info which makes it difficult
for to use sometimes. logs of previous actions or process carried out by 
systems or application are most likely interwoven with concurrent processes.

Traces: Simply lets you follow a sequence of process carried out step by step
It gives a better understanding of how system and applications carry out a 
specific tasks. Traces allow you to follow operations as they traverse 
through various system and services. This means that we can follow an 
individual request and see it flow through our system. Each trace or step 
comes with a tag known as Trace-Id that can be used to identify a request as
it traverse the system.

Individual events forming a trace are called spans. take for instance we make
an http request:
1. starting from the gateway:  span-1
2. authentication: span-2
3. end-user: span-3
4. database: span-4

Each of the following spans keep track of these details:
1. the start time.
2. duration.
3. parent-id

Metrics: are pure numeric data that are collected from the processes of 
system and services. Just like the logging tool,metrics displays its details
inform of numbers for example,the CPU load of a system,the number of open 
files,http response times,number of errors etc. 
The data collected can be graphed using certain visualization tools,by doing
this, we will be able to pick out trends over a certain duration of time.
Metrics contains four important details:
1. The metric name
2. most recent or current value of the metrics
3. Time stamp shows where when we actually collected this piece of 
information.
4. Dimensions contains additional information about the metric.

Out of the three branches of observability,prometheus falls under the metrics
branch. It's a monitoring tool that is responsible for collecting and 
aggregating metrics.
=============================================================================
SLI/SLO/SLA

Service Level Indicator: In the scope of observability,we would also want to
set certain goals for end users who make most of the interactions with our 
products. Goals such as ensuring that our applications or services have little
or no percentage of down time,high availability,low latency etc. These goals
helps organization strike the right balance between development and operation
work. It also gives xustomers a major hint on what expect from products and
services offered by the organization,like an approach to quantify the level
of reliablity they should expect from a service or product.  
A service level indicator is just a metric used to measure the level of 
service we provide to end users and customers. It is a quantitative measure 
of the service that is being provided.
Some common SLIs are:
* Request latency
* Error rate 
* availability of our service
* Throughput
* Saturation.

These are some level of indicators we use to measure how reliable our service
can be to end users and customers.Companies would at least love to keep an
availability of 98.9% or keep a very low latency rate during the process of
data request or transfer. When choosing an SLI that accurately measures a 
user experience,we wouldn't want to use the amount of memory or cpu consumed
 by our services or applications,this is definitely not a good SLI to measure 
user's experience,We would want to check the request rate,that is,the speed 
of data transfer between our products and costumers. This will help us know
where and how to make improvements. Another SLI we can use is error rate too.
 

 SLO- Service Level Object:
This is more like an objective a product must reach.After measuring customers
reliablity,we can then set an objective for our products to reach. It's a 
target value or range for an SLI.
Here is a simple example:
if we have an 1. SLI - latency,
                 SLO - < 100ms
              2. SLI - Availability
                 SLO - 99.9%

This clearly states that for our SLI latency we want it to be lower than 
100ms and we want our application to have 99.9% availability with a very low
percentage of downtime. The goal of SLO is not to reach a level of perfection
but instead make customers happy with the right level of reliability.

SLA- Service Level Agreement:
This is a contract between a vendor and a user that guarantees a certain 
level of SLO. The conseuence for not meeting an SLO as agreed in the 
contract is financial based,but can also be based on other variety of things 
as well.

Prometheus Use Case
=====================================================================
When we have large numbers of data centers scattered around the globe,or 
services hosted on AWS or other cloud platforms we use prometheus to collect
data from the data-centers or cloud services and represent these datas in a
clean dashboard. 

We can also set prometheus to inform us when our servers have reached a certain 
level of capacity,this will enable us to adjust and create space for incoming
data.These will prevent data loss and save all servers the risk of power 
outage.

We use prometheus to set the average file size and the average latency per
request. Doing this,we can find out why an application refuses to upload 
certain files.We collect the data and plot it in-built prometheus graph.

 PROMETHEUS

Prometheus is an open source monitoring tools that collects metrics data and
provide tools to visualize these data.
It also supports an alerting system that lets users know when a data level is
reached or when metrics reach a specified threshold.
How does prometheus collects data? -In a service or a system,there are targets
created by prometheus to collect metrics.These metrics are collected from an
HTTP exposed endpoints. The scraped metrics can be accessed or queried using
a query language called promQL.The data or metrics are stored in a time-
series database.
Metrics that can be monitored by Prometheus.
CPU/Memory Utilization.
Disk Space
Service Uptime
Application specific Data
*Number of Exceptions
 Latency
 Pending Requests.

There are lots  of usage case of prometheus,It is not limited to servers and
applications.Databases,softwares,platforms and many more use prometheus to
fetch and analyze metrics data.
As we all know that numeric data collected through Observabilty are mostly 
classified as metrics,this technically means that prometheus is a metrics 
data platform and collects data in numeric output alone. It does not collect
Events,logs and traces. 

============================================================================
PROMETHEUS ARCHITECTURE:

The first component is the data retrieval worker,They collect metrics by 
sending http requests to the targets endpoints.
After collecting the metrics,the data needs to be stored somewhere,that's 
right,it's stored in a time series database.

Then the final component is an Http server which we can use to query the
data stored in our TSDB. Users send query using the PROMQL to retrieve data
from our TSDB.


RETRIEVER----->>TSDB--------->HTTP-SERVER.

these are the three main components that make up the prometheus.

There are other components like:
exporters. They convert data collected from targets and converts them into 
metrics that prometheus understands.

 Pushgateway: in a situation where we have shortlived job,there won,t be
enough time to collect the data and convert it into metrics,we use the 
short lived job to push the data to pushgateway. Then prometheus queries 
the data from the pushgateway.

ServiceDiscovery: In a situation where you have large or dynamic setup or
environment,we need to register all these target systems under prometheus.
Thats where we use service discovery like k8s,Ec2,etc.We use service 
discovery to provide list of targets for prometheus to scrape data from.

AlertManager: prometheus triggers the alert when a certain threshold is met,
prometheus pushes the alert to the alert manager.
Prometheus Web Ui: also use for visualising and analysing metrics.

prometheus send request to the http endpoints of the targets using the 
/metrics. However we can configure prometheus to use a different path.

Targets:  =======  :prometheus
/metrics

Systems do not configure the endpoints where prometheus sends requests by 
default,these are done manually,thats where the exporter comes in. The 
exporter collects the data and converts it into /metrics and expose them
in a format required by prometheus.
common types of exporters are nodeexporters Windows mysql apache HaProxy etc.

HOW TO TRACK METRICS:
To be able to track metrics,the data needs to be exposed.We make use of 
client libraries to expose data or application metrics for prometheus to 
track.
Things we can monitor:
1. number of errors.
2. latency of requests
3. Job execution time and many more...

These client libraries support languages such as golang,java,ruby,rust etc.

PULL BASED MODEL.
prom follows a pull based model qhich means it sends request to pull metrics.
In a pushed based model, the target are configured to push the metric data to
the metric server.

benefits of pushed based system:
1.Easier to know when a target is down.
2.push based systems could potentially overload metrics server if too many 
incoming connections.
3.there is a definitive list of targets to monitor creating a central source
of truth.
===========================================================================
Prometheus Node Exporter

A node exporter is an exporter responsible for collecting metrics from a linux 
server and presenting it for prometheus to scrape.
=================================================================================
PROMETHEUS CONFIGURATION
the prometheus configuration is done on the prometheus.yml file found in the 
/etc/prometheus directory. this is where we configure nodes that prometheus 
should scrape data from. it contains rule_files targets alertmanager.this is an
example of promconfig file.



 
global:
 scrape_intervals: 15s #this is a default setting that scrape the target node at an interval of15seconds
 evaluation_interval: 15s #evaluates rules every 15 seconds,the default is every 1min

alerting: 
  alertmanagers:
  - static_configs:
    - targets:
      - alertmanager:9093
#loads rule file once and evaluate them periodically according to the global evaluation_interval.
rule_files:
 - "first_rules.yaml"
 - "second_rules.yaml"
 
scrpe_configs:
 - job_name: "prometheus"
   static_configs: 
    - targets: ["192.138.168.5:9090"]
 - job_name: "scrape_node"
   static_configs:
     - targets: ["12.34.54.32:9090"]
     
     #soon as you add this file into your server,ensure to restart prometheus

===================================================================================
Authentication:
This is a method of securing our arget metrics from being scrapedby outsiders. By 
default prometheus, prometheus scrapes data through node exporters without any 
authentification so setting up authentification secures our metrics from being scraped
by unknown outsiders.There are different ways to do this.
=================================================================================
Encryption: 
This is basically encrypting the traffic that transports packets between our targets
and prometheus. If outsiders get hold of these packets they can be able to read
the data in a plain text format,this is a problem that mere authentication can not 
solve but the use of encryption secures the packets from sniffers.
For encryption,we can use self-signed or certificate authorities like letsEncrypt,
etc.
We can create self-signed certificates and key files,after creating them,we create a
config.yml file in the node_exporter directory under the tls_server_config: block.


tls_server_config:
 cert_file: node_exporter.crt
 key_file: node_exporter.key
 
after passing in the key kand cert file in the config.yaml we can restart the process
of the node_exporter and direct it to use the config.yml file:

"./node_exporter --web.config=config.yaml"

Moving on,create a directory called /etc/node_exporter
move the key,cert,config.yml file into the newly created directory.
change the ownership of the file 
chown -R node_exporter:node_exporter /etc/node_exporter

After that we then cnfigure the node_exporter service to use the directory during
the booth process by adding the
web.config=/etc/node_exporter/config.yml

next,we do a system reload and restart the node_exporter service.

This is just the configuration done on the node_exporter on the target systems. We 
need to configure prometheus server to also carry out authentification process.
First we copy the the cert file into our prometheus server from our node_exporter 
server:
  "scp username:password@node:/etc/node_exporter/node_exporter.crt /etc/prometheus"
then we change the ownership of the file to prometheus user and group 
respectively:
   "chown prometheus:prometheus /etc/node_Exporter.crt"
After doing this we add the tls configuration into the prometheus config file.

  tls_config: 
   ca_file: /etc/prometheus/node_exporter.crt
   insecure_skip_verify: true #in a case of using self-signed certificate

Then we do a system restart prometheus.  
  "systemmctl restart prometheus"


Generate the certificate and key


openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout node_exporter.key -out node_exporter.crt -subj "/C=US/ST=California/L=Oakland/O=MyOrg/CN=localhost" -addext "subjectAltName = DNS:localhost"



Move the crt and key file under /etc/node_exporter/ directory

mv node_exporter.crt node_exporter.key /etc/node_exporter/



Change ownership:


chown nodeusr.nodeusr /etc/node_exporter/node_exporter.key
chown nodeusr.nodeusr /etc/node_exporter/node_exporter.crt



Edit /etc/node_exporter/config.yml file:


vi /etc/node_exporter/config.yml



Add below lines in this file:


tls_server_config:
  cert_file: node_exporter.crt
  key_file: node_exporter.key



Restart node exporter service:


systemctl restart node_exporter
exit



You can verify your changes using curl command:


curl -u prometheus:secret-password -k https://node01:9100/metrics
