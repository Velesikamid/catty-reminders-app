FROM python:3.12

WORKDIR /catty-reminders-app

COPY requirements.txt .
RUN pip install -r requirements.txt

ARG DEPLOY_REF=unknown
ENV DEPLOY_REF=${DEPLOY_REF}

COPY . .

EXPOSE 8181

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8181"]
