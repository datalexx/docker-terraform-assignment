Run:
```
$ docker-compose -f stack.yml up --build
```

Test:
```
$ curl localhost:8080 
Hello Fake Product
```

docker-compose output (db connection works, returns current time):
```
[+] Building 0.0s (10/10) FINISHED                                                                
 => [internal] load build definition from Dockerfile                                         0.0s
 => => transferring dockerfile: 419B                                                         0.0s
 => [internal] load .dockerignore                                                            0.0s
 => => transferring context: 67B                                                             0.0s
 => [internal] load metadata for docker.io/library/node:20.0.0                               0.0s
 => [1/5] FROM docker.io/library/node:20.0.0                                                 0.0s
 => [internal] load build context                                                            0.0s
 => => transferring context: 183B                                                            0.0s
 => CACHED [2/5] WORKDIR /usr/src/app                                                        0.0s
 => CACHED [3/5] COPY package*.json ./                                                       0.0s
 => CACHED [4/5] RUN npm install                                                             0.0s
 => CACHED [5/5] COPY . .                                                                    0.0s
 => exporting to image                                                                       0.0s
 => => exporting layers                                                                      0.0s
 => => writing image sha256:d08f613c47a08237fac4620a8c623688d1e98ecda3f69066eabee3df478a403  0.0s
 => => naming to docker.io/library/workday-assignment-app                                    0.0s
[+] Running 2/2
 ✔ Container workday-assignment-db-1   Created                                               0.0s 
 ✔ Container workday-assignment-app-1  Recreated                                             0.0s 
Attaching to workday-assignment-app-1, workday-assignment-db-1
workday-assignment-db-1   | 
workday-assignment-db-1   | PostgreSQL Database directory appears to contain a database; Skipping initialization
workday-assignment-db-1   | 
workday-assignment-db-1   | 2023-04-22 16:53:09.344 UTC [1] LOG:  starting PostgreSQL 15.2 (Debian 15.2-1.pgdg110+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 10.2.1-6) 10.2.1 20210110, 64-bit
workday-assignment-db-1   | 2023-04-22 16:53:09.345 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
workday-assignment-db-1   | 2023-04-22 16:53:09.346 UTC [1] LOG:  could not create IPv6 socket for address "::": Address family not supported by protocol
workday-assignment-db-1   | 2023-04-22 16:53:09.348 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
workday-assignment-db-1   | 2023-04-22 16:53:09.351 UTC [29] LOG:  database system was shut down at 2023-04-22 16:53:01 UTC
workday-assignment-db-1   | 2023-04-22 16:53:09.354 UTC [1] LOG:  database system is ready to accept connections
workday-assignment-app-1  | app started on http://localhost:8080/
workday-assignment-app-1  | null Result {
workday-assignment-app-1  |   command: 'SELECT',
workday-assignment-app-1  |   rowCount: 1,
workday-assignment-app-1  |   oid: null,
workday-assignment-app-1  |   rows: [ { now: 2023-04-22T16:53:09.742Z } ],
workday-assignment-app-1  |   fields: [
workday-assignment-app-1  |     Field {
workday-assignment-app-1  |       name: 'now',
workday-assignment-app-1  |       tableID: 0,
workday-assignment-app-1  |       columnID: 0,
workday-assignment-app-1  |       dataTypeID: 1184,
workday-assignment-app-1  |       dataTypeSize: 8,
workday-assignment-app-1  |       dataTypeModifier: -1,
workday-assignment-app-1  |       format: 'text'
workday-assignment-app-1  |     }
workday-assignment-app-1  |   ],
workday-assignment-app-1  |   _parsers: [ [Function: parseDate] ],
workday-assignment-app-1  |   _types: TypeOverrides {
workday-assignment-app-1  |     _types: {
workday-assignment-app-1  |       getTypeParser: [Function: getTypeParser],
workday-assignment-app-1  |       setTypeParser: [Function: setTypeParser],
workday-assignment-app-1  |       arrayParser: [Object],
workday-assignment-app-1  |       builtins: [Object]
workday-assignment-app-1  |     },
workday-assignment-app-1  |     text: {},
workday-assignment-app-1  |     binary: {}
workday-assignment-app-1  |   },
workday-assignment-app-1  |   RowCtor: null,
workday-assignment-app-1  |   rowAsArray: false
workday-assignment-app-1  | }
```

Tested on:
```
$ docker version
Client:
 Version:           23.0.4
 API version:       1.42
 Go version:        go1.20.3
 Git commit:        f480fb1e37
 Built:             Fri Apr 21 22:05:37 2023
 OS/Arch:           linux/amd64
 Context:           default

Server:
 Engine:
  Version:          23.0.4
  API version:      1.42 (minimum version 1.12)
  Go version:       go1.20.3
  Git commit:       cbce331930
  Built:            Fri Apr 21 22:05:37 2023
  OS/Arch:          linux/amd64
  Experimental:     true
 containerd:
  Version:          v1.7.0
  GitCommit:        1fbd70374134b891f97ce19c70b6e50c7b9f4e0d.m
 runc:
  Version:          1.1.6
  GitCommit:        
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0

$ docker-compose version
Docker Compose version 2.17.2
```
