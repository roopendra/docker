# docker
CMD vs ENTRYPOINT
----------------------

CMD: Sets default parameters that can be overridden from the Docker Command Line Interface (CLI) when a container is running.

ENTRYPOINT: Default parameters that cannot be overridden when Docker Containers run with CLI parameters.

To demonostrate this I have created two docker file ab_cmd.Dockerfile and ab_entrypoint.Dockerfile

docker build -f ab_cmd.Dockerfile -t ab_cmd .  
docker build -f ab_entrypoint.Dockerfile -t ab_entrypoint .

Launch Docker Containers 

```
$ docker run ab_cmd
ab: wrong number of arguments
Usage: ab [options] [http[s]://]hostname[:port]/path
Options are:
    -n requests     Number of requests to perform
    -c concurrency  Number of multiple requests to make at a time

$ docker run ab_entrypoint
ab: wrong number of arguments
Usage: ab [options] [http[s]://]hostname[:port]/path
Options are:
    -n requests     Number of requests to perform
    -c concurrency  Number of multiple requests to make at a time
```

We can override whole ab command using CMD

```
$ docker run ab_cmd ab http://google.com/
This is ApacheBench, Version 2.3 <$Revision: 1430300 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking google.com (be patient).....done


Server Software:        gws
Server Hostname:        google.com
Server Port:            80

Document Path:          /
Document Length:        219 bytes

Concurrency Level:      1
Time taken for tests:   0.481 seconds
Complete requests:      1
Failed requests:        0
Write errors:           0
Non-2xx responses:      1
Total transferred:      528 bytes
HTML transferred:       219 bytes
Requests per second:    2.08 [#/sec] (mean)
Time per request:       481.425 [ms] (mean)
Time per request:       481.425 [ms] (mean, across all concurrent requests)
Transfer rate:          1.07 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:      329  329   0.0    329     329
Processing:   153  153   0.0    153     153
Waiting:      153  153   0.0    153     153
Total:        481  481   0.0    481     481
```

We can't override the whole ENTRYPOINT like we did with CMD

```
$ docker run ab_entrypoint http://google.com/
This is ApacheBench, Version 2.3 <$Revision: 1430300 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking google.com (be patient).....done


Server Software:        gws
Server Hostname:        google.com
Server Port:            80

Document Path:          /
Document Length:        219 bytes

Concurrency Level:      1
Time taken for tests:   0.167 seconds
Complete requests:      1
Failed requests:        0
Write errors:           0
Non-2xx responses:      1
Total transferred:      528 bytes
HTML transferred:       219 bytes
Requests per second:    6.00 [#/sec] (mean)
Time per request:       166.632 [ms] (mean)
Time per request:       166.632 [ms] (mean, across all concurrent requests)
Transfer rate:          3.09 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:       37   37   0.0     37      37
Processing:   129  129   0.0    129     129
Waiting:      129  129   0.0    129     129
Total:        167  167   0.0    167     167
```
