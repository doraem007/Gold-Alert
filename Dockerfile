FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

COPY database.sql /docker-entrypoint-initdb.d/

CMD ["sh", "-c", "sleep 60 && python main.py & uvicorn api:app --host 0.0.0.0 --port 5000"]
