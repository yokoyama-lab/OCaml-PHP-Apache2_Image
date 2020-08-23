# OCaml-PHP-Apache2_Image
Dockerfile for Apache2 Server with OCaml. 

## Usage
Run the following command in your repository to create the docker container.
```
docker build -t <image name> .
docker run -it -d --name php-ocaml-container <image name>
```

After build completely finishes, enter in a Docker container to set path to opam.
```
docker exec -i -t php-ocaml-container bash
eval $(opam env)
```

### Note
- Document root of this image is `/var/www/html` .
- If `ocamlyacc: command not found` appear on the screen, run `eval $(opam env)` first.

## Example
```
docker build -t OCaml-PHP-Apache-container .

docker run -it -d --name OCaml-PHP-Apache-container -v /foo/var:/var/www/html -p 80:80 OCaml-PHP-Apache-container
```
