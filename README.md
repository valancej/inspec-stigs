# Inspec STIGs

STIG enforcement checks are typically evaluated against a running container instance via OSCAP or Chef Inspec. With Inspec, running containers are targeted by their container id. Some STIGs can be checked automatically, while others need to be checked manually.

`inspec exec profiles -t docker://<container-id>`

Depending on the STIG, checks are often performed against various artifacts present in the container such as configuration files, file permissions, runtime command outputs, etc.

In the context of a container build and deployment, a user might include a default configuration file in a container build, then deploy the image with additional configuration options described in a configMap in Kubernetes. 

In the example above, an automated build process could be configured to perform the relevant STIG checks at each of the following stages in the SDLC:

1. **SCM**: Default configuration or other static files to be included in the image - Evaluate a collection of STIG checks here against static artifacts such as an `httpd.conf` for Apache.
2. **Image Build**: Deployment artifact - Evaluate a collection of STIG checks against the built image (ex. file permissions)
3. **Deployment**: Additional configuration native to the deployment platform (K8s) - Evaluate a collection of STIG checks against any additional configuration for the deployment artifact (ex. K8s configs)
4. **Runtime**: Running container - Evaluate a collection of STIG checks against the running container. 

## Example STIG (Apache Server 2.4)

https://public.cyber.mil/stigs/downloads/

Categorize the STIG checks:

1. Manual
2. Automated

### Automated

1. SCM
2. Image Build
3. Deployment
4. Runtime

List of total automated checks performed.
List total manual checks required.

**Automated Checks**

These checks will follow the normal automation process and will report accurate STIG compliance PASS/FAIL.

**Types of checks**: 

- Application/software configuration (ex. `httpd.conf`)
- Build instructions (Dockerfile)
- Build Artifact (Image)
- Deployment configuration (k8s yaml)
- Runtime (container id)

**Note**: Application configuration will likely occur in two places in the SDLC (SCM and deployment)
                                                                                

### Build and deploy process

1. Checkout repo
2. STIG checks against configuration file and other relevant artifacts present in SCM
3. Build container image
4. STIG checks against image artifact
5. Create deployment configuration
6. STIG checks against deployment configuration
7. Deploy container
8. STIG checks against running container