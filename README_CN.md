<div align="right">语言:
<a title="中文" href="README_CN.md">:cn:</a>
<a title="英文" href="README.md">:us:</a></div>

# WinQ 服务端

WinQ服务端与WinQ移动端一起使用，以解决移动端资产常驻，功耗和流量消耗的问题。WinQ服务端维护资产的驻留。 用户直接连接到服务端WinQ以使用资产，WinQ移动端实现管理服务端资产的功能，例如注册资产和结算。

## 开发指导
WinQ 服务端使用docker部署方法，可以通过运行脚本轻松部署到云服务器。目前，仅支持Linux操作系统。

###克隆仓库并修改脚本权限
```bash
git clone https://github.com/qlcchain/WinQ-Server
cd WinQ-Server
chmod +x *.sh
```

## 运行脚本
包括安装docker脚本，下载WinQ docker镜像，运行镜像以及打印p2pid脚本。

### 安装docker

运行 `./build.sh` 来安装docker 

### 下载WinQ docker镜像，运行镜像以及打印p2pid脚本。

运行 `./start.sh` ,你将会收到以下提示:
- `Common Name (eg: your user, host, or server name) [Easy-RSA CA]:`,按回车键即可。

## 故障反馈
遇到任何问题，请试用  [GitHub Issue Tracker](https://github.com/qlcchain/WinQ-Server/issues) 
我们会依照您的反馈持续改进使用体验和添加新功能，请让知道您的想法！

## 链接& 资源

- [QLC Website](https://qlcchain.org)
- [Discord Chat](https://discord.gg/JnCnhjr)
- [Reddit](https://www.reddit.com/r/Qlink/)
- [Medium](https://medium.com/qlc-chain)
- [Twitter](https://twitter.com/QLCchain)
- [Telegram](https://t.me/qlinkmobile)

## 证书

MIT
