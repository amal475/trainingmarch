const { Configuration, OpenAIApi } = require("openai");
const configuration = new Configuration({
  apiKey: process.env.OPENAI_API_KEY,
});
const openai = new OpenAIApi(configuration);

const questions = [
  "Comment ecrire hello world ?",
  "Comment ecrire hello world avec un langage   ?",
   "Comment ecrire hello world avec un langage moderne  ?",
   "Comment ecrire hello world avec un langage complexe  ?",
  "hello world est un programme simple ,Comment ecrire hello world avec un langage complexe  ?",


];

let callOpenAi = async (prompt) => {
  const response = await openai.createCompletion({
    model: "text-davinci-003",
    prompt: JSON.stringify(prompt),
    temperature: 0,
    max_tokens: 50 ,
    top_p: 1,
    frequency_penalty: 0,
    presence_penalty: 0,
    best_of: 1
  });
  return response.data.choices[0].text;
}

// async function generateText() {
//   for (const question of questions) {
//     const response = await callOpenAi(question);
//     console.log(`Question: ${question}`);
//     console.log(`Answer: ${response}`);
//     console.log("---------------------");
//   }
// }

// generateText();


const fs = require("fs");

async function generateText() {
  let data = [];

  for (const question of questions) {
    const response = await callOpenAi(question);
    console.log(`Question: ${question}`);
    console.log(`Answer: ${response}`);
    console.log("---------------------");
    data.push({ question, response });
  }

  const csv = data.map((row) => `${row.question},${row.response}`).join("\n");

  fs.writeFile("output.csv", csv, (err) => {
    if (err) {
      console.error(err);
      return;
    }
    console.log("Output saved to output.json");
  });

  const json = JSON.stringify(data);
  const output = fs.createWriteStream("output.jsonl");
// fs.writeFile("output.json", json, "utf8", (err) => {
//   if (err) {
//     console.error(err);
//     return;
//   }
//   console.log("Output saved to output.json");
// });
output.write(json + "\n");
}

generateText();


