# Paraphrase API
This is an API for generating paraphrases of a given text use for neutlan project.

### Installation
To install the required dependencies, run the following command:

`pip install -r requirements.txt`

### Usage
To run the API on port 8000, use the following command:

`uvicorn main:paraphraser --host 0.0.0.0 --port 8000`

Once the API is running, you can send a POST request to [http://0.0.0.0:8000/paraphrase](http://0.0.0.0:8000/paraphrase) with a JSON payload containing the text to be paraphrased. Here's an example command using curl:

`curl -X POST -H "Content-Type: application/json" -d '{"text": "Original text goes here."}' http://0.0.0.0:8000/paraphrase`

This will return 30 paraphrases of the given text. To change the number of paraphrases returned, you can modify the num_paraphrases parameter in main.py.

<img width="436" alt="Screen Shot 2023-04-18 at 18 50 03" src="https://user-images.githubusercontent.com/59064089/232832545-f21f3316-6800-4b5a-8c0b-60e26b482adc.png">

Alternatively, you can use the input.py script to input your text and get the paraphrases directly in the console. To run input.py, use the following command:

`python3 input.py`

### Example
**Input:**

```
{
    "text": "Women are bad at engineering."
}
```
**Output:**

`   {'paraphrased_text': ['Women are not good at engineering.', "Women aren't good at engineering.", 'Women are bad at engineering.', "Women don't do well at engineering.", "Women don't like engineering.", 'The women are bad at engineering.', 'There are women who are bad at engineering.', 'Women are not very good at engineering.', 'Women are terrible at engineering.', "Women aren't very good at engineering.", 'The women are not good at engineering.', 'People think women are bad at engineering.', 'People think that women are bad at engineering.', 'Women are not good in engineering.', 'Women are not good at engineering', 'Women are not good at Engineering.', 'Women tend to be bad at engineering.', 'Women do not do well at engineering.', "Women don't do well in engineering.", "Women can't do engineering.", 'Women are poor at engineering.', 'Women are not great at engineering.', 'They are bad at engineering.', 'Women are very bad at engineering.', 'Women are bad at math.', 'Women can be bad at engineering.', 'Women are bad at science.', 'Women are lousy at engineering.', 'People are bad at engineering.', "Women aren't good at Engineering."]}`


_Objective: We aim to find the least sexist paraphrase of the gender-biased sentence._
