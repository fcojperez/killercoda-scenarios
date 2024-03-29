<br>


Create a pod named `redis-pod` that uses the image `redis:7` and exposes port `6379` . Use the command `redis-server /redis-master/redis.conf` to store redis configuration and store data in an `emptyDir` volume.

Mount the `redis-config` configmap data to the pod for use within the container.


<details><summary>Solution</summary>
<br>

#### Creating pod file
We create a yaml file called `redis-pod.yaml` by executing the command below: 

```bash
kubectl run redis-pod --image=redis:7 --port=6379 --dry-run=client -oyaml -- redis-server /redis-master/redis.conf > redis-pod.yaml
```

#### Adding volume configuration

We had this section to below to file `redis-pod.yaml`

* At container configuration we add the volume mounted
```yaml
    volumeMounts:
    - mountPath: /redis-master-data
      name: data
    - mountPath: /redis-master
      name: config
```

* At volumes configuration we add a data and config volume
```yaml
  volumes:
    - name: data
      emptyDir: {}
    - name: config
      configMap:
        name: redis-config
        items:
        - key: redis-config
          path: redis.conf
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```

#### Final pod file
Finally, we integrate all snippet above into file `redis-pod.yaml`

```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: redis-pod
  name: redis-pod
spec:
  containers:
  - args:
    - redis-server
    - /redis-master/redis.conf
    image: redis:7
    name: redis-pod
    ports:
    - containerPort: 6379
    resources: {}
    volumeMounts:
    - mountPath: /redis-master-data
      name: data
    - mountPath: /redis-master
      name: config
  volumes:
    - name: data
      emptyDir: {}
    - name: config
      configMap:
        name: redis-config
        items:
        - key: redis-config
          path: redis.conf
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```
</details>