import "dotenv/config";

import { HfInference } from "@huggingface/inference";

const hf = new HfInference(process.env.HF_TOKEN);

const textToClassifyPositive =
  "I just bought a new camera. It's the best camera I've ever owned!";

const textToClassifyNegative =
  "I just bought a new camera. It's been a real disappointment.";

// models:
// "SamLowe/roberta-base-go_emotions"
// "distilbert-base-uncased-finetuned-sst-2-english"

const response = await hf.textClassification({
  model: "SamLowe/roberta-base-go_emotions",
  inputs: textToClassifyPositive,
});

console.log(response);
