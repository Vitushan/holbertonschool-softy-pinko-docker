FROM python:3
RUN pip3 install flask
WORKDIR /app
COPY  task0 /app/task0
COPY  api.py /app/api.py
EXPOSE 5252
CMD ["python3", "api.py"]