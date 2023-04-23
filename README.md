# neutlan.model.deployment

Classification and paraphrase models

Deploy models via 

```
make
```
CNN_PATH="$(dirname "$0")/classification"
docker run -p 8501:8501 --name tfserving_cnn --mount type=bind,source=$(pwd)/cnn/1,target=/models/cnn/1 -e MODEL_NAME=cnn -t tensorflow/serving:latest &