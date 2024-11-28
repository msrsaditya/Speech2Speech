# Speech2Speech
A Personal Digital Assistant designed to help you with quick responses.

## Components of a Speech to Speech Software:
- Speech Recorder (records the user's query)
- Speech to Text Converter (converts the query to text)
- AI Response to Text (AI answers the query)
- Text to Speech (The AI answer is converted back to speech again)

## Software Used:
- Sox (SOund eXchange: universal sound sample translator, for Speech Recorder)
- OpenAI Whisper (Speech to Text Converter)
- Phi3 Model (LLM from Microsoft, available with Ollama, for AI Response to Text)
- Mac TTS Engine (available by default on MacOS, for Text to Speech)

###### Note: This setup only works with MacOS, you will have to find alternatives for above mentioned software in other operating systems.

## Installation

#### Install Speech Recorder

```bash
brew install sox
```

#### Install Speech to Text Converter

###### First setup your python environment

```bash
mkdir my_project
cd my_project
```

```bash
python -m venv .venv
```

```bash
source venv/bin/activate
```
###### Now install the software

```bash
pip install git+https://github.com/openai/whisper.git
```

#### Install the AI

```bash
brew install ollama
```

###### Run ollama in background

```bash
ollama serve
```

```bash
ollama pull llama3.2
```

#### Create Modelfile for the AI

```bash
ollama create llama3.2-custom -f ./Modelfile
```

#### Run the script
```
bash Speech2Speech.sh
```

### General Instructions
- The software automatically stops when it detects continued silence, so there's no stop button in recording your speech
- Make sure your voice is loud and clear
- Even after you have stopped talking, if the software continues to listen, press ctrl+c until it terminates (SIGINT)
- The model sometimes hallucinates, so if the software takes too much time in giving you the answer, abort the script and try again
- If you abort the script with keyboard interrupt then some sound files will appear in your directory, they're supposed to be removed at the end of the script, but since we aborted the script abruptly, that didn't happen. But, removing them is safe.
- A typical response on decent hardware will take about 10-12 seconds
- You can use bigger models like llama3 or mistral or bigger whisper models like medium and large for more accurate responses but at the cost of more time and compute
- The current setup is tried and tested for balance between accuracy and speed
- In future, with advances in ml and ai, we will have the same power with these models but with much less compute and time, or even better, we will have so much compute that running these models becomes so cheap. Jinx!
