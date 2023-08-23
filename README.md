# 说明

注意针对*补全插件*的选择

- vim-auto-popmenu + vim-dcit (***<u>推荐</u>***)

- ycm

   目前支持 python3 版本的编译 （因为 ycm 用的是最新版本的）

两者**二选一**



# vimart 安装

```shell
git clone https://github.com/Qeuroal/vimart.git
cd ~/vimart
bash ./install.sh
```

**注意**：

需要自己选择安装 ycm 亦或是 vim-auto-popmenu + vim-dcit

> *默认*：vim-auto-popmenu + vim-dcit



# 说明

## 系统支持

- mac
- ubuntu 22.04

## 帮助文件

docs/help.md

# 配置

## vim-dcit 相关

### 添加额外的字典文件

- 字典文件的命名：`<文件类型后缀>.dict`

   如: cpp文件的字典文件 `cpp.dict`

- 字典文件所在位置: `${HOME}/.vim/dict`

   如果没有该文件夹，使用下面的命令创建

   ```bash
   mkdir ${HOME}/.vim/dict
   ```



## ycm 相关

### ycm 安装

#### 在线安装

**全部语言的安装**

```shell
# 进入 ycm 目录
cd ~/.vim/plugged/YouCompleteMe
# 编译
python3 ./install.py --all
```



**c/c++**

```shell
# 进入 ycm 目录
cd ~/.vim/plugged/YouCompleteMe
# 编译
python3 ./install.py --clang-completer
```



**注意**

编译时不要有任何的 python 环境, 就用系统默认启动 shell 时的环境



#### 离线安装

1. **安装完vimart**

   ```shell
   git clone https://github.com/Qeuroal/vimart.git
   cd ~/vimart
   bash ./install.sh
   ```

2. 下载 `vim_empty.tar.gz` 文件

   见 [release](https://github.com/Qeuroal/vimart/releases) 的 ubuntu_vim 版本

   - 方法1：将文件放到 `${HOME}` 下

      查看 `${HOME}`： 在终端输入命令 `echo ${HOME}`

   - 方法2：在当前文件夹下移动到 `${HOME}`

      ```sh
      cp vim_empty.tar.gz ${HOME}/
      ```

3. 安装全部语言支持

   ```shell
   curl -JLO https://raw.githubusercontent.com/Qeuroal/vimart/master/scripts/local_install_ycm.sh
   bash local_install_ycm.sh
   ```





