#! /bin/bash

# shellcheck disable=SC2046
[ ! -f .env ] || export $(grep -v '^#' .env | xargs) 

# prompt='A dramatic multi-panel manga, grayscale with yellow and red highlights. Feature the text "July 8, 2024" prominently.'
prompt='I'\''m making an eink poster that will show a daily manga scene. There should be the hint of a plot, with drama and resolution in separate panels. Generate the first one. Grayscale, with optional yellow and red highlights.'
prompt='Show a joke.'
time curl https://api.openai.com/v1/images/generations \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d "$(jq -n --arg model "dall-e-3" --arg prompt "$prompt" --arg n 1 --arg size "1024x1024" '{model: $model, prompt: $prompt, n: $n | tonumber, size: $size}')"