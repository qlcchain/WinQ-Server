<div align="right">Language:
<a title="Chinese" href="README_CN.md">:cn:</a>
<a title="Englisth" href="README.md">:us:</a></div>

# WinQ Server

The WinQ server is used together with the WinQ mobile terminal to solve the problem of mobile terminal asset retention, power consumption, and traffic consumption. The WinQ server maintains the resident of the asset. The user directly connects to the server-side WinQ to use the asset, and the WinQ mobile terminal implements the functions of managing the server asset, such as registering assets and settlement.

## Development Guide
WinQ Server uses the docker deployment method, which can be easily deployed to the cloud server by running scripts. Currently, only the Linux operating system is supported.

### Clone repository and Modify the permissions of the script
```bash
git clone https://github.com/qlcchain/WinQ-Server
cd WinQ-Server
chmod +x *.sh
```

## Run Script
including install docker script, download WinQ docker image, run image and print p2pid script

### install docker

Run `./build.sh` to install docker 

### download WinQ docker image,run image and print p2pid

Run `./start.sh` ,you will receive the following reminder:
- `Enter server's ip or domain[vpn.mydomain]:`,enter your own public IP or domain name.
- `Common Name (eg: your user, host, or server name) [Easy-RSA CA]:`,press the Enter key.

## Bugs/Feedback
If you run into any issues, please use the [GitHub Issue Tracker](https://github.com/qlcchain/WinQ-Server/issues) 
We are continually improving and adding new features based on the feedback you provide, so please let your opinions be known!

## Links & Resources

- [QLC Website](https://qlcchain.org)
- [Discord Chat](https://discord.gg/JnCnhjr)
- [Reddit](https://www.reddit.com/r/Qlink/)
- [Medium](https://medium.com/qlc-chain)
- [Twitter](https://twitter.com/QLCchain)
- [Telegram](https://t.me/qlinkmobile)

## License

MIT
