import torch
from fastapi import FastAPI
import uvicorn
from transformers import PegasusForConditionalGeneration, PegasusTokenizer
import logging

paraphraser = FastAPI()

model_name = 'tuner007/pegasus_paraphrase'
torch_device = 'cuda' if torch.cuda.is_available() else 'cpu'
tokenizer = PegasusTokenizer.from_pretrained(model_name)
model = PegasusForConditionalGeneration.from_pretrained(model_name).to(torch_device)
print("hello")
logging.warning("elloq")

@paraphraser.post("/paraphrase")
async def paraphrase(data: dict):
    text = data['text']
    torch_device = 'cuda' if torch.cuda.is_available() else 'cpu'
    batch = tokenizer([text], truncation=True, padding='longest', max_length=60, return_tensors="pt").to(torch_device)
    translated = model.generate(**batch, max_length=60, num_beams=30, num_return_sequences=30, temperature=1.5)
    tgt_text = tokenizer.batch_decode(translated, skip_special_tokens=True)
    return {"paraphrased_text": tgt_text}


if __name__ == '__main__':
    uvicorn.run(paraphraser, host='0.0.0.0', port=8000)