FROM python:3.11.0
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip3 install -r /app/requirements.txt
COPY ./ /app/
EXPOSE 25

CMD ["python", "main.py"]