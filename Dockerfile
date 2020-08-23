FROM php:7.3-apache

# システム設定
RUN apt-get update \
    && apt-get -y autoremove \
    && echo 'export LANG=C.UTF-8' >> ~/.bashrc \
    && echo 'export LANGUAGE="C.UTF-8"' >> ~/.bashrc

# opamをインストール
RUN apt-get install -y --no-install-recommends opam \
    && opam init -y --disable-sandboxing \
    && eval `opam config env` \
    && eval $(opam env) \
    && opam update \
    && opam switch \
    && eval $(opam env) \
    && opam install -y extlib ocamlfind \
    && eval $(opam env)

# haskellをインストール
RUN apt-get install -y --no-install-recommends haskell-platform \
    && cabal update \
    && cabal install BNFC \
    && ln -s /root/.cabal/bin/bnfc /usr/local/bin/bnfc

# キャッシュを削除
RUN apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*
