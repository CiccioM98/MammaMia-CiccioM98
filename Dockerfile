
FROM python:3.11-slim-bookworm

WORKDIR /app

ADD . /app

RUN apt-get update && \
    apt-get install -y tesseract-ocr libtesseract-dev nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir pytesseract mediaflow-proxy

EXPOSE 8080

CMD ["python", "run.py"]
