FROM python
LABEL Name=training Author=Softglacier Project=training
RUN  apt update -y
WORKDIR /data
COPY .  .
RUN export FLASK_APP=app.py
RUN pip install -r requirements.txt
EXPOSE 3000
CMD ["python","./app.py"]
