# pycharm

Docker container to run [PyCharm](https://www.jetbrains.com/pycharm) - Python IDE for Professional Developers

## Usage

```
mkdir -p $HOME/.pycharm/{java,projects}
docker run -d --rm --name pycharm \
       --net="host" \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v /etc/localtime:/etc/localtime \
       -v $HOME/.pycharm:/home/developer/.PyCharmCE2017.3 \
       -v $HOME/.pycharm/java:/home/developer/.java \
       -v $HOME/.pycharm/projects:/home/developer/PycharmProjects \
       dmitrii-ageev/pycharm
```

Docker Hub Page: https://hub.docker.com/r/dmitriiageev/pycharm/

## Notes

The IDE will have access to Python 2 and 3 both, and to Git as well.
Project folders mounted to ~/.pycharm/projects, so change it if you need.

To use pip (or pip3) either use the terminal in PyCharm or install from the terminal from inside the container like 'docker exec -it pycharm bash' then install using pip.
