FROM python:3.7
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE $PORT
# CMD waitress-serve --listen=127.0.0.1:$PORT app:app
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app
# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]