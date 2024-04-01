# vimart 安装

- make 安装

   ```shell
   git clone https://github.com/Qeuroal/vimart.git
   cd ~/vimart
   make install
   ```

- 脚本安装

   ```shell
   git clone https://github.com/Qeuroal/vimart.git
   cd ~/vimart
   bash ./script/install.sh
   ```

**注意**：

需要自己选择安装 ycm 亦或是 vim-auto-popmenu + vim-dcit

> *默认*：vim-auto-popmenu + vim-dcit

# 系统支持

- mac
- ubuntu
- archlinux
- fedora

# 帮助文件

docs/help.md

# 补全

**注意针对*<u>补全插件</u>*的选择**

- AutoComplPop (**T0**)

   1. 需自己导入词库

- ycm (**T0**)

   1. **需自行配置**
   2. 目前支持 python3 版本的编译 （因为 ycm 用的是最新版本的）
   3. 限制: python版本和vim版本

- vim-auto-popmenu + vim-dcit (**T2**)

   1. bug: 使用vim-auto-popmenu与插件auto-pairs冲突, 导致括号换行不会自动缩进

补全插件**3选1**即可

> 还有其他的补全工具, 暂不支持
>
> - omni-completion and echofunc

## 自定义设置补全方案

1. 编辑 `~/.vimrc.custom.config`
2. 修改 `let g:completeScheme=<n>` (n为方案序号)
3. 安装插件: `:PlugInstall`
4. 清理插件: `:PlugClean`(可选)

## ycm配置

### ycm安装

#### 在线安装

- 全部语言的安装

   ```shell
   # 进入 ycm 目录
   cd ~/.vim/plugged/YouCompleteMe
   # 编译
   python3 ./install.py --all --verbose
   ```

   > 使用 `--all` 参数并不会安装 clangd, 需手动安装: `python3 ./install.py --clangd-completer --verbose`

- 各种语言支持命令

   | 语言                | 命令                                                |
   | -                   | -                                                   |
   | c/c++               | `python3 ./install.py --clang-completer --verbose`  |
   | c/c++(基于实验阶段) | `python3 ./install.py --clangd-completer --verbose` |
   | C#                  | `python3 ./install.py --cs-completer --verbose`     |
   | Go                  | `python3 ./install.py --go-completer --verbose`     |
   | JavaScript          | `python3 ./install.py --ts-completer --verbose`     |
   | Rust                | `python3 ./install.py --rust-completer --verbose`   |
   | Java                | `python3 ./install.py --java-completer --verbose`   |

   > 更多请查看[这里](https://ycm-wiki-zhcn.readthedocs.io/zh-cn/latest/official_doc/intro.html)

- **实例: c/c++**

   ```shell
   # 进入 ycm 目录
   cd ~/.vim/plugged/YouCompleteMe
   # 编译
   python3 ./install.py --clang-completer --verbose
   python3 ./install.py --clangd-completer --verbose
   ```

> **注意**
>
> 编译时不要有任何的 python 环境, 就用系统默认启动 shell 时的环境

#### 离线安装

1. **安装完vimart**

   ```shell
   git clone https://github.com/Qeuroal/vimart.git
   cd ~/vimart
   make install
   ```

   或者

   ```shell
   git clone https://github.com/Qeuroal/vimart.git
   cd ~/vimart
   bash ./scripts/install.sh
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

### Python第三方库补全设置

1. 修改 `~/.ycm_extra_conf.py` 的 PythonSysPath 函数

   > windows系统在 `%USERPROFILE%\.ycm_extra_conf.py`

2. 在 `return sys_path` 前添加如下语句

   ```python
   sys_path.insert(1, '<absolute_path_to_third_party_package>')
   ```

   > Note:
   > - 第三方库的路径使用绝对路径, 如: `sys_path.insert(1, '/opt/anaconda3/lib/python3.10/site-packages')`
   > - 可以将 `sys_path.insert` 函数的 `1` 换成 `0`
   > - 对于相关配置, 已在 `~/.ycm_extra_conf.py` 中写好, 仅需要按照说明修改后, 取消相关行注释即可

# ctags

## 安装 ctags

| 系统   | 命令                                                              |
| ------ | ------                                                            |
| MacOS  | `brew install ctags`                                              |
| Ubuntu | `sudo apt install ctags`<br>或 `sudo apt install exuberant-ctags` |
| CentOS | `sudo yum install ctags`                                          |

## 生成 ctags 文件

在项目根目录运行下面的命令以生成 `ctags` 文件

- 通用/简洁生成指令

   ```bash
   ctags -R .
   ```
    
- 只对特定文件生成 tags: 

   ```bash
   ctags `find -name "*.h"`
   ```

- 针对场景和语言可能需要使用更多的选项

   - C/C++

      ```bash
      ctags --fields=+iaS --extra=+q -R .
      ```

      如果是对系统的头文件生成 tags 文件——可以用来查找函数的原型信息——那我们一般还需要加上 --c-kinds=+p 选项

      [这里](https://github.com/adah1972/gen_systags)有自动生成工具

3. ctags 用法

   - 跳转到定义: `ctrl-]`

   - 跳转回到上一个位置: `ctrl-t`

   - ctags的vim命令及描述

      | 命令                              | 描述                                                                   |
      | :---------------                  | :----------------                                                      |
      | `:ta <name>`/`:tag <name>`        | 跳转到该符号的定义或声明位置                                           |
      | `:ts`/`:tselect`                  | 跟 `:tag` 类似，但会列举可能的匹配项，即显示 tag list, 让你自己选择(而非跳转到第一个匹配位置) |
      | `:tn`/`:tnext`                    | 跳转到下一个标签匹配位置(跳到 list 中的下一个)                         |
      | `:tN`/`:tNext`/`:tp`/`:tprevious` | 跳转到上一个标签匹配位置(跳到 list 中的上一个)                         |
      | `:tf`/`:tfirst`/`:trewind`        | 跳转到第一个标签匹配位置(跳到 list 中的第一个)                         |
      | `:tl`/`:tlast`                    | 跳转到最后一个标签匹配位置(跳到 list 中的最后一个)                     |
      | `<Ctrl+]>`                        | 跳转到该符号的定义或声明位置                                           |
      | `g]`                              | 列出变量的所有引用供用户选择                                           |
      | `g<Ctrl-]>`                       | 跟 `g]` 类似，但跟 `:tjump` 一样在只有一个匹配项时会直接跳转到匹配位置 |
      | `:tj`/`:tjump`                    | 跟 `:tselect` 类似，但在只有一个匹配项的时候会直接跳转到匹配位置       |
      | `:sts`/`:stselect`                | 跟 `:tselect` 类似，但结果会打开到一个新分割的窗口中                   |
      | `:stj`/`:stjump`                  | 跟 `:tjump` 类似，但结果会打开到一个新分割的窗口中                     |
      | `vim –t <name>`                   | 找到名为 name 的变量的定义处                                           |
      | `Ctrl + W + ]`                    | 分割当前窗口，并在新窗口中显示跳转到的定义                             |
      | ~~`:tag`/`:^tag`~~                | 将转到名称以 tag 开头的函数定义，并构建一个列表来导航相关函数          |

      我们的标签跳转分为 `:tag`、`:tselect` 和 `:tjump` 三种不同方法，正常模式和可视模式的命令 `<Ctrl-]>` 也同样有后两种方法的变体，对应的命令分别是 `g]` 和 `g<Ctrl-]>`。这三个命令前面也都可以额外加上 `<Ctrl-W>`，表示结果打开到新窗口中而非当前窗口。

