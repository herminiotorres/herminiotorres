import "dotenv/config";

import { HfInference } from "@huggingface/inference";

const hf = new HfInference(process.env.HF_TOKEN);

const textToGenerate = "The definition of machine learning inference is ";

const response = await hf.textGeneration({
  inputs: textToGenerate,
  model: "HuggingFaceH4/zephyr-7b-beta",
});

console.log(response);
