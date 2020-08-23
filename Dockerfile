FROM php:7.3-apache

# system setting
RUN apt-get update \
    && apt-get -y autoremove \
    && echo 'export LANG=C.UTF-8' >> ~/.bashrc \
    && echo 'export LANGUAGE="C.UTF-8"' >> ~/.bashrc

# install opam (extlib & ocamlfind)
RUN apt-get install -y --no-install-recommends opam \
    && opam init -y --disable-sandboxing \
    && eval `opam config env` \
    && eval $(opam env) \
    && opam update \
    && opam switch \
    && eval $(opam env) \
    && opam install -y extlib ocamlfind \
    && eval $(opam env)

# install haskell (BNFC)
RUN apt-get install -y --no-install-recommends haskell-platform \
    && cabal update \
    && cabal install BNFC \
    && ln -s /root/.cabal/bin/bnfc /usr/local/bin/bnfc

# clear cache
RUN apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*
