import "dotenv/config";
import OpenAI from "openai";

const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
  dangerouslyAllowBrowser: true,
});

const messages = [
  {
    role: "system",
    content:
      "You are a helpful assistant that explains things in language a 10-year-old can understand. Your answers are always less than 100 words.",
  },
  {
    role: "user",
    content: "What is Quantum Computing?",
  },
];

const response = await openai.chat.completions.create({
  model: "gpt-4",
  messages: messages,
});

console.log(response.choices[0].message.content);
