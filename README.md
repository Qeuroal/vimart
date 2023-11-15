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

# 补全

注意针对*补全插件*的选择

- vim-auto-popmenu + vim-dcit (***<u>推荐</u>***)

- ycm

   目前支持 python3 版本的编译 （因为 ycm 用的是最新版本的）

两者**二选一**

还有其他的补全工具, 暂不支持

- omni-completion and echofunc

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
python3 ./install.py --all --verbose
```

**c/c++**

```shell
# 进入 ycm 目录
cd ~/.vim/plugged/YouCompleteMe
# 编译
python3 ./install.py --clang-completer --verbose
```

**注意**

编译时不要有任何的 python 环境, 就用系统默认启动 shell 时的环境

#### ~~离线安装~~

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

# ctags

## 安装 ctags

| 系统   | 命令                     |
| ------ | ------                   |
| MacOS  | `brew install ctags`     |
| Ubuntu | `sudo apt install ctags`<br>或 `sudo apt install exuberant-ctags` |
| CentOS | `sudo yum install ctags` |

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
        | `vi –t tag`                       | 找到名为 tag 的变量的定义处                                            |
        | `Ctrl + W + ]`                    | 分割当前窗口，并在新窗口中显示跳转到的定义                             |
        | `:ta <name>`/`:tag <name>`        | 跳转到该符号的定义或声明位置                                           |
        | `:tag`/`:^tag`                    | 将转到名称以 tag 开头的函数定义，并构建一个列表来导航相关函数          |

        我们的标签跳转分为 `:tag`、`:tselect` 和 `:tjump` 三种不同方法，正常模式和可视模式的命令 `<Ctrl-]>` 也同样有后两种方法的变体，对应的命令分别是 `g]` 和 `g<Ctrl-]>`。这三个命令前面也都可以额外加上 `<Ctrl-W>`，表示结果打开到新窗口中而非当前窗口。

### ~~Tagbar 插件~~

Ctags 是一个可以从源代码中提取符号的工具。事实上，这个工具在我们不生成 tags 文件也都是有用的。Vim 的插件 tagbar 就可以利用 Ctags 来提取符号，生成源代码的结构图。只要 Ctags 能支持这种语言，插件就能“识别” 这种语言，来生成结构图；识别的好坏程度也视 Ctags 对其的支持程度而定

```
Plug 'majutsushi/tagbar'
```

