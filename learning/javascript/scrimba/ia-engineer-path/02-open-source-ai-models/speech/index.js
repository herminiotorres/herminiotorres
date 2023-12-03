//import dotenv from "dotenv";

//dotenv.config({ path: "./.env" });

import { HfInference } from "@huggingface/inference";

//const hf = new HfInference(process.env.HF_TOKEN);
const hf = new HfInference(import.meta.env.HF_TOKEN);

const text = "It's an exciting time to be an A.I. engineer.";

const response = await hf.textToSpeech({
  model: "espnet/kan-bayashi_ljspeech_vits",
  inputs: text,
});

console.log(response);

const audioElement = document.getElementById("speech");
const speechUrl = URL.createObjectURL(response);
audioElement.src = speechUrl;
