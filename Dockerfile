# FROM python:3.11.3
# ENV PYTHONUNBUFFERED True

# RUN pip install --upgrade pip
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r  requirements.txt

# ENV APP_HOME /root
# WORKDIR $APP_HOME
# COPY /app $APP_HOME/api

# EXPOSE 8080
# CMD ["uvicorn", "api.index:app", "--host", "0.0.0.0", "--port", "8080"]

FROM python:3.9

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt

ENV APP_HOME=/root
WORKDIR $APP_HOME
COPY /api $APP_HOME/api

# remove this line as we don't need a service account key for Cloud Run
# COPY ./serviceAccountKey.json /serviceAccountKey.json

# update the port to be 8080
CMD ["uvicorn", "api.index:app", "--host", "0.0.0.0", "--port", "8080"]