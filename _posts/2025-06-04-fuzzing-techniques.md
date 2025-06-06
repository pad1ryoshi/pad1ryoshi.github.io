---
layout: post
title: "Fuzzing everything: takenotes"
date: 2025-06-04
categories: blog
author: pad1ryoshi
tags: [fuzzing, bugbounty, tips]
---

## 🐈‍⬛

Hello, I hope you're all well and today I'll show a lot of fuzzing techniques with ffuf.



### Directory Fuzzing

```
ffuf -w wordlist.txt:FUZZ -u SCHEME://HOST:PORT/FUZZ -ic
```

### Extension Fuzzing
```
ffuf -w wordlist.txt:FUZZ -u SCHEME://HOST:PORT/DIRECTORY/indexFUZZ
```
### Page Fuzzing

```
ffuf -w wordlist.txt:FUZZ -u SCHEME://HOST:PORT/DIRECTORY/FUZZ.EXTENSION
```

### Recursive Fuzzing
```
ffuf -w wordlist.txt:FUZZ -u SCHEME://SERVER_IP:PORT/FUZZ -recursion -recursion-depth 1 -v
```
### Subdomain Fuzzing

```
ffuf -w wordlist.txt:FUZZ -u SCHEME://FUZZ.HOST/
```
### Vhost Fuzzing

```
ffuf -w wordlist.txt:FUZZ -u SCHEME://HOST:PORT/ -H 'Host: FUZZ.HOST'
```
### Parameter Fuzzing - GET

```
ffuf -w /wordlist.txt:FUZZ -u SCHEME://HOST:PORT/DIRECTORY/ENDPOINT?FUZZ=key
```
### Parameter Fuzzing - POST

```
ffuf -w wordlist.txt:FUZZ -u SCHEME://HOST:PORT/DIRECTORY/ENDPOINT.php -X POST -d 'FUZZ=key' -H 'Content-Type: application/x-www-form-urlencoded'
```
### Value Fuzzing

```
ffuf -w wordlist.txt:FUZZ -u SCHEME://HOST:PORT/DIRECTORY/ENDPOINT.php -X POST -d 'id=FUZZ' -H 'Content-Type: application/x-www-form-urlencoded'
```
### Fuzzing the all way

```
ffuf -w /root/wordlists/bbFuzzing.txt -H "User-Agent: Mozilla/5.0" -H "Host: localhost" -u http://elearn.ing.ro/FUZZ -fr '/\..*'

ffuf -u target.com/FUZZ -w bbFuzzing.txt
ffuf -u target.com/FUZZ -H "Host: 127.0.0.1" -w bbFuzzing.txt
ffuf -u target.com/FUZZ -H "Host: localhost" -w bbFuzzing.txt

ffuf -u target.com/FUZZ.example -w bbFuzzing.txt
ffuf -u target.com/FUZZ.sample -w bbFuzzing.txt
ffuf -u target.com/FUZZ.template -w bbFuzzing.txt

ffuf -u target.com/FUZZ/ -w bbFuzzing.txt
ffuf -u target.com/%3B/FUZZ/ -w bbFuzzing.txt
ffuf -u target.com/..%3B/FUZZ/ -w bbFuzzing.txt

ffuf -u target.com/FUZZ..%2f -w bbFuzzing.txt
ffuf -u target.com/FUZZ%09 -w bbFuzzing.txt
ffuf -u target.com/FUZZ%23 -w bbFuzzing.txt

ffuf -u target.com/FUZZ..%00 -w bbFuzzing.txt
ffuf -u target.com/FUZZ;%09 -w bbFuzzing.txt
ffuf -u target.com/FUZZ;%09.. -w bbFuzzing.txt

ffuf -u target.com/FUZZ;%09..; -w bbFuzzing.txt
ffuf -u target.com/FUZZ;%2f.. -w bbFuzzing.txt
ffuf -u target.com/.FUZZ -w bbFuzzing.txt

ffuf -u target.com/%0AFUZZ -w bbFuzzing.txt
ffuf -u target.com/%0D%0AFUZZ -w bbFuzzing.txt
ffuf -u target.com/%0DFUZZ -w bbFuzzing.txt

ffuf -u target.com/%2e/FUZZ/ -w bbFuzzing.txt
ffuf -u target.com/FUZZ%20 -w bbFuzzing.txt
ffuf -u target.com/FUZZ%2520 -w bbFuzzing.txt

ffuf -u target.com/%u002e%u002e/%u002e%u002e/FUZZ -w bbFuzzing.txt
ffuf -u target.com/%2e%2e%2f/FUZZ/ -w bbFuzzing.txt
ffuf -u target.com/%2EFUZZ -w bbFuzzing.txt

ffuf -u target.com/FUZZ.old -w bbFuzzing.txt
ffuf -u target.com/FUZZ?.css -w fuzzing.txtffuf -u target.com/FUZZ?.js -w fuzzing.txt

ffuf -u target.com/_FUZZ -w bbFuzzing.tx
ffuf -u target.com/FUZZ_ -w bbFuzzing.txt
ffuf -u target.com/_FUZZ_ -w bbFuzzing.txt

ffuf -u target.com/..;/FUZZ/ -w bbFuzzing.txt
ffuf -u target.com/..;/..;/FUZZ/ -w bbFuzzing.txt
ffuf -u target.com/../FUZZ -w bbFuzzing.txt

ffuf -u target.com/-FUZZ -w bbFuzzing.txt
ffuf -u target.com/~FUZZ -w bbFuzzing.txt
ffuf -u target.com/FUZZ..;/ -w bbFuzzing.txt

ffuf -u target.com/FUZZ;/ -w bbFuzzing.txt
ffuf -u target.com/FUZZ# -w bbFuzzing.txt
ffuf -u target.com/FUZZ/~ -w bbFuzzing.txt

ffuf -u target.com/!FUZZ -w bbFuzzing.txt
ffuf -u target.com/#/FUZZ/ -w bbFuzzing.txt
ffuf -u target.com/-/FUZZ/ -w bbFuzzing.txt

ffuf -u target.com/FUZZ~ -w bbFuzzing.txt
ffuf -u target.com/FUZZ/.git/config -w bbFuzzing.txt
ffuf -u target.com/FUZZ/.env -w bbFuzzing.txt

ffuf -u target.com/FUZZ. -w bbFuzzing.txt
ffuf -u target.com/FUZZ/* -w bbFuzzing.txt
ffuf -u target.com/FUZZ/? -w bbFuzzing.txt

ffuf -u target.com/FUZZ -recursive -w fuzzing.txt
ffuf -u target.com/FUZZ -recursive -w fuzzing.txt -e .asp,.aspx,.ashx,.ash,.jsp,.jspx,.php,.js,.dll,.json,.bak,.bkp,.conf,.txt,.py,.zip,.tar.gz,.tar,.7z,.old
```

### Any special occasions (cookieless) - IIS + ASP
```
ffuf -u target.com/(A(ABCD))/FUZZ
ffuf -u target.com/(ABCD)/FUZZ
ffuf -u target.com/(A(XXXXXXXX)F(YYYYYYYY))/FUZZ
ffuf -u target.com/FUZZ/(S(X))/
ffuf -u target.com/bin::$INDEX_ALLOCATION/FUZZ
ffuf -u target.com/bin::$INDEX_ALLOCATION/FUZZ.dll
ffuf -u target.com/bin::$INDEX_ALLOCATION/FUZZ -e .asp,.aspx,.ashx,.ash,.dll
```

---
### Resources

[ffuf](https://github.com/ffuf/ffuf)

[bbFuzzing.txt](https://github.com/reewardius/bbFuzzing.txt)