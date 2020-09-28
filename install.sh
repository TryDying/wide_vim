#!/usr/bin/env zsh

help() {
    echo "-a install all plugins"
    echo "-s install some useful plugins"
    echo "-n not use plugin manager"
    echo "-d copy all configs, not install plug"
}

install_all() {
    cp -u $PWD/vimrc $VIM/vimrc
    echo "ccls"
    cp -u $PWD/coc-settings.json $VIM/coc-settings.json
    cp -au $PWD/config $VIM/
    ln -sf $VIM/vimrc $VIM/init.vim
    echo "Install Plugins"
    vim -u $HOME/.vim/vimrc +PlugInstall! +qall!
    echo "OK"
}

config_without_install() {
    cp -u $PWD/vimrc $VIM/vimrc
    echo "ccls"
    cp -u $PWD/coc-settings.json $VIM/coc-settings.json
    cp -au $PWD/config $VIM/
    ln -sf $VIM/vimrc $VIM/init.vim
    echo "OK"
}

install_simple(){
    cp -u $PWD/vimrc_simple $VIM/vimrc
    ln -sf $VIM/vimrc $VIM/init.vim
    echo "clang"
    echo "PWD="$PWD
    cp -u $PWD/clang_complete $VIM/clang_complete
    echo "Install Plugins"
    vim -u $HOME/.vim/vimrc +PlugInstall! +qall!
    echo "OK"
}

install_no_bundle(){
    echo "No Plugin Manager"
    cp -u $PWD/vimrc_no_bundle $VIM/vimrc
    ln -sf $VIM/vimrc $VIM/init.vim
    cp -u $PWD/clang_complete $VIM/clang_complete
    echo "Install Plugins"
    tar xf $PWD/vim_no_bundle.tgz -C $VIM/
    echo "OK"

}

plug(){
    # curl -flo $VIM/autoload/plug.vim --create-dirs \
    # https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    cp -au $PWD/autoload $VIM/
    cp -au $PWD/plugin $VIM/
    mkdir $VIM/bundle
    cp -au $PWD/bundle $VIM/
}

begin(){
    echo "Configure VIM..."
    export VIM=$HOME/.vim
    export NVIM=$HOME/.config/nvim
    yes | rm -rf $VIM
    mkdir $VIM
    yes | rm -rf $NVIM
    ln -sf $VIM $NVIM
    # cp -au $PWD/snippets $VIM/
    cp -au $PWD/ultisnips $VIM/
}

while getopts "anshd" opt;
do
    case $opt in
        a)
            begin
            plug
            install_all
            exit 1
            ;;
        s)
            begin
            plug
            install_simple
            exit 1
            ;;
        n)
            begin
            install_no_bundle
            exit 1
            ;;
        d)
            begin
            plug
            config_without_install
            exit 1
            ;;
        h)
            help
            exit 1
            ;;
        ?)
            echo "error"
            help
            exit 1
            ;;
    esac
done

