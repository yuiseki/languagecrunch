FROM python:3.6

# update pip
RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel
ADD requirements.txt /app/requirements.txt
RUN python3.6 -m pip install -r /app/requirements.txt
RUN python3.6 -m pip install "https://github.com/megagonlabs/ginza/releases/download/latest/ginza-latest.tar.gz"
RUN python3.6 -m nltk.downloader wordnet
RUN python3.6 -m textblob.download_corpora

WORKDIR /
ADD src /app

EXPOSE $PORT
CMD python3.6 /app/main.py $PORT
