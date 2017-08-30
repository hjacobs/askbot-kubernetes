FROM registry.opensource.zalan.do/stups/ubuntu:latest

RUN apt-get update
RUN apt-get install -y python-pip
RUN pip install askbot

RUN mkdir /site
WORKDIR /site
RUN askbot-setup --dir-name=. --db-engine=2 --db-name=db.sqlite --db-user= --db-password=
RUN sed -i "s/ROOT_URLCONF.*/ROOT_URLCONF = 'urls'/" settings.py

RUN python manage.py migrate --noinput
RUN python manage.py collectstatic --noinput

CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
