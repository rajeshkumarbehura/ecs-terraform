# Create One cluster with 2 Services in AWS ECS

Here 2 services means, you can run 2 different application in 1 cluster. 

Deploy 2 different application in 1 ECS cluster.

1. It has 2 different auto scaling.
2. It has 2 application load balancer for 2 services. 
3. Define application in ECR link in variables.app_image

This document may not be perfect, but it tested well. Spend sometime to understand the code.