needed json-server from npm

change ip to local server in router

ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: enp5s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 10:ff:e0:0f:92:5b brd ff:ff:ff:ff:ff:ff
    altname enx10ffe00f925b
    inet 192.168.2.102/24 metric 100 brd 192.168.2.255 scope global dynamic enp5s0 --> IP WILL BE HERE
       valid_lft 86132sec preferred_lft 86132sec
    inet6 2804:13d0:9b8e:cb00:12ff:e0ff:fe0f:925b/64 scope global dynamic mngtmpaddr noprefixroute 
       valid_lft 253657sec preferred_lft 167257sec
    inet6 fe80::12ff:e0ff:fe0f:925b/64 scope link proto kernel_ll 
       valid_lft forever preferred_lft forever
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
    link/ether 2a:1e:3b:1d:fa:dd brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever