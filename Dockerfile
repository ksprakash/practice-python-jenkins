FROM python
LABEL Name=learning Author=Author Project=training
RUN  apt update -y
WORKDIR /data
COPY .  .
RUN export FLASK_APP=app.py
RUN pip install -r requirements.txt
EXPOSE 3000
CMD ["python","./app.py"]
