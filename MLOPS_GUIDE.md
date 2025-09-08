# MLOps Guide for Travel Agent Chat Bot

## MLflow Tracking
- Models and experiments are tracked using MLflow.
- To run training and log results:
  ```bash
  python mlops_pipeline.py
  ```
- To view MLflow UI:
  ```bash
  mlflow ui
  ```
  Visit `http://localhost:5000` (or the port MLflow runs on).

## Automated Training & Deployment
- Use `run_mlops.py` to automate training, evaluation, and deployment.
- The best model is registered in MLflow and can be loaded for serving.

## Serving Latest Model in Flask API
- Update your Flask API to load the latest MLflow model:
  ```python
  import mlflow.pyfunc
  model = mlflow.pyfunc.load_model('models:/TravelChatBot/Production')
  response = model.predict([user_input])
  ```
- Integrate this into `chatbot_core.py` for advanced responses.

## Monitoring
- Use the dashboard in `mlops/dashboards/mlops_monitoring_dashboard.py` to monitor model performance.
- Run:
  ```bash
  python mlops/dashboards/mlops_monitoring_dashboard.py
  ```

## CI/CD
- The GitHub Actions workflow (`.github/workflows/ci-cd.yml`) automates testing, building, and deployment.
- Set up repository secrets for EC2 deployment:
  - `EC2_HOST`: Public IP or DNS of your EC2 instance
  - `EC2_USER`: Username (e.g., ubuntu)
  - `EC2_SSH_KEY`: Private SSH key contents

---

For more advanced MLOps (auto-retraining, model monitoring, rollback), consider using AWS Sagemaker, Lambda, or ECS in future upgrades.
