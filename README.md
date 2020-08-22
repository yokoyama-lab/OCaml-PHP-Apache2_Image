# OCaml-PHP-Apache2_Image
Dockerfile for Apache2 Server with OCaml. 

## Usage
In OCaml-PHP-Apache2_Image directory.
```Console:
docker build -t <name of container>:<ver> .
docker run -it -d --name php-ocaml-container <name of image>:<ver>
```

```
docker exec -i -t php-ocaml-container bash
eval $(opam env)
```

コンテナビルド後に `eval $(opam env)` を実行し `ocamlyacc` 及び `ocamlfind` のpathを通す必要がある。(なぜかRUNで出来なかったので調査します)
