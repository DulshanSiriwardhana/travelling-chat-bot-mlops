FROM python:3.12-slim

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

# Expose both ports
EXPOSE 5000 7000

# Run both apps
CMD python app.py & python travel_chatbot_app.py
