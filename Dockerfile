FROM ocaml/opam2:ubuntu

# システムの文字コード指定
RUN sudo apt-get update -y \
    && echo 'export LANG=C.UTF-8' >> ~/.bashrc \
    && echo 'export LANGUAGE="C.UTF-8"' >> ~/.bashrc

# opam 
RUN sudo apt-get install m4 -y --no-install-recommends \
    && opam init \
    && opam update \
    && opam switch \
    && eval $(opam env) \
    && eval `opam config env` \
    && opam install extlib ocamlfind -y \
    && exec $SHELL -l \
    && eval $(opam env)

# haskellをインストール
RUN sudo apt-get install -y haskell-platform --no-install-recommends \
    && cabal update \
    && cabal install BNFC \
    && sudo ln -s /home/opam/.cabal/bin/bnfc /usr/bin/bnfc

# キャッシュを削除
RUN sudo apt-get -y clean \
    && sudo rm -rf /var/lib/apt/lists/*
