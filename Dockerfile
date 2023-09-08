
FROM python:3.10

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
# RUN pip install --upgrade -r /code/requirements.txt

COPY . /code/app

# Lưu ý: Port được cấu hình trong lệnh khởi động sau (3500) phải giống Port được cấu hình trong Ingress của Azure Container App

CMD ["uvicorn", "app.api:app", "--host", "0.0.0.0", "--port", "3500"]

# CMD ["gunicorn", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "app.api:app", "-b", "0.0.0.0:3500"]
