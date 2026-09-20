# Lesson 09 — Enterprise Server Preparation

## Objective

This lesson introduces the deployment concepts associated with Micro Focus Enterprise Server.

The exercise prepares a COBOL application locally for a deployment-style workflow while clearly separating the local GnuCOBOL environment from an actual Enterprise Server runtime.

## Application

The application is a simple COBOL program:

* **Program:** `ES-DEMO`
* **Source:** `ES-DEMO.CBL`
* **Build environment:** GnuCOBOL 3.2
* **Local executable:** `es-demo`

The program displays application and execution status information and returns a successful return code.

## Local Execution

The program was compiled and executed locally using GnuCOBOL.

Example build command:

```bash
cobc -x -free \
    -o lessons/09-enterprise-server/es-demo \
    lessons/09-enterprise-server/ES-DEMO.CBL
```

The program completed successfully with:

```text
STATUS:      COMPLETED
APPLICATION EXECUTION COMPLETED
```

The operating-system return code was:

```text
0
```

## Deployment Preparation

The `prepare-deployment.sh` script validates that the COBOL source and executable exist and then prepares a local deployment package.

The package contains:

```text
deployment/
├── ES-DEMO.CBL
├── es-demo
└── deployment-manifest.txt
```

The manifest documents the application, entry point, source file, executable, build environment, and deployment status.

The deployment status is explicitly recorded as:

```text
PREPARED LOCALLY
```

This distinction is important because the exercise does not perform an actual deployment to a Micro Focus Enterprise Server region.

## Enterprise Server Concept

Micro Focus Enterprise Server provides an execution environment for COBOL applications and can support enterprise workloads involving technologies such as JCL and CICS. A typical workflow includes building an application, configuring the target server environment, deploying the application, and executing it through the Enterprise Server environment.

Conceptually:

```text
COBOL Source
     |
     v
Build / Compile
     |
     v
Deployment Preparation
     |
     v
Enterprise Server
     |
     v
Application Execution
     |
     v
Runtime Status / Return Code
```

In this lesson, the first three stages are demonstrated locally.

## Local vs. Enterprise Environment

### Local exercise

```text
macOS
  |
  v
GnuCOBOL 3.2
  |
  v
ES-DEMO.CBL
  |
  v
Local executable
  |
  v
Execution
```

### Enterprise Server concept

```text
COBOL Application
       |
       v
Build
       |
       v
Deployment
       |
       v
Enterprise Server Region
       |
       v
Application Execution
```

The local exercise should not be considered a substitute for a real Enterprise Server installation or deployment environment.

## Files

```text
09-enterprise-server/
├── ES-DEMO.CBL
├── README.md
├── prepare-deployment.sh
└── deployment/
    ├── ES-DEMO.CBL
    └── deployment-manifest.txt
```

The generated executable files are excluded from Git because they are build artifacts.

## What I Practiced

* COBOL application execution
* Return-code handling
* Build artifact preparation
* Deployment-oriented file organization
* Application manifests
* Separation between source code and build artifacts
* Enterprise Server deployment concepts
* Difference between local COBOL execution and an enterprise runtime environment

## Mainframe Relevance

In an enterprise COBOL environment, application execution is commonly separated from the developer's source-code workspace.

Applications may be built, packaged, deployed to a managed runtime environment, and then executed under services that provide the required runtime infrastructure.

Understanding this separation is useful when working with COBOL applications in environments such as Micro Focus Enterprise Server.
