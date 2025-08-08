FROM python:3.12-slim
RUN useradd -m appuser
WORKDIR /app
COPY app/requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt
COPY app /app
USER appuser
EXPOSE 8080
CMD ["python", "/app/app.py"]
