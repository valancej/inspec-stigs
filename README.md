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

| Check Number | Description | Type of check |
|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------|
| V-92597      | Apache web server management includes the ability to control the number of users and user sessions that utilize an Apache web server. Limiting the number of allowed users and sessions per user is helpful in limiting risks related to several types of denial-of-service (DOS) attacks. | App config |
| V-92599      | Session management is the practice of protecting the bulk of the user authorization and identity information. This data can be stored on the client system or on the server.                                                                                                               | App config |
| V-92601      | The Apache web server must use cryptography to protect the integrity of remote sessions.                                                                                                                                                                                                   | App config |
| V-92607      | The Apache web server must have system logging enabled.                                                                                                                                                                                                                                    | App config |
| V-92609      | The Apache web server must generate, at a minimum, log records for system startup and shutdown, system access, and system authentication events.                                                                                                                                           | App config |
| V-92629      | The Apache web server log files must only be accessible by privileged users.                                                                                                                                                                                                               | App config |
| V-92631      | The log information from the Apache web server must be protected from unauthorized modification or deletion.                                                                                                                                                                               | App config |
| V-92639      | The Apache web server must not perform user management for hosted applications.                                                                                                                                                                                                            | App config |
| V-92643      | The Apache web server must not be a proxy server.                                                                                                                                                                                                                                          | App config |
| V-92653      | The Apache web server must have resource mappings set to disable the serving of certain file types.                                                                                                                                                                                        | App config |
| V-92659      | The Apache web server must have Web Distributed Authoring (WebDAV) disabled.                                                                                                                                                                                                               | Runtime |
| V-92661      | The Apache web server must be configured to use a specified IP address and port.                                                                                                                                                                                                           | App config |
| V-92677      | The Apache web server must invalidate session identifiers upon hosted application user logout or other session termination.                                                                                                                                                                | App config |
| V-92679      | Cookies exchanged between the Apache web server and client, such as session cookies, must have security settings that disallow cookie access outside the originating Apache web server and hosted application.                                                                             | App config |
| V-92687      | The Apache web server must generate a session ID long enough that it cannot be guessed through brute force.                                                                                                                                                                                | App config |
| V-92689      | The Apache web server must generate a session ID using as much of the character set as possible to reduce the risk of brute force.                                                                                                                                                         | Runtime |
| V-92697      | The Apache web server must be tuned to handle the operational requirements of the hosted application.                                                                                                                                                                                      | App config |
| V-92699      | Warning and error messages displayed to clients must be modified to minimize the identity of the Apache web server, patches, loaded modules, and directory paths.                                                                                                                          | App config |
| V-92701      | Debugging and trace information used to diagnose the Apache web server must be disabled.                                                                                                                                                                                                   | App config |
| V-92705      | The Apache web server must set an inactive timeout for sessions.                                                                                                                                                                                                                           | App config, runtime |
| V-92723      | The Apache web server must generate log records that can be mapped to Coordinated Universal Time (UTC) or Greenwich Mean Time (GMT) which are stamped at a minimum granularity of one second.                                                                                              | App config, runtime |
| V-92731      | The Apache web server must be protected from being stopped by a non-privileged user.                                                                                                                                                                                                       | Image, runtime |
| V-92741      | Cookies exchanged between the Apache web server and the client, such as session cookies, must have cookie properties set to prohibit client-side scripts from reading the cookie data.                                                                                                     | App config |
| V-92745      | The Apache web server must remove all export ciphers to protect the confidentiality and integrity of transmitted information.                                                                                                                                                              | App config |
| V-92749      | The Apache web server must install security-relevant software updates within the configured time period directed by an authoritative source (e.g., IAVM, CTOs, DTMs, and STIGs).                                                                                                           | Image, runtime |
| V-92755      | The Apache web server software must be a vendor-supported version.                                                                                                                                                                                                                         | Image, runtime |
| V-92757      | The Apache web server htpasswd files (if present) must reflect proper ownership and permissions.                                                                                                                                                                                           | Image, runtime |
| V-92759      | HTTP request methods must be limited.                                                                                                                                                                                                                                                      | App config |
                                                                                

### Build and deploy process

1. Checkout repo
2. STIG checks against configuration file and other relevant artifacts present in SCM
3. Build container image
4. STIG checks against image artifact
5. Create deployment configuration
6. STIG checks against deployment configuration
7. Deploy container
8. STIG checks against running container